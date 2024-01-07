using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System;
using System.IO;
using System.Text.RegularExpressions;

namespace Pruebas
{
    internal class ExplorarEstructura
    {

        static void Main()
        {
            ListFiles(@"C:\Users\santi\VsProjects\PruebaHiberus", 0);
        }

        static void ListFiles(string startPath, int indentLevel)
        {
            string myIndent = "   |";
            string nombreDirectorio = "";
            List<string> listaNegra = new List<string>
            {
                ".git",
                ".github",
                ".vs",
                "bin",
                "obj",
                "ArchivosTXT",
                "Migrations",
            };
            if (!listaNegra.Contains(nombreDirectorio))
                if (indentLevel > 0)
                    for (int i = 0; i < indentLevel; i++)
                        myIndent += myIndent;

            foreach (string directory in Directory.GetDirectories(startPath))
            {
                nombreDirectorio = Path.GetFileName(directory);
                if (!listaNegra.Contains(nombreDirectorio))
                {
                    Console.WriteLine($"{myIndent}{Path.GetFileName(directory)}/");

                    ListFiles(directory, indentLevel + 1);
                }
            }
            if (!listaNegra.Contains(nombreDirectorio))
                foreach (string file in Directory.GetFiles(startPath))
                    Console.WriteLine($"{myIndent}{Path.GetFileName(file)}");
        }
    }
}

