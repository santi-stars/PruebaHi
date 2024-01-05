using System;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics;
using System.Diagnostics.Metrics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

public class Program
{
    public bool todos = true;
    public int contadorFK = 0;

    #region PATH
    //private string inputPath = "C:\\Users\\santi\\Desktop\\dbo.FacturasProformaMODIFIED.Table.sql";
    private string inputMultiPath = "C:\\Users\\santi\\Desktop\\unoAuno\\";
    private string inputPath = "C:\\Users\\santi\\Desktop\\unoAuno\\dbo.GlobalRelTipologiaPerfil.Table.sql";
    private string outputPath = "C:\\Users\\santi\\Desktop\\archivo_salida.csv";
    #endregion PATH

    #region REGEX
    // TABLE NAME
    private string tableNamePattern = @"\[dbo\]\.\[(.*?)\]";
    // COLUMNS
    private string columnPattern = @"\[(.*?)\]\s+\[(.*?)\](\s+IDENTITY\(\d+,\d+\))?(\((.*?)\))?\s*(NULL|NOT NULL)";
    // PK
    private string primaryKeyPattern = @"PRIMARY KEY\s+CLUSTERED\s*\(([^)]+)\)";
    // FK - WITH CHECK ADD CONSTRAINT [x] FOREIGN KEY [x] REFERENCEs [x]                                                                                      \[dbo\]\.\[(.*?)\]\s*\((.*?)\)";
    private string fkWithCheckAddConstPattern = @"ALTER TABLE \[dbo\]\.\[(.*?)\]\s+WITH\s+CHECK\s+ADD\s+CONSTRAINT\s+\[(.*?)\]\s+FOREIGN KEY\s*\((.*?)\)\s*REFERENCES\s+\[dbo\]\.\[(.*?)\]\s*\((.*?)GO";
    // FK - WITH NOCHECK ADD CONSTRAINT [x] FOREIGN KEY [x] REFERENCEs [x]
    private string fkWithNoCheckAddConstPattern = @"ALTER TABLE \[dbo\]\.\[(.*?)\]\s+WITH\s+NOCHECK\s+ADD\s+CONSTRAINT\s+\[(.*?)\]\s+FOREIGN\s+KEY\s*\((.*?)\)\s*REFERENCES\s+\[dbo\]\.\[(.*?)\]\s*\((.*?)GO";
    // FK - WITH CHECK ADD FOREIGN KEY [x] REFERENCEs [x]
    private string fkWithCheckPattern = @"ALTER TABLE \[dbo\]\.\[(.*?)\]\s+WITH CHECK ADD\s+FOREIGN\s+KEY\s*\((.*?)\)\s*REFERENCES\s+\[dbo\]\.\[(.*?)\]\s*\((.*?)\)";
    // FK - WITH NOCHECK ADD FOREIGN KEY [x] REFERENCEs [x]
    private string fkWithNoCheckPattern = @"ALTER TABLE \[dbo\]\.\[(.*?)\]\s+WITH\s+NOCHECK\s+ADD\s+FOREIGN\s+KEY\s*\((.*?)\)\s*REFERENCES\s+\[dbo\]\.\[(.*?)\]\s*\((.*?)\)";
    // DEFAULT - ADD CONSTRAINT [x] DEFAULT(x) FOR [x]
    private string defaultConstraintPattern = @"ALTER TABLE \[dbo\]\.\[(.*?)\] ADD\s+CONSTRAINT \[(.*?)\]\s+DEFAULT \((.*?)\) FOR \[(.*?)\]";
    // DEFAULT - ADD DEFAULT(x) FOR [x]
    private string defaultPattern = @"ALTER TABLE \[dbo\]\.\[(.*?)\]\s+ADD(?:\s+CONSTRAINT \[.*?\])?\s+DEFAULT \((.*?)\) FOR \[(.*?)\]";
    // CHECK - WITH CHECK ADD [x] CONSTRAINT CHECK [x]
    private string checkConstPattern = @"CHECK\s+\(\((.*?)\)\)\s+GO";
    #endregion REGEX
    private void OpenFile()
    {
        try
        {
            if (File.Exists(outputPath)) File.Delete(outputPath);   // Borrar cuando no se hagan pruebas

            using StreamWriter writer = new(outputPath);
            using StreamReader reader = new(inputPath, Encoding.GetEncoding("ISO-8859-1"));
            SimpleFileSqlAnalizer(reader.ReadToEnd(), writer);
            Console.WriteLine($"Archivo {inputPath} analizado correctamente.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al analizar el archivo {inputPath}: {ex.Message}");
        }
    }
    private void OpenMultiFiles()
    {
        try
        {
            string[] sqlFiles = Directory.GetFiles(inputMultiPath, "*.sql");
            if (File.Exists(outputPath)) File.Delete(outputPath);   // Borrar cuando no se hagan pruebas

            if (sqlFiles.Length > 0)
            {
                using (StreamWriter writer = new(outputPath))
                {
                    foreach (string sqlFile in sqlFiles)
                        using (StreamReader reader = new(sqlFile, Encoding.GetEncoding("ISO-8859-1")))
                            try
                            {
                                SimpleFileSqlAnalizer(reader.ReadToEnd(), writer);
                                Console.WriteLine($"Archivo {sqlFile} analizado correctamente.");
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine($"Error al analizar el archivo {sqlFile}: {ex.Message}");
                            }
                }
                Console.WriteLine("Se han analizado todos los archivos .sql en la carpeta.");
            }
            else Console.WriteLine("No se encontraron archivos .sql en la carpeta.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al abrir los archivos: {ex.Message}");
        }
    }
    private void SimpleFileSqlAnalizer(string content, StreamWriter writer)
    {

        var defaultConstraintMatches = Regex.Matches(content, defaultConstraintPattern);
        var defaultMatches = Regex.Matches(content, defaultPattern);
        var defaultConstraints = new Dictionary<string, string>();

        foreach (Match match in defaultConstraintMatches)
        {
            string columnName = match.Groups[4].Value;
            string defaultValue = match.Groups[3].Value;
            if (!defaultConstraints.ContainsKey(columnName))
                defaultConstraints[columnName] = defaultValue;
        }
        foreach (Match match in defaultMatches)
        {
            string columnName = match.Groups[3].Value;
            string defaultValue = match.Groups[2].Value;
            if (!defaultConstraints.ContainsKey(columnName))
                defaultConstraints[columnName] = defaultValue;
        }
        var foreignKeysMatches = Regex.Matches(content, fkWithCheckAddConstPattern, RegexOptions.Singleline)
                                      .Concat(Regex.Matches(content, fkWithNoCheckAddConstPattern, RegexOptions.Singleline))
                                      .Concat(Regex.Matches(content, fkWithCheckPattern, RegexOptions.Singleline))
                                      .Concat(Regex.Matches(content, fkWithNoCheckPattern, RegexOptions.Singleline));
        var foreignKeyDic = new Dictionary<Tuple<string, string>, string>();
        //contadorFK += foreignKeysMatches.Count();

        foreach (Match match in foreignKeysMatches)
        {
            contadorFK++;
            int i = match.Groups.Count;
            var fKConstKey = Tuple.Create(match.Groups[i - 2].Value, match.Groups[i - 1].Value);
            if (!foreignKeyDic.ContainsKey(fKConstKey))
                foreignKeyDic.Add(fKConstKey, match.Groups[i - 3].Value);
        }
        /*
        foreach (Match match in fkWithCheckAddConstMatches)
        {
            var fKConstKey = Tuple.Create(match.Groups[4].Value, match.Groups[5].Value);
            if (!foreignKeyDic.ContainsKey(fKConstKey))
                foreignKeyDic.Add(fKConstKey, match.Groups[3].Value);

        }
        foreach (Match match in fkWithNoCheckAddConstMatches)
        {
            var fKConstKey = Tuple.Create(match.Groups[4].Value, match.Groups[5].Value);
            if (!foreignKeyDic.ContainsKey(fKConstKey))
                foreignKeyDic.Add(fKConstKey, match.Groups[3].Value);
        }
        foreach (Match match in fkWithCheckMatches)
        {
            var fKConstKey = Tuple.Create(match.Groups[3].Value, match.Groups[4].Value);    // [GlobalPerfilEmpresas] ([codPerfil]), [codPerfil]
            if (!foreignKeyDic.ContainsKey(fKConstKey))
                foreignKeyDic.Add(fKConstKey, match.Groups[2].Value);
        }
        */

        string checkContent = "";
        Match checkConstMatch = Regex.Match(content, checkConstPattern);
        if (checkConstMatch.Success) checkContent = checkConstMatch.Groups[1].Value;
        string[] checkClauses = Regex.Split(checkContent, @"\s+AND\s+");

        var tableNameMatch = Regex.Match(content, tableNamePattern);
        var columnsMatches = Regex.Matches(content, columnPattern);
        var primaryKeyMatch = Regex.Match(content, primaryKeyPattern);
        string primaryKey = primaryKeyMatch.Groups[1].Value;
        string tableName = tableNameMatch.Groups[1].Value;

        writer.WriteLine("#TABLE NAME,#COLUMN NAME,#DATA TYPE,#NULLABILITY,#DEFAULT,#KEY,#TABLE CONSTRAINT,#CHECK CONSTRAINT");

        foreach (Match match in columnsMatches)
        {
            string columnName = match.Groups[1].Value;
            string dataType = match.Groups[2].Value;
            string identity = match.Groups[3].Value;
            string size = match.Groups[5].Value;
            string nullability = match.Groups[6].Value;
            string foreignKey = "";
            string fKReference = "";
            string checkClause = "";
            string identityFormatted = identity;
            string sizeFormatted = string.IsNullOrEmpty(size) ? "" : $"({size})";
            string pkFormatted = primaryKey.Contains("[" + columnName + "]") ? "PRIMARY KEY " : "";
            string defaultFormatted = defaultConstraints.ContainsKey(columnName) ? $"DEFAULT ({defaultConstraints[columnName]})" : "";

            foreach (var fKItem in foreignKeyDic)
            {
                if (!string.IsNullOrEmpty(fKReference)) fKReference += "\n";
                if (fKItem.Value.ToString().Contains("[" + columnName + "]"))
                {
                    foreignKey = (string.IsNullOrEmpty(pkFormatted)) ? "FOREIGN KEY" : " - FOREIGN KEY";

                    fKReference += "[dbo].[" + fKItem.Key.Item1.Replace("\r\n", " ") + "] (" + fKItem.Key.Item2.Replace("\r\n", " ");
                }
            }
            foreach (var clause in checkClauses)
                if (clause.Contains("[" + columnName + "]"))
                    checkClause = clause.Trim();

            writer.WriteLine($"\"{tableName}\",\"{columnName}\",\"{dataType}{identityFormatted}{sizeFormatted}\"," +
                             $"\"{nullability}\",\"{defaultFormatted}\",\"{pkFormatted}{foreignKey}\",\"{fKReference}\",\"{checkClause}\"");
        }
        writer.WriteLine("");
    }
    private void OpenCSV()
    {
        try
        {
            Process.Start(new ProcessStartInfo(outputPath) { UseShellExecute = true });
        }
        catch (Exception ex)
        {
            Console.WriteLine($"No se pudo abrir el archivo: {ex.Message}");
        }
    }
    //public static void Main()
    //{
    //    Program pro = new();
    //    if (!pro.todos) pro.OpenFile();
    //    else pro.OpenMultiFiles();

    //    Console.WriteLine($"{pro.contadorFK}");
    //    pro.OpenCSV();
    //}
}
