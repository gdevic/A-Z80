using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace z80_pla_checker
{
    static class Program
    {
        internal static FormMain main;

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            main = new FormMain();
            main.OnStart();
            Application.Run(main);
        }
    }
}
