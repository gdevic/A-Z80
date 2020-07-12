                               A-Z80
             A conceptual implementation of the Z80 CPU
             ------------------------------------------
                for Altera, Xilinx and Lattice FPGAs

This project is described in more details at https://baltazarstudios.com

For additional information, read 'Quick Start' and 'Users Guide' documents
in the 'docs' folder. Also read a 'readme.txt' file in each of the folders.

Prerequisites
=============
* Altera Quartus and Modelsim (free web editions) OR
* Xilinx ISE (free Webpack edition) OR
* Lattice ICECube toolchain from Synopsis (Lattice tested by JuanS)
* Python 3.5 or newer

Importing A-Z80 into your project
=================================
If you want to use A-Z80 in your own project, run "export.py" script which
will copy only the files that are needed. Do not manually pick and copy files.

Folder layout
=============
"cpu" folder contains CPU functional blocks and all top-level modules:
  alu         ALU block, ALU control and flags logic
  bus         data bus switches, pin logic, address latch and incrementer
  control     PLA decoder, the sequencer and other control blocks
  registers   CPU register file and the register control logic
  toplevel    top level core, interfaces and test code

"host" folder integrates the A-Z80 CPU into several fully functional designs:
  "basic_de1" contains a simplified board consisting of A-Z80 CPU, memory
          and UART modules that can run small Z80 programs on Altera DE1
  "basic_nexys3" contains the same example project but for Xilinx Nexys3 board
  "zxspectrum_de1" contains a simple implementation of the Sinclair ZX Spectrum
          for Altera DE1 board

"tools", "resources" contain various tools related to the project; reverse
  engineering of the real Z80, design verification and testing.

Email me if you have any questions, issues or you want to use A-Z80 or any of
the files within this project. I'd like to hear from you,

Goran Devic
gdevic@yahoo.com

----------------------------------------------------------------------------------
This project and each file therein is covered under the GNU GPL2.0 license.
It basically states that anyone is free to use it and distribute it, but the full
source needs to be available under the same terms.
