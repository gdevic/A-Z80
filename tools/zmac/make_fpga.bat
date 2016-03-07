@echo off
Rem
Rem     Assembles Z80 source file into object code and generates various
Rem     formats of that code to be used by FPGA test projects.
Rem
Rem     Intel HEX files are used by ModelSim and Altera synthesis,
Rem     COE and MIF files are used by Xilinx and its ISim simulation.
Rem
Rem     Give it an argument of the ASM file you want to use, or you can simply drag
Rem     and drop an asm file into it. If you drop an ASM file and there were errors,
Rem     this script will keep the DOS window open so you can see the errors.
Rem
zmac.exe --zmac %1
if errorlevel 1 goto error
bin2hex.exe zout\%~n1.cim fpga.hex
if errorlevel 1 goto error
python bin2coe.py zout\%~n1.cim ram.coe
if errorlevel 1 goto error
python bin2mif.py --simple zout\%~n1.cim ram.mif
if errorlevel 1 goto error

Rem     Copy hex files to their target Quartus/ModelSim host directories
copy /Y fpga.hex ..\..\host\basic_de1
copy /Y fpga.hex ..\..\host\basic_de1\simulation\modelsim

Rem     Copy .mif and .coe files to their target Xilinx host directories
copy /Y ram.mif ..\..\host\basic_nexys3\work
goto end

:error
@echo ------------------------------------------------------
@echo Errors processing %1
@echo ------------------------------------------------------
cmd
:end