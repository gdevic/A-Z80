@echo off
Rem
Rem     Creates an Intel HEX file format from an FPGA boot source ("fpga.asm")
Rem     This hex file is loaded into the ROM module for both the ModelSim
Rem     and to be included into the target FPGA data file.
Rem
zmac.exe --zmac fpga.asm
if errorlevel 1 goto error
bin2hex.exe zout\fpga.cim fpga.hex
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