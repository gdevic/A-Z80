Two things are happening here:

1. Generation of the Z80 boot code for ModelSim and FPGA

  Run the batch file "make_fpga.bat" if you want to regenerate "fpga.hex"
  from "fpga.asm". This file is included by the host/toplevel/rom.v module.

2. Generation of the Z80 test code for toplevel ModelSim

  /cpu/toplevel/tb_ram.sv is a ModelSim test bench for the toplevel A-Z80 block
  It can simulate various Z80 programs which are loaded in two sections:

  "ram.hexdump" contains a boot-like code that provides UART print functions as
  well as INT/NMI handlers used to test interrupts.

  "ram100.hexdump" contains one of the tests:
     "test.daa.asm" - runs DAA instruction on all values. The output should be
     ASCII-identical to the output of the DAA tests at tools/dongle/daa

     "test.neg.asm" - runs NEG instruction on all values. The output should be
     ASCII-identical to the output of the NEG tests at tools/dongle/neg

     "hello_world.asm" - simply test UART print out functions

  Hence, "boot.bat" helps to generate the first file, "exec.bat" the second one.
 