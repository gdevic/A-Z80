//============================================================================
// Module pin_control in control Z80 CPU
//
// Copyright 2014 Goran Devic
//
// This module implements the pin control within the control unit of the Z80 CPU.
// All the signalling is internally positive which is better suited to an FPGA
// implementation. Signals are inverted outside this module.
//============================================================================
`timescale 1ns/ 100 ps

module pin_control
(
    //----------------------------------------------------------
    // Inputs from the chip control pin pads
    //----------------------------------------------------------
    input wire clk,                     // Input clock
    input wire mwait,                   // WAIT   - External device is not ready
    input wire busrq,                   // BUSRQ  - External device requests access to the bus
    input wire reset,                   // RESET  - Input reset pin

    //----------------------------------------------------------
    // Outputs to the chip control pin pads
    //----------------------------------------------------------
    output wire m1,                     // M1     - Opcode fetch phase
    output wire mreq,                   // MREQ   - Memory request
    output wire iorq,                   // IORQ   - I/O command in progress
    output wire rd,                     // RD     - Memory read request
    output wire wr,                     // WR     - Memory write request
    output wire rfsh,                   // RFSH   - Memory refresh phase
    output wire busack,                 // BUSACK - Response to the BUSRQ
    output wire ctl_bus_oe,             // Output enable (vs. Tri-state) of MREQ,IORQ,RD,WR and RFSH

    //----------------------------------------------------------
    // Inputs from internal blocks
    //----------------------------------------------------------
    input wire T1,                      // T-cycle #1
    input wire T2,                      // T-cycle #2
    input wire T3,                      // T-cycle #3
    input wire T4,                      // T-cycle #4
    input wire T5,                      // T-cycle #5
    input wire T6,                      // T-cycle #6
    input wire fFetch,                  // Function: opcode fetch cycle ("M1")
    input wire fMRead,                  // Function: memory read cycle
    input wire fMWrite,                 // Function: memory write cycle
    input wire fIORead,                 // Function: IO Read cycle
    input wire fIOWrite,                // Function: IO Write cycle
    input wire fIntr,                   // Function: Interrupt response cycle

    //----------------------------------------------------------
    // Outputs to internal blocks
    //----------------------------------------------------------
    output wire holdClk,                // Signal to the sequencer to hold a clock
    output wire ctl_ab_oe,              // Address bus pads: output enable to pins
    output wire ctl_ab_wr,              // Address bus pads: write address from internal AB
    output wire ctl_db_oe,              // Data bus pads: output enable
    output wire ctl_db_rd_pin,          // Data bus pads: read from the output pin into the latch
    output wire ctl_db_wr,              // Data bus pads: write from internal DB to its latch
    output wire ctl_db_rd               // Data bus pads: read from its latch into internal DB
);

//============================================================================
// Static equations for external CPU pins
//============================================================================

assign m1     = (fFetch   & (T1 | T2)) |
                (fMRead   & 0) |
                (fMWrite  & 0) |
                (fIORead  & 0) |
                (fIOWrite & 0) |
                (fIntr    & (T1 | T2 | T3 | T4));

assign mreq   = (fFetch   & ((T1 & ~clk | T2) | (T3 & ~clk | T4 & clk))) |
                (fMRead   & (T1 & ~clk | T2 | T3 & clk)) |
                (fMWrite  & (T1 & ~clk | T2 | T3 & clk)) |
                (fIORead  & 0) |
                (fIOWrite & 0) |
                (fIntr    & (T5 & ~clk | T6));

assign iorq   = (fFetch   & 0) |
                (fMRead   & 0) |
                (fMWrite  & 0) |
                (fIORead  & (T2 | T3 | T4 & clk)) |
                (fIOWrite & (T2 | T3 | T4 & clk)) |
                (fIntr    & (T3 & ~clk | T4));

assign rd     = (fFetch   & (T1 & ~clk | T2)) |
                (fMRead   & (T1 & ~clk | T2 | T3 & clk)) |
                (fMWrite  & 0) |
                (fIORead  & (T2 | T3 | T4 & clk)) |
                (fIOWrite & 0) |
                (fIntr    & 0);

assign wr     = (fFetch   & 0) |
                (fMRead   & 0) |
                (fMWrite  & (T2 & ~clk | T3 & clk)) |
                (fIORead  & 0) |
                (fIOWrite & (T2 | T3 | T4 & clk)) |
                (fIntr    & 0);

assign rfsh   = (fFetch   & (T3 | T4)) |
                (fMRead   & 0) |
                (fMWrite  & 0) |
                (fIORead  & 0) |
                (fIOWrite & 0) |
                (fIntr    & (T5 | T6));

//----------------------------------------------------------------------------
// Signal the end of a particular M-cycle
//assign nextM  = (fFetch   & T4) |
//                (fMRead   & T3) |
//                (fMWrite  & T3) |
//                (fIORead  & T4) |
//                (fIOWrite & T4) |
//                (fIntr    & T6);

//----------------------------------------------------------------------------
// The usual state advancing mechanism can be temporarily paused if the pins
// BUSRQ and WAIT are asserted

// This flip flop is written to by the BUSRQ input signal at the start of every clock.
// It is then tested at the start of the _last_ state of each machine cycle.
reg busrq_latch = 0;
always @ (clk) begin
   busrq_latch = busrq;
end

reg busack_latch;
always @ (busrq_latch) begin
    busack_latch = busrq_latch;
end

assign busack = busack_latch;

// This flip flop is written to by the WAIT input signal at the negative edge of every clock.
// It is then tested at a certain M-cycle of each function.
reg wait_latch = 0;
always @ (negedge clk) begin
   wait_latch = mwait;
end

// Pause the sequencer if the WAIT or BUSRQ input signals have been asserted
// at certain T state periods and functions
assign holdClk = (wait_latch & (
                    (fFetch   & T2) |
                    (fMRead   & T2) |
                    (fMWrite  & T2) |
                    (fIORead  & T3) |
                    (fIOWrite & T3) |
                    (fIntr    & T4)))
                |(busrq_latch & (
                    (fFetch   & T4) |
                    (fMRead   & T3) |
                    (fMWrite  & T3) |
                    (fIORead  & T4) |
                    (fIOWrite & T4) |
                    (fIntr    & T6)));

//----------------------------------------------------------------------------
// Wires controlling the address and data latches/buffers interfacing with the outside world

// Address bus is given up only during the reset and bus request states
assign ctl_ab_oe = ~(reset | busack);

// The same is with the control pins
assign ctl_bus_oe = ~(reset | busack);

// Write 16-bit address value from the internal address bus into the address pad latch
assign ctl_ab_wr = (fFetch   & ((T1 & clk) | (T3 & clk))) |
                   (fMRead   & (T1 & clk)) |
                   (fMWrite  & (T1 & clk)) |
                   (fIORead  & (T1 & clk)) |
                   (fIOWrite & (T1 & clk)) |
                   (fIntr    & ((T1 & clk) | (T5 & clk)));

// Output data pad latch value onto the external data pin
assign ctl_db_oe = (fFetch   & 0) |
                   (fMRead   & 0) |
                   (fMWrite  & (T1 & ~clk | T2 | T3)) |
                   (fIORead  & 0) |
                   (fIOWrite & (T1 & ~clk | T2 | T3 | T4)) |
                   (fIntr    & 0);

// Read data from the external data pin into the data pad latch
assign ctl_db_rd_pin =
                   (fFetch   & T2) |
                   (fMRead   & (T3 & clk)) |
                   (fMWrite  & 0) |
                   (fIORead  & (T4 & clk)) |
                   (fIOWrite & 0) |
                   (fIntr    & (T4 & ~clk));

// Read data from the data pad latch into the internal data bus
assign ctl_db_rd = (fFetch   & T3) |
                   (fMRead   & (T3 & ~clk)) |
                   (fMWrite  & 0) |
                   (fIORead  & (T4 & ~clk)) |
                   (fIOWrite & 0) |
                   (fIntr    & T5);

// Write data from the internal data bus into the data pad latch
assign ctl_db_wr = (fFetch   & 0) |
                   (fMRead   & 0) |
                   (fMWrite  & (T1 & clk)) |
                   (fIORead  & 0) |
                   (fIOWrite & (T1 & clk)) |
                   (fIntr    & 0);

endmodule
