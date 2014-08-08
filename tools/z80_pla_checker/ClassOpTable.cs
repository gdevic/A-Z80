using System;

namespace z80_pla_checker
{
    class ClassOpTable
    {
        // Table of opcodes 16x16
        private readonly string[] opTable = new string[256];
        private string name = "Opcode Table";

        /// <summary>
        /// Load the opcode table from a text file
        /// </summary>
        public bool Load(string filename)
        {
            // Read each line of the file into a string array. Each element
            // of the array is one line of the file.
            ClassLog.Log("Loading " + filename);

            try
            {
                string[] lines = System.IO.File.ReadAllLines(filename);
                foreach (string line in lines)
                {
                    string finalLine;
                    if (line.Substring(0, 4) == @"DDCB" || line.Substring(0, 4) == @"FDCB")
                    {
                        finalLine = line.Substring(6);
                        name = "Opcode Table " + line.Substring(0, 4);
                    }
                    else
                        if (line[2]!=' ' && (line.Substring(0, 2) == @"DD" || line.Substring(0, 2) == @"FD" || line.Substring(0, 2) == @"ED" || line.Substring(0, 2) == @"CB"))
                        {
                            finalLine = line.Substring(2);
                            name = "Opcode Table " + line.Substring(0, 2);
                        }
                        else
                            finalLine = line;
                    int opcode = Convert.ToInt32(finalLine.Substring(0, 2), 16);
                    finalLine = finalLine.Substring(3);
                    while (finalLine.Length > 0 && finalLine[0].ToString().IndexOfAny(" ned".ToCharArray())>=0)
                        finalLine = finalLine.Remove(0, 1);

                    opTable[opcode] = finalLine;
                }
            }
            catch (Exception ex)
            {
                ClassLog.Log(ex.Message);
                return false;
            }
            return true;
        }

        /// <summary>
        /// Dump the content of the opcode table to the log
        /// </summary>
        public void Dump()
        {
            ClassLog.Log("-------------------------------- " + name + " --------------------------------------------------");
            for (int y = 0; y < 16; y++)
            {               
                string line = string.Format("{0:X} ", y);
                for (int x = 0; x < 16; x++)
                {
                    line += string.Format(" | {0,-12}", opTable[y*16 + x]);
                }
                ClassLog.Log(line);
            }
        }
    }
}
