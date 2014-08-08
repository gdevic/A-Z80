using System;

namespace z80_pla_checker
{
    /// <summary>
    /// This class defines a single PLA entry and the operations on it
    /// </summary>
    public class ClassPlaEntry
    {
        // IX/IY Modifiers
        [FlagsAttribute] 
        public enum Modifier : short
        {
            IXY0 = (1 << 0),                    // IX or IY flag is reset 
            IXY1 = (1 << 1),                    // IX or IY flag is set
            HALT = (1 << 2),                    // In HALT state
            ALU  = (1 << 3),                    // ALU operation
            XX = (1 << 4),                      // Regular instruction
            CB = (1 << 5),                      // CB instruction table modifier
            ED = (1 << 6)                       // ED instruction table modifier
        };

        // For opcode [table] lookup, one (and only one) prefix needs to be set
        public enum Prefix
        {
            XX = 0,
            CB = 1,
            ED = 2,
            All = 4
        };

        private int prefix;                     // Modifier bitfield
        private int opcode;                     // Opcode bitfield
        private readonly int n;                 // Ordinal number of this PLA table entry



        public bool Ignored = false;            // This entry can optionally be ignored
        public bool Tag;                        // A generic tag used by the calling code

        private readonly bool modIX0;           // Various prefix fields; some are used, some are not
        private readonly bool modIX1;           // Various prefix fields; some are used, some are not
        private readonly bool modQ;             // Various prefix fields; some are used, some are not
        private readonly bool modALU;           // Various prefix fields; some are used, some are not
        private readonly bool xx;               // Instruction table prefix
        private readonly bool cb;               // Instruction table prefix
        private readonly bool ed;               // Instruction table prefix
        private readonly bool[] bSet = new bool[8];
        private readonly bool[] bClr = new bool[8];
        private readonly string instruction;
        private readonly string code;
        private readonly string mnemonic;

        /// <summary>
        /// PLA entry class constructor
        /// Accepts the init string which should contain a line from the PLA master table.
        /// Various fields from that line are read into this class.
        /// </summary>
        public ClassPlaEntry(string init)
        {
            try
            {
                char[] delimiterChars = { '\t', ' ' };
                string[] w = init.Split(delimiterChars);

                // Example of an input line:
                // w[0]    w[1]             w[2]  w[3] w[4] w[5]
                // ......1 .11..11...1..... 0 1010x0xx D ldx/cpx/inx/outx

                // Read the 7 bits of the prefix
                for (int i = 0; i < 7; i++)
                    if (w[0][6-i] == '1') prefix |= (1 << i);

                // Read the 16 bits of the opcode
                for (int i = 0; i < 16; i++)
                    if (w[1][15 - i] == '1') opcode |= (1 << i);

                n = Convert.ToInt32(w[0]);


                //modIX0 = w[1] == "1";
                //modIX1 = w[2] == "1";
                //modQ = w[3] == "1";
                //modALU = w[4] == "1";
                //xx = w[5] == "1";
                //cb = w[6] == "1";
                //ed = w[7] == "1";
                //for (int i = 0; i < 8; i++)
                //{
                //    bClr[i] = w[8 + i * 2] == "1";
                //    bSet[i] = w[8 + i * 2 + 1] == "1";
                //    if (bSet[i] && bClr[i])
                //        throw (new Exception("PLA error: Set and Clr are both selected!"));
                //}
                //instruction = w[24];
                //code = w[25];
                //mnemonic = w[26];
            }
            catch (Exception ex)
            {
                ClassLog.Log("ClassPlaEntry: Can't parse line: " + init);
                ClassLog.Log(ex.Message);
            }
        }

        /// <summary>
        /// Returns the ordinal number of this PLA table entry
        /// </summary>
        public int GetN()
        {
            return n;
        }

        /// <summary>
        /// Returns entry information in a comment format
        /// </summary>
        public string GetComment()
        {
            return @"// " + instruction + "  " + mnemonic;
        }

        private string io(bool f) { return f ? "1" : "."; }
        private string xo(bool f) { return f ? "1" : "X"; }

        /// <summary>
        /// Dumps this PLA entry. Used by the PLA table dump to dump a complete PLA table.
        /// </summary>
        public void Dump()
        {
            string line = string.Format("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}", n, io(modIX0), io(modIX1), io(modQ), io(modALU), io(xx), io(cb), io(ed));
            for (int i = 0; i < 8; i++)
            {
                line += "\t" + io(bClr[i]);
                line += "\t" + io(bSet[i]);
            }
            line += string.Format("\t{0}\t{1}\t{2}", instruction, code, mnemonic);
            ClassLog.Log(line);
        }

        /// <summary>
        /// Matches the given opcode to this PLA line. Returns empty string if not a match
        /// or PLA number and mnemonic if there is a match.
        /// </summary>
        public string Match(Byte opcode, Modifier modifier, Prefix prefix)
        {
            string m = string.Empty;
            int y = 0;

            // This loop will match Any prefix
            for (int i = 0; i < 8; i++)
            {
                bool opbit = (opcode & (1 << i)) != 0;

                if (bSet[i] == false && bClr[i] == false)
                    y |= 1 << i;
                if (bSet[i] == true && opbit == true)
                    y |= 1 << i;
                if (bClr[i] == true && opbit == false)
                    y |= 1 << i;
            }

            // Test the modifier match
            if (modIX0 && modifier != Modifier.IXY0) y = 0;
            if (modIX1 && modifier != Modifier.IXY1) y = 0;

            // Test the prefix bits
            if (xx && prefix != Prefix.XX) y = 0;
            if (cb && prefix != Prefix.CB) y = 0;
            if (ed && prefix != Prefix.ED) y = 0;

            if (Ignored && prefix != Prefix.All) y = 0;

            // If, after all tests, y did not get reset, accept the PLA entry
            if (y == 0xFF)
                m = string.Format("[{0}] {1}", n, mnemonic);

            return m;
        }

        /// <summary>
        /// Return a prefix of this PLA entry
        /// </summary>
        public Prefix GetPrefix()
        {
            if (xx) return Prefix.XX;
            if (cb) return Prefix.CB;
            if (ed) return Prefix.ED;
            return Prefix.All;
        }

        /// <summary>
        /// Return a PLA entry as a System Verilog bitstream suitable to use in comparison code
        /// </summary>
        public string GetBitstream()
        {
            // Write out these bits in order; they can be 1 or don't care (X)
            // The bits are: (IX0)(IX1)(regular instr.)(CB-prefix flag)(ED-prefix flag)
            string bitstream = string.Format("{0}{1}{2}{3}{4}", xo(modIX0), xo(modIX1), xo(xx), xo(cb), xo(ed));
            // Followed by 8 bits which can be 0, 1 or don't care (X)
            for (int i = 7; i >= 0; i--)
            {
                if (bSet[i]) bitstream += "1";
                else
                    if (bClr[i]) bitstream += "0";
                    else
                        bitstream += "X";
            }
            return bitstream;
        }
    }
}
