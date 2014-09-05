@echo off
Rem
Rem     This batch file assembles and generates executable code
Rem
Rem     Call it with an argument of the ASM file you want to use, or
Rem     you can simply drag and drop an asm file into it.
Rem     If you drop an ASM file and there were errors, this script
Rem     will keep the DOS window open so you can see the errors.
Rem
zmac --zmac %1
if errorlevel 1 goto error
bindump.py zout\%~n1.cim ..\..\cpu\toplevel\simulation\modelsim\ram100.hex
if errorlevel 1 goto error
goto end

:error
@echo ------------------------------------------------------
@echo Errors assembling %1
@echo ------------------------------------------------------
cmd
:end