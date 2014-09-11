@echo off
Rem
Rem     This batch file creates a hex file suitable to run in FPGA
Rem     and to load in Modelsim
Rem
zmac.exe --zmac fpga.asm
if errorlevel 1 goto error
bin2hex.exe zout\fpga.cim zout\fpga.hex
if errorlevel 1 goto error
goto end

:error
@echo ------------------------------------------------------
@echo Errors assembling %1
@echo ------------------------------------------------------
cmd
:end