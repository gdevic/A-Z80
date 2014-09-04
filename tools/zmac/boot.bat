Rem
Rem     This batch file assembles and generates boot code
Rem
zmac boot.asm
bindump.py zout\boot.cim ..\..\cpu\toplevel\simulation\modelsim\ram.hex
