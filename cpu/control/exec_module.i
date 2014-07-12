// Control the machine state sequencer
output reg nextM,                  // Signal to the sequencer to advance to the next M-cycle (also reset T to T1)
output reg setM1,                  // Signal to the sequencer to reset next cycle to M1/T1 (next instruction fetch)
// Set M1 based on a condition signal: setM1 if the condition is false
output reg setM1ss,                // setM1 to ~'ss' flag condition signal
output reg setM1cc,                // setM1 to ~'cc' flag condition signal
output reg setM1bz,                // setM1 to zero-flag (ZF); used for DJNZ after decrementing B
// Control IO pin states sequence
output reg fFetch,                 // Pin control to hold the instruction fetch (M1) sequence
output reg fMRead,                 // Pin control to hold the memory read sequence
output reg fMWrite,                // Pin control to hold the memory write sequence
output reg fIORead,                // Pin control to hold the IO read sequence
output reg fIOWrite,               // Pin control to hold the IO write sequence
output reg FIntr,                  // Pin control to hold the interrupt pin sequence
// Control of Address Latch (AL), address increment (INC) and address mux (AB_MUX)
output reg ctl_al_we,              // Write enable to address latch
output reg ctl_inc_dec,            // Perform decrement (1) or increment (0)
output reg ctl_inc_limit6,         // Limit increment to 6 bits (for incrementing IR)
output reg ctl_inc_cy,             // Address increment, carry in value (+/-1 or 0)
output reg ctl_ab_mux_inc,         // Address bus mux: select from latch (0) or the increment (1)
