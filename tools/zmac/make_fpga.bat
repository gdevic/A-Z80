@echo off
Rem
Rem     This batch file creates a hex file suitable to run in FPGA
Rem     and to load in Modelsim. The hex file is first being created
Rem     in the "zout" folder (by the assember) and then a converted
Rem     version is being written to this folder so it can be
Rem     loaded by the RAM module.
Rem
zmac.exe --zmac fpga.asm
if errorlevel 1 goto error
bin2hex.exe zout\fpga.cim fpga.hex
if errorlevel 1 goto error
goto end

:error
@echo ------------------------------------------------------
@echo Errors assembling %1
@echo ------------------------------------------------------
cmd
:end