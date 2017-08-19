A-Z80 Logic Design
==================
Each functional block contains a Quartus project file:
./<block>/test_<block>.qpf

Quartus projects are only used as containers for files within individual
modules; complete and working top-level solutions that use A-Z80 are in the
"host" folder.

Majority of sub-modules are designed in the Quartus schematic editor and then
exported to Verilog for simulation and top-level integration.

Simulation
==========
Before you can load and simulate any module through Modelsim, you need to set up
the environment by running 'modelsim_setup.py'. The script creates relative file
path mapping to source files in all module project folders.

Each functional block, including the top level, contains a Modelsim simulation
profile: ./<block>/simulation/modelsim/test_<block>.mpf

After opening a Modelsim session, create a library and compile sources:
ModelSim> vlib work
Compile->Compile All
Run a simulation through one of the defined configurations.

If you get a message "Unable to compile", you likely forgot to run 'modelsim_setup.py'.
Exit ModelSim, revert changes to ".mpf" file, delete "work" folder and run
'modelsim_setup.py'.

Each project contains a set of predefined waveform scripts which you can
load before running a simulation:
./<block>/simulation/modelsim/wave_<test>.do
