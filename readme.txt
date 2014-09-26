                           A-Z80
         A conceptual implementation of the Z80 CPU
         ------------------------------------------

This project is described on my blog at http://www.devic.us/hacks

Prerequisites:
* Altera Quartus and Modelsim (free web editions)
* Python 2.7

A-Z80 "cpu" consists of several functional blocks and a top-level module:
alu         contains ALU block, ALU control and flags logic
bus         contains data bus switches, pin logic, address latch and incrementer
register    contains CPU register file and register control logic
control     contains PLA, sequencer and other control blocks
toplevel    integrates all sub-modules into a top-level design

"host" contains a simplified board containing A-Z80 CPU, memory and UART modules
which, when run, print "Hello, World!" through the UART.

"tools" contains various tools related to the project.

Many folders contain readme.txt files that provide additional description, so
one should not be easily lost in the folder structure.

Logic Design
============
Each functional block contains a Quartus project file:
./<block>/test_<block>.qpf

Quartus projects are only used as containers for files within individual
modules; the top-level designs are in the "toplevel" and "host" folders.

Majority of sub-modules are designed in the Quartus schematic editor and then
exported to Verilog for simulation and the top-level integration.

Simulation
==========
*** IMPORTANT ***
Before you can load and simulate any module through Modelsim, you need to set up
the environment by running a Python script 'modelsim_setup.py'. It creates
relative file path mapping to source files in all module project folders.

Each functional block, including the top level, contains a Modelsim simulation
profile: ./<block>/simulation/modelsim/test_<block>.mpf

*** IMPORTANT ***
The first time you open any ModelSim session by opening a *.mpf file, you need to
create a library:
ModelSim> vlib work
Only then you can compile all modules/project sources (Compile->Compile All) and
run a simulation.

If you get a message "Unable to compile", you forgot to run 'modelsim_setup.py'.
Exit ModelSim; git revert its changes to ".mpf" file (since it has already rewritten
it using absolute paths); delete "work" folder, run 'modelsim_setup.py' and restart.
You will have to recreate library ('vlib work') and recompile.

Each project also contains a set of predefined waveform scripts which you can
load before running a simulation of a particular module or a test:
./<block>/simulation/modelsim/wave_<test>.do

----------------------------------------------------------------------------------
Email me if you have any questions,
Goran Devic
gdevic@yahoo.com
