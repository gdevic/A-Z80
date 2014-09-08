                           A-Z80
         A conceptual implementation of the Z80 CPU
         ------------------------------------------

This project is described on my blog at http://www.devic.us/hacks

Prerequisites:
* Altera Quartus and Modelsim (free web editions)
* Python 2.7
* MS Visual Studio (2010 SP1 recomended)

A-Z80 consists of several functional blocks and a top-level module:
./alu       contains ALU block, ALU control and flags logic
./bus       contains data bus switches, pin logic, address latch and incrementer
./register  contains CPU register file and register control logic
./control   contains PLA, sequencer and other control blocks
./toplevel  integrates all sub-modules into a top-level design

Logic Design
============
Each functional block contains a Quartus project file:
./<block>/test_<block>.qpf

Quartus projects are only used as containers for files within individual modules;
the top-level design is in the "toplevel" folder.

Majority of sub-modules are designed in Quartus schematic editor and then
exported to Verilog for simulation and top-level integration.

Simulation
==========
Before you can load and simulate any module through Modelsim, you need to set up
the environment by running a Python script 'modelsim_setup.py'. It creates
relative file path mapping to source files in all module project folders.

Each functional block, including the top level, contains a Modelsim simulation profile:
./<block>/simulation/modelsim/test_<block>.mpf

Once you start ModelSim by opening a *.mpf file, you need to create a library:
ModelSim> vlib work
Only then you can compile all module/project sources (Compile->Compile All).

Each project also contains a set of predefined waveform scripts which you can
load before running a simulation of a particular module or a test:
./<block>/simulation/modelsim/wave_<test>.do

----------------------------------------------------------------------------------
Email me if you have any questions,
Goran Devic
gdevic@yahoo.com
