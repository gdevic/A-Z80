Rem
Rem     This batch file assembles and generates boot code for a ModelSim test at
Rem     \cpu\toplevel\simulation\modelsim   (Select "test_top" test in ModelSim)
Rem
zmac boot.asm
bindump.py zout\boot.cim ..\..\cpu\toplevel\simulation\modelsim\ram.hexdump
