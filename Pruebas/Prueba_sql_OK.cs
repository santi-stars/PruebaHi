using System;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;

namespace Pruebas
{
    class Prueba_sql_OK
    {
        static void Mean()
        {
            string path = "C:\\Users\\santi\\Desktop\\dbo.FacturasProformaMODIFIED.Table.sql";
            string content = File.ReadAllText(path);

            string tableNamePattern = @"\[dbo\]\.\[(.*?)\]";
            string columnPattern = @"\[(.*?)\]\s+\[(.*?)\](\s+IDENTITY\(\d+,\d+\))?(\((.*?)\))?\s*(NULL|NOT NULL)";
            string primaryKeyPattern = @"PRIMARY KEY\s+CLUSTERED\s*\(([^)]+)\)";
            // Modificada para capturar múltiples campos en la definición de clave foránea
            string foreignKeyPattern = @"ALTER TABLE \[dbo\]\.\[(.*?)\]\s+WITH NOCHECK ADD\s+CONSTRAINT \[(.*?)\] FOREIGN KEY\s*\((.*?)\)\s*REFERENCES \[dbo\]\.\[(.*?)\]\s*\((.*?)\)";
            // Expresión regular para capturar las restricciones por defecto
            string defaultConstraintPattern = @"ALTER TABLE \[dbo\]\.\[(.*?)\] ADD\s+CONSTRAINT \[(.*?)\]\s+DEFAULT \((.*?)\) FOR \[(.*?)\]";
            var defaultConstraintMatches = Regex.Matches(content, defaultConstraintPattern);

            // Diccionario para almacenar las restricciones por defecto por columna
            var defaultConstraints = new Dictionary<string, string>();

            foreach (Match match in defaultConstraintMatches)
            {
                string columnName = match.Groups[4].Value;
                string defaultValue = match.Groups[3].Value;
                if (!defaultConstraints.ContainsKey(columnName))
                    defaultConstraints[columnName] = defaultValue;
            }

            var tableNameMatch = Regex.Match(content, tableNamePattern);
            string tableName = tableNameMatch.Groups[1].Value;

            var columnsMatches = Regex.Matches(content, columnPattern);
            var primaryKeyMatch = Regex.Match(content, primaryKeyPattern);
            var foreignKeyMatches = Regex.Matches(content, foreignKeyPattern);
            string primaryKey = primaryKeyMatch.Groups[1].Value;

            string outputPath = "C:\\Users\\santi\\Desktop\\archivo_salida.txt";
            // Verificar si el archivo ya existe y eliminarlo si es necesario
            if (File.Exists(outputPath)) File.Delete(outputPath);

            using (StreamWriter writer = new StreamWriter(outputPath))
            {
                writer.WriteLine("Tabla:");
                writer.WriteLine("***[" + tableName + "]***");
                writer.WriteLine("Campos:");

                foreach (Match match in columnsMatches)
                {
                    string columnName = match.Groups[1].Value;
                    string dataType = match.Groups[2].Value;
                    string identity = match.Groups[3].Value;
                    string size = match.Groups[5].Value;
                    string nullability = match.Groups[6].Value;
                    string foreignKey = "";
                    string defaultFor = "";

                    foreach (Match fkMatch in foreignKeyMatches)
                        if (fkMatch.Groups[3].Value.Contains("[" + columnName + "]")) foreignKey = "(FOREIGN KEY)";
                    if (defaultConstraints.ContainsKey(columnName)) defaultFor = " [DEFAULT (" + defaultConstraints[columnName] + ")]";

                    string line = $"-[{(columnName)}] [{dataType}]{identity + (string.IsNullOrEmpty(size) ? "" : $"({size})")}" +
                                  $" {nullability}{defaultFor}{(primaryKey.Contains("[" + columnName + "]") ? " (PRIMARY KEY)" : "")}{foreignKey}";

                    writer.WriteLine(line);
                }

                if (primaryKeyMatch.Success)
                    writer.WriteLine($"PRIMARY KEY: ({primaryKeyMatch.Groups[1].Value.Replace("\r", "").Replace("\n", "").Replace("\t", "")})");

                foreach (Match match in foreignKeyMatches)
                {
                    string fkTable = match.Groups[1].Value;
                    string fkConstraint = match.Groups[2].Value;
                    string fkColumns = match.Groups[3].Value;
                    string referencedTable = match.Groups[4].Value;
                    string referencedColumns = match.Groups[5].Value;

                    writer.WriteLine($"FOREIGN KEY: ({fkColumns}) in TABLE [{fkTable}] with CONSTRAINT " +
                                     $"[{fkConstraint}], REFERENCES to ({referencedColumns}) in TABLE [{referencedTable}]");
                }
            }
            // Abrir el archivo de salida al finalizar
            try
            {
                Process.Start(new ProcessStartInfo(outputPath) { UseShellExecute = true });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"No se pudo abrir el archivo: {ex.Message}");
            }
        }
    }
}
