                           A-Z80
         A conceptual implementation of the Z80 CPU
         ------------------------------------------

This project is described my blog at http://www.devic.us/hacks

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

They are only used as containers for various files within individual modules;
the top-level design is in the "toplevel" folder.

Majority of sub-modules are designed in the Quartus schematic editor and then
exported to Verilog for simulation and the top-level integration.

Simulation
==========
Each functional block contains a Modelsim simulation profile:
./<block>/simulation/modelsim/test_<block>.mpf

Before you can load and simulate them using Modelsim, you need to set up
the environment by running a set of Python scripts at each functional block:
./<block>/simulation/modelsim/work/setup.py

Run each one of them to create necessary directories that Modelsim needs.

Each Modelsim project contains a set of predefined waveform scripts which you can
load before running a simulation of a particular submodule. The scripts are named
according to a sub-module to test:
./<block>/simulation/modelsim/wave_<submodule>.do

All tests and test benches are written in SystemVerilog (and have extension *.sv).

----------------------------------------------------------------------------------
Email me if you have any questions,
Goran Devic
gdevic@yahoo.com
