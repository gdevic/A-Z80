                               A-Z80
             A conceptual implementation of the Z80 CPU
             ------------------------------------------
                    for Altera and Xilinx FPGAs

This project is described in more details at: www.baltazarstudios.com

Prerequisites:
* Altera Quartus and Modelsim (free web editions) OR
* Xilinx ISE (free Webpack edition)
* Python 3.5.x

A-Z80 "cpu" consists of several functional blocks and a top-level module:
  alu         contains ALU block, ALU control and flags logic
  bus         contains data bus switches, pin logic, address latch and the
              address incrementer
  register    contains CPU register file and the register control logic
  control     contains PLA, the sequencer and other control blocks
  toplevel    A-Z80 top level core, interfaces and the test code

"host" integrates the A-Z80 into several complete top-level designs:
  "basic" contains a simplified board consisting of A-Z80 CPU, memory
          and UART modules that can run small Z80 programs
  "zxspectrum" contains an implementation of the Sinclair ZX Spectrum

  You probably want to start by loading one of those designs.

"tools" contains various tools related to the project.

Read the 'readme.txt' files in each of the folders for additional information.
Read 'Quick Start' and 'Users Guide' documents in the 'docs' folder.

A-Z80 Logic Design
==================
Each functional block contains a Quartus project file:
./<block>/test_<block>.qpf

Quartus projects are only used as containers for files within individual
modules; complete and working top-level solutions that use A-Z80 are in the
"host" folder.

Majority of sub-modules are designed in the Quartus schematic editor and then
exported to Verilog for simulation and top-level integration. If you decide
to create a design using the A-Z80 CPU, you can either use schematic files
(in Altera Quartus) or corresponding Verilog sources (for both Altera
and Xilinx tools).

Simulation
==========
Before you can load and simulate any module through Modelsim, you need to set up
the environment by running a Python script 'modelsim_setup.py'. The script creates
relative file path mapping to source files in all module project folders.

Each functional block, including the top level, contains a Modelsim simulation
profile: ./<block>/simulation/modelsim/test_<block>.mpf

After opening a Modelsim session, create a library and compile sources:
ModelSim> vlib work
Compile->Compile All
Run a simulation through one of the defined configurations.

If you get a message "Unable to compile", you likely forgot to run 'modelsim_setup.py'.
Exit ModelSim, git revert changes to ".mpf" file, delete "work" folder and run
'modelsim_setup.py'. Rinse, repeat.

Each project contains a set of predefined waveform scripts which you can
load before running a simulation:
./<block>/simulation/modelsim/wave_<test>.do

Email me if you have any questions,
Goran Devic
gdevic@yahoo.com

----------------------------------------------------------------------------------
This complete project and each file therein is covered under the GNU GPL2.0 license.
It basically states that anyone is free to use it and distribute it, but the full
source needs to be available under the same terms:

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 2 of the License, or (at your option)
    any later version.

    This program is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
    more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
