                           A-Z80
            A conceptual implementation of the Z80 CPU
            ------------------------------------------

Prerequisites:
* Altera Quartus and Modelsim (free web editions)
* Python 2.7
* MS Visual Studio (2010 SP1 recomended)

A-Z80 consists of several functional blocks and a top-level module:
./alu       contains ALU block, ALU control and flags logic
./bus       contains data bus switches, chip pin logic, address latch and incrementer
./register  contains CPU register file and register control logic
./control   contains PLA, sequencer and other control blocks
./toplevel  integrates all sub-modules into a top-level design

Logic Design
============
Each functional block contains a Quartus project file:
./<block>/test_<block>.qpf

It is named "test_" because it is only used as a container for individual modules
while the top-level design is in "toplevel".

Great majority of submodules are designed in the Quartus schematic editor and then
exported to Verilog for simulation and the top-level integration. Threfore, Quartus
"Hierarchy" view is arbitrary - see the "Files" view to get a list of submodules.

Simulation
==========
Each functional block contains a Modelsim simulation profile:
./<block>/simulation/modelsim/test_<block>.mpf

Before you can load it in Modelsim, you need to create a set of directories
that Modelsim needs. You do that by running Python script(s) at:
./<block>/simulation/modelsim/work/create_dirs.py

Run it for every module, once.

Each Modelsim project contains a set of predefined waveform scripts which you can
load before running a simulation of a particular submodule. The scripts are named
according to the sub-module to test:
./<block>/simulation/modelsim/wave_<submodule>.do

All tests are written in SystemVerilog (and have extension *.sv). They losely make
up a set of directed, functional test benches.

----------------------------------------------------------------------------------
Email me if you have any questions,
Goran Devic
gdevic@yahoo.com
