
using System;
using System.IO;
using System.Text.RegularExpressions;

class Pruebas01_02
{
    /*
    static void Main()
    {
        // Ruta al archivo SQL
        string sqlFilePath = "C:\\Users\\santi\\Desktop\\SQLQuery.sql";
        // Ruta al archivo de texto donde se guardará el resultado
        string outputFilePath = "C:\\Users\\santi\\Desktop\\archivo_salida.txt";

        try
        {
            // Leer todo el contenido del archivo SQL
            string sqlContent = File.ReadAllText(sqlFilePath);
            // Regex para extraer las tablas y sus campos
            var tablePattern = new Regex(@"CREATE TABLE \[dbo\].\[(.*?)\]\((.*?)\)\s+ON \[PRIMARY\]", RegexOptions.Singleline);

            // Buscar todas las coincidencias en el archivo SQL
            var matches = tablePattern.Matches(sqlContent);

            using (StreamWriter writer = new StreamWriter(outputFilePath))
            {
                foreach (Match match in matches)
                {
                    string tableName = match.Groups[1].Value;
                    string fieldsBlock = match.Groups[2].Value;

                    // Escribir el nombre de la tabla
                    writer.WriteLine($"Tabla: {tableName}");
                    writer.WriteLine("Campos:");

                    // Extraer y escribir los campos de la tabla
                    var fieldPattern = new Regex(@"\[(.*?)\] \[.*?\]");
                    var fieldMatches = fieldPattern.Matches(fieldsBlock);
                    foreach (Match fieldMatch in fieldMatches)
                    {
                        writer.WriteLine($" - {fieldMatch.Groups[1].Value}");
                    }

                    writer.WriteLine(); // Línea en blanco para separar tablas
                }
            }

            Console.WriteLine("Análisis de tablas completado y guardado en archivo de texto.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
        /*
        try
        {
            // Leer todo el contenido del archivo SQL
            string sqlContent = File.ReadAllText(sqlFilePath);
            // Regex para extraer las tablas y las claves primarias
            var tablePattern = new Regex(@"CREATE TABLE \[dbo\].\[(.*?)\]\((.*?)\)(.*?)\s+ON \[PRIMARY\]", RegexOptions.Singleline);

            using (StreamWriter writer = new StreamWriter(outputFilePath))
            {
                foreach (Match match in tablePattern.Matches(sqlContent))
                {
                    string tableName = match.Groups[1].Value;
                    string constraintsBlock = match.Groups[3].Value;

                    // Escribir el nombre de la tabla
                    writer.WriteLine($"Tabla: {tableName}");

                    // Extraer y escribir la clave primaria
                    var pkPattern = new Regex(@"PRIMARY KEY CLUSTERED\s*\((.*?)\)", RegexOptions.Singleline);
                    var pkMatch = pkPattern.Match(constraintsBlock);
                    if (pkMatch.Success)
                    {
                        string primaryKey = pkMatch.Groups[1].Value.Replace("\n", "").Replace("\r", "").Replace("\t", "").Replace("ASC", "").Replace("DESC", "").Trim();
                        writer.WriteLine($"Clave Primaria: {primaryKey}");
                    }
                    else
                    {
                        writer.WriteLine("Clave Primaria: No definida");
                    }

                    writer.WriteLine(); // Línea en blanco para separar tablas
                }
            }

            Console.WriteLine("Análisis de tablas y claves primarias completado y guardado en archivo de texto.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
        */
}
