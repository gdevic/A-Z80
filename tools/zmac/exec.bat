Rem
Rem     This batch file assembles and generates executable code
Rem
Rem     Call it with an argument of the ASM file you want to use, or
Rem     you can simply drag and drop an asm file into it.
Rem
zmac --zmac %1
bindump.py zout\%~n1.cim ..\..\cpu\toplevel\simulation\modelsim\ram100.hex
