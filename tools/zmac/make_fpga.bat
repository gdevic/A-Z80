@echo off
Rem
Rem     This batch file creates a hex file suitable to run in FPGA
Rem     and to load in Modelsim
Rem
zmac.exe --zmac fpga.asm
bin2hex.exe zout\fpga.cim zout\fpga.hex
