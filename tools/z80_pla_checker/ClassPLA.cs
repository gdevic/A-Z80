using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace z80_pla_checker
{
    class ClassPla
    {
        private readonly List<ClassPlaEntry> pla = new List<ClassPlaEntry>();
        public List<int> IgnoredPla = new List<int>();

        /// <summary>
        /// Returns the total number of PLA table entries
        /// </summary>
        public int Count()
        {
            return pla.Count();
        }

        /// <summary>
        /// Read a PLA table from a text file
        /// </summary>
        public bool Load(string filename)
        {
            // Read each line of the file into a string array. Each element
            // of the array is one line of the file.
            ClassLog.Log("Loading " + filename);

            try
            {
                string[] lines = System.IO.File.ReadAllLines(filename);
                pla.Clear();
                foreach (string line in lines)
                {
                    if (line[0] == '#')
                        continue;
                    var p = new ClassPlaEntry(line);
                    pla.Add(p);
                }
            }
            catch (Exception ex)
            {
                ClassLog.Log(ex.Message);
                return false;
            }
            ClassLog.Log(string.Format("Total {0} PLA lines", pla.Count()));

            //============================================================
            // Ignore duplicate PLA entries
            IgnoredPla.Add(90);     // Duplicate of 26
            IgnoredPla.Add(36);     // Duplicate of 8
            IgnoredPla.Add(71);     // Duplicate of 25
            IgnoredPla.Add(63);     // Duplicate of 17
            IgnoredPla.Add(87);     // Duplicate of 83
            IgnoredPla.Add(60);     // Duplicate of 15
            IgnoredPla.Add(94);     // Duplicate of 12 and 18
            IgnoredPla.Add(18);     // Duplicate of 12 and 94
            IgnoredPla.Add(93);     // Duplicate of 11 and 19
            IgnoredPla.Add(19);     // Duplicate of 11 and 93
            IgnoredPla.Add(98);     // Duplicate of 37
            IgnoredPla.Add(41);     // Duplicate of 3
            IgnoredPla.Add(32);     // Duplicate of 4

            //============================================================
            // Special signals (not instructions)
            IgnoredPla.Add(91);     // This signal goes along block IN/OUT instructions.
            IgnoredPla.Add(75);     // This signal specifies a decrement operation for PLA 53, 66 and 105. Otherwise, it is an increment.
            IgnoredPla.Add(55);     // This signal specifies (HL) addressing for all CB-table instructions, PLA entries 70, 72, 73, 74.
            IgnoredPla.Add(44);     // This signal specifies a regular CB opcode (ignoring IX/IY).
            IgnoredPla.Add(33);     // This signal specifies whether the register is being loaded or stored to memory for PLA entry 31.
            IgnoredPla.Add(28);     // This signal specifies the OUT operation for PLA 37. Otherwise, it is operation.
            IgnoredPla.Add(27);     // This signal goes along individual IN/OUT instructions in the ED table.
            IgnoredPla.Add(16);     // This signal specifies a PUSH operation for PLA23. Otherwise, it is a POP operation.
            IgnoredPla.Add(14);     // This signal specifies a decrement operation for PLA 9. Otherwise, it is an increment.
            IgnoredPla.Add(13);     // This signal specifies whether the value is being loaded or stored for PLA entries 8, 30 and 38.
            IgnoredPla.Add(4);      // This signal goes along instructions that access I and R register (PLA 57 and 83).
            IgnoredPla.Add(0);      // This signal specifies *not* to repeat block instructions.

            //============================================================
            // Ignore our own reserved entries
            IgnoredPla.Add(106);
            IgnoredPla.Add(107);

            //============================================================
            // This is only temporary!
            // Remove op-bits so we the output is more readable
            IgnoredPla.Add(99);
            IgnoredPla.Add(100);
            IgnoredPla.Add(101);

            // Remove ALU operation entries so the output is more readable
            IgnoredPla.Add(88);
            IgnoredPla.Add(86);
            IgnoredPla.Add(85);
            IgnoredPla.Add(84);
            IgnoredPla.Add(80);
            IgnoredPla.Add(79);
            IgnoredPla.Add(78);
            IgnoredPla.Add(76);

            //============================================================

            foreach (var p in pla)
            {
                if (IgnoredPla.Contains<int>(p.GetN()))
                    p.Ignored = true;
            }
            return true;
        }

        /// <summary>
        /// Dumps the content of the entire PLA table
        /// </summary>
        public void Dump()
        {
            ClassLog.Log("Content of the PLA table");
            foreach (var p in pla)
                p.Dump();
        }

        /// <summary>
        /// Find and return all PLA table entries that trigger on a given condition.
        /// This function performs a more comprehensive matching taking into account
        /// the inter-PLA entry logic dependencies.
        /// </summary>
        public List<string> TableMatch(byte opcode, ClassPlaEntry.Modifier modifier, ClassPlaEntry.Prefix prefix)
        {
            var t = new bool[pla.Count];

            // First do a simple search to find the list of *all* PLA entries that match
            foreach (var p in pla)
            {
                String match = p.Match(opcode, modifier, prefix);
                t[p.GetN()] = !string.IsNullOrEmpty(match);
            }

            //============================================================
            // Apply any intra-PLA conditions. These are hard-coded into the
            // timing spreadsheet and we are duplicating them here:

            // INC/DEC variations with register, (hl) or (ix+d)
            if (t[66] && !(t[53] || t[105])) ; else t[66] = false;

            // Generic LD r,r' + (hl), IX variations and on top of that HALT
            if (t[61] && !(t[59] || t[103] || t[58] || t[102] || t[95])) ; else t[61] = false;
            if (t[58] && !t[95]) ; else t[58] = false;
            if (t[102] && !t[95]) ; else t[102] = false;
            if (t[59] && !t[95]) ; else t[59] = false;
            if (t[103] && !t[95]) ; else t[103] = false;

            // A single LD (hl),n and LD (ix+d),n has precedence over a set of LD r,n
            if (t[17] && !(t[40] || t[50])) ; else t[17] = false;

            // ALU A,r' and variations on (hl) and (ix+d)
            if (t[65] && !(t[52] || t[104])) ; else t[65] = false;

            // ALU
            if (t[88] && (t[65] || t[64] || t[52] || t[104])) ; else t[88] = false;
            if (t[86] && (t[65] || t[64] || t[52] || t[104])) ; else t[86] = false;
            if (t[85] && (t[65] || t[64] || t[52] || t[104])) ; else t[85] = false;
            if (t[84] && (t[65] || t[64] || t[52] || t[104])) ; else t[84] = false;
            if (t[80] && (t[65] || t[64] || t[52] || t[104])) ; else t[80] = false;
            if (t[79] && (t[65] || t[64] || t[52] || t[104])) ; else t[79] = false;
            if (t[78] && (t[65] || t[64] || t[52] || t[104])) ; else t[78] = false;
            if (t[76] && (t[65] || t[64] || t[52] || t[104])) ; else t[76] = false;

            //============================================================

            // Finally, collect and return all PLA entries that are left asserted
            return (from p in pla
                    where t[p.GetN()]
                    select p.Match(opcode, modifier, prefix)).ToList();
        }

        /// <summary>
        /// Given the PLA index, return a list of all opcodes that trigger it
        /// </summary>
        public List<string> MatchPLA(ClassPlaEntry.Modifier modifier, int index)
        {
            var m = new List<string>();

            // Find the pla with a given index
            foreach (ClassPlaEntry p in pla)
            {
                if (p.GetN() == index)
                {
                    ClassPlaEntry.Prefix prefix = p.GetPrefix();

                    // For each possible opcode...
                    for (int i = 0; i < 256; i++)
                    {
                        String match = p.Match(Convert.ToByte(i), modifier, prefix);
                        if (!string.IsNullOrEmpty(match))
                            m.Add(string.Format("{2} {0:X02} => {1}", i, match, prefix));
                    }
                    return m;
                }
            }
            ClassLog.Log("Non-existent PLA index");
            return m;
        }

        /// <summary>
        /// Dump opcode table in various ways. This implements several tests on the PLA and the
        /// resulting opcodes.
        /// Call with a specific test number: 0, 1, 2 or 3
        /// </summary>
        public void Test(ClassPlaEntry.Modifier modifier, ClassPlaEntry.Prefix prefix, int testnum, StreamWriter w=null)
        {
            if (w!=null)
                w.WriteLine("# START " + modifier + ":" + prefix);

            var test3Result = new List<string>();
            ClassLog.Log("-------------------------------- " + prefix + " --------------------------------------------------");
            for (int y = 0; y < 16; y++)
            {
                string line = string.Format("{0:X} ", y);
                for (int x = 0; x < 16; x++)
                {
                    byte opcode = Convert.ToByte(y * 16 + x);
                    List<string> match = TableMatch(opcode, modifier, prefix);
                    List<string> final = new List<string>();

                    //===============================================================================
                    // Test 0 - Simply dump PLA entries that match each opcode
                    //===============================================================================
                    string final0 = string.Join(",", match);
                    if (match.Count == 0)
                        final0 = ".";
                    if (match.Count > 1)
                        final0 = "[" + match.Count + "]";
                    final.Add(final0);

                    //===============================================================================
                    // Test 1
                    //===============================================================================
                    string final1 = "";
                    foreach (string oneMatch in match)
                    {
                        final1 += oneMatch.Substring(0, 4);
                    }
                    final.Add(final1);

                    //===============================================================================
                    // Test 2 - Use contention rules to identify the executing PLA entry
                    //===============================================================================
                    string final2 = "";
                    string flags = "";
                    var contenders = new List<int>();
                    foreach (string oneMatch in match)
                    {
                        int lineX = Convert.ToInt32(oneMatch.Substring(1, oneMatch.IndexOf(']') - 1));
                        contenders.Add(lineX);
                    }

                    //if (contenders.Contains(16) && contenders.Contains(23)) contenders.Remove(23);
                    //if (contenders.Contains(28) && contenders.Contains(37)) contenders.Remove(37);
                    //if (contenders.Contains(52) && contenders.Contains(65)) contenders.Remove(65);
                    //if (contenders.Contains(95) && contenders.Contains(61)) contenders.Remove(61); OK
                    //if (contenders.Contains(50) && contenders.Contains(17)) contenders.Remove(17);
                    //if (contenders.Contains(53) && contenders.Contains(66)) contenders.Remove(66); OK
                    //if (contenders.Contains(55) && contenders.Contains(70)) contenders.Remove(70);
                    //if (contenders.Contains(55) && contenders.Contains(72)) contenders.Remove(72);
                    //if (contenders.Contains(55) && contenders.Contains(73)) contenders.Remove(73);
                    //if (contenders.Contains(55) && contenders.Contains(74)) contenders.Remove(74);

                    foreach (int n in contenders)
                    {
                        final2 += "[" + n + "]";
                    }
                    final.Add(final2 + flags);

                    //===============================================================================
                    // Test 3 - Dump table after contention resolution
                    //===============================================================================
                    if (testnum == 3)
                    {
                        test3Result.Add(String.Format("# OPCODE: 0x{0:x2}", opcode));
                        foreach (string m in match)
                            test3Result.Add("# pla" + m);
                    }
                    final.Add("");

                    // -------------------------------------------
                    if (final[testnum].Length > 12)
                        final[testnum] = final[testnum].Substring(0, 12);
                    line += string.Format(" | {0,-12}", final[testnum]);
                }
                ClassLog.Log(line);
            }
            if (w!=null)
            {
                foreach (string oneMatch in test3Result)
                {
                    w.WriteLine(oneMatch);
                }
                w.WriteLine("# END");
            }
        }

        /// <summary>
        /// Generates a Verilog module with the PLA logic
        /// </summary>
        public void GenVerilogPla(bool sorted)
        {
            string max = (pla.Count() - 1).ToString();
            string module = "";
            module += @"//=====================================================================================" + Environment.NewLine;
            module += @"// This file is automatically generated by the z80_pla_checker tool. Do not edit!      " + Environment.NewLine;
            module += @"//=====================================================================================" + Environment.NewLine;
            module += @"module pla_decode (opcode, prefix, pla);" + Environment.NewLine;
            module += @"" + Environment.NewLine;
            module += @"input wire [7:0] opcode;" + Environment.NewLine;
            module += @"input wire [4:0] prefix;" + Environment.NewLine;
            module += @"output reg [" + max + ":0] pla;" + Environment.NewLine;
            module += @"" + Environment.NewLine;
            module += @"always_comb" + Environment.NewLine;
            module += @"begin" + Environment.NewLine;
            module += @"    // Compare input bitfield to each PLA entry and assert those that match." + Environment.NewLine;
            module += @"    // For each input, more than one signal may be asserted." + Environment.NewLine;
            module += @"" + Environment.NewLine;

            // Two different ways to dump the table whether we want it sorted or not...
            if (sorted)
            {
                // Dump PLA table sorted by the original entry index
                for (int current = pla.Count; current >= 0; current--)
                {
                    foreach (var p in pla)
                    {
                        if (current == p.GetN() && !p.Ignored)
                        {
                            String bitstream = p.GetBitstream();
                            module += string.Format("    if ({{prefix[4:0], opcode[7:0]}} ==? 13'b{0})  pla[{1,3}]=1'b1; else pla[{1,3}]=1'b0;   {2}",
                                bitstream, p.GetN(), p.GetComment()) + Environment.NewLine;
                        }
                    }
                }
            }
            else
            {
                // Dump PLA table in the order it was read from the file
                foreach (var p in pla)
                {
                    if (p.Ignored)
                        continue;
                    String bitstream = p.GetBitstream();
                    module += string.Format("    if ({{prefix[4:0], opcode[7:0]}} ==? 13'b{0})  pla[{1,3}]=1'b1; else pla[{1,3}]=1'b0;   {2}",
                        bitstream, p.GetN(), p.GetComment()) + Environment.NewLine;
                }
            }

            // Dump all PLA entries that are ignored
            module += @"" + Environment.NewLine;
            module += @"    // PLA table entries that are ignored (not used)" + Environment.NewLine;
            foreach (var p in pla)
            {
                if (p.Ignored)
                {
                    module += string.Format("    pla[{0,3}]=1'b0;   {1}",
                        p.GetN(), p.GetComment()) + Environment.NewLine;
                }
            }

            module += @"end" + Environment.NewLine;
            module += @"" + Environment.NewLine;
            module += @"endmodule" + Environment.NewLine;

            ClassLog.Log(module);
        }
    }
}
