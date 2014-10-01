@echo off
Rem
Rem     Creates an Intel HEX file format from an FPGA boot source file.
Rem     This hex file is loaded into the ROM module for both the ModelSim
Rem     and to be included into the target FPGA data file.
Rem
Rem     Give it an argument of the ASM file you want to use, or you can simply drag
Rem     and drop an asm file into it. If you drop an ASM file and there were errors,
Rem     this script will keep the DOS window open so you can see the errors.
Rem
zmac.exe --zmac %1
if errorlevel 1 goto error
bin2hex.exe zout\%~n1.cim fpga.hex
if errorlevel 1 goto error

Rem     Copy hex files to their target Quartus/ModelSim host directories
cp -u fpga.hex ../../host/toplevel
cp -u fpga.hex ../../host/toplevel/simulation/modelsim

goto end

:error
@echo ------------------------------------------------------
@echo Errors assembling %1
@echo ------------------------------------------------------
cmd
:end