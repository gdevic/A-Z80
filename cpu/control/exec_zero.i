// Control the machine state sequencer
nextM                = 1'h0;        // Reset Signal to the sequencer to advance to the next M-cycle (also reset T to T1)
setM1                = 1'h0;        // Reset Signal to the sequencer to reset next cycle to M1/T1 (next instruction fetch)
// Set M1 based on a condition signal: setM1 if the condition is false
setM1ss              = 1'h0;        // Reset setM1 to ~'ss' flag condition signal
setM1cc              = 1'h0;        // Reset setM1 to ~'cc' flag condition signal
setM1bz              = 1'h0;        // Reset setM1 to zero-flag (ZF); used for DJNZ after decrementing B
// Control IO pin states sequence
fFetch               = 1'h0;        // Reset Pin control to hold the instruction fetch (M1) sequence
fMRead               = 1'h0;        // Reset Pin control to hold the memory read sequence
fMWrite              = 1'h0;        // Reset Pin control to hold the memory write sequence
fIORead              = 1'h0;        // Reset Pin control to hold the IO read sequence
fIOWrite             = 1'h0;        // Reset Pin control to hold the IO write sequence
FIntr                = 1'h0;        // Reset Pin control to hold the interrupt pin sequence
// Controls internal data bus switches
ctl_bus_sw1          = 1'h0;        // Reset Switch 1 on (connects pads to ALU)
ctl_bus_sw2          = 1'h0;        // Reset Switch 2 on (connects top and bottom register byte)
ctl_bus_sw4          = 1'h0;        // Reset Switch 4 on (connects PC/IR with the rest of the registers)
// Control of Address Latch (AL), address increment (INC) and address mux (AB_MUX)
ctl_al_we            = 1'h0;        // Reset Write enable to address latch
ctl_inc_dec          = 1'h0;        // Reset Perform decrement (1) or increment (0)
ctl_inc_limit6       = 1'h0;        // Reset Limit increment to 6 bits (for incrementing IR)
ctl_inc_cy           = 1'h0;        // Reset Address increment, carry in value (+/-1 or 0)
ctl_ab_mux_inc       = 1'h0;        // Reset Address bus mux: select from latch (0) or the increment (1)
