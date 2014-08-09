//============================================================================
// Module pin_control in control Z80 CPU
//
// Copyright 2014 Goran Devic
//
// This module implements the pin control within the control unit of the Z80 CPU.
// All the signalling is internally positive which is better suited to an FPGA
// implementation. Signals are inverted outside this module.
//============================================================================
`timescale 100 ps/ 100 ps

module pin_control
(
    //----------------------------------------------------------
    // Inputs from the chip's control pin pads
    //----------------------------------------------------------
    input wire clk,                     // Input clock
    input wire mwait,                   // WAIT   - External device is not ready
    input wire busrq,                   // BUSRQ  - External device requests access to the bus
    input wire intr,                    // INTR   - External interrupt request
    input wire nmi,                     // NMI    - External non-maskable interrupt request
    input wire reset,                   // RESET  - Input reset pin

    //----------------------------------------------------------
    // Outputs to the chip's control pin pads
    //----------------------------------------------------------
    output wire m1,                     // M1     - Opcode fetch phase
    output wire mreq,                   // MREQ   - Memory request
    output wire iorq,                   // IORQ   - I/O command in progress
    output wire rd,                     // RD     - Memory read request
    output wire wr,                     // WR     - Memory write request
    output wire rfsh,                   // RFSH   - Memory refresh phase
    output wire busack,                 // BUSACK - Response to the BUSRQ

    //----------------------------------------------------------
    // Inputs from the sequencer and control units
    //----------------------------------------------------------
    input wire T1,                      // T-cycle #1
    input wire T2,                      // T-cycle #2
    input wire Tw1,                     // Auto-extended T2 cycle for fIntr (1)
    input wire Tw2,                     // Auto-extended T2 cycle for fIntr (2)
    input wire T3,                      // T-cycle #3
    input wire T4,                      // T-cycle #4
    input wire fFetch,                  // Function: opcode fetch cycle ("M1")
    input wire fMRead,                  // Function: memory read cycle
    input wire fMWrite,                 // Function: memory write cycle
    input wire fIORead,                 // Function: IO Read cycle
    input wire fIOWrite,                // Function: IO Write cycle
    input wire fIntr,                   // Function: Interrupt response cycle

    //----------------------------------------------------------
    // Outputs to internal blocks
    //----------------------------------------------------------
    output wire hold_clk_timing,        // Signal to the sequencer to hold the clock
    output wire pin_control_oe,         // Output enable (vs. Tri-state) of MREQ,IORQ,RD,WR and RFSH
    output wire bus_ab_pin_oe,          // Address bus pads: output enable to address pins
    output wire bus_ab_pin_we,          // Address bus pads: write the output pin address latch
    output wire bus_db_pin_oe,          // Data bus pads: output enable
    output wire bus_db_pin_re,          // Data bus pads: read from the output pin into the latch
    output wire bus_db_we,              // Data bus pads: write from internal DB to its latch
    output wire bus_db_oe               // Data bus pads: read from its latch into internal DB
);

//============================================================================
// Static equations to control external CPU pins
//============================================================================

assign m1     = (fFetch   & (T1 | T2)) |
                (fMRead   & 1'h0) |
                (fMWrite  & 1'h0) |
                (fIORead  & 1'h0) |
                (fIOWrite & 1'h0) |
                (fIntr    & (T1 | T2 | Tw1 | Tw2));

assign mreq   = (fFetch   & ((T1 & ~clk | T2) | (T3 & ~clk | T4 & clk))) |
                (fMRead   & (T1 & ~clk | T2 | T3 & clk)) |
                (fMWrite  & (T1 & ~clk | T2 | T3 & clk)) |
                (fIORead  & 1'h0) |
                (fIOWrite & 1'h0) |
                (fIntr    & (Tw1 & ~clk | Tw2 & clk));

assign iorq   = (fFetch   & 1'h0) |
                (fMRead   & 1'h0) |
                (fMWrite  & 1'h0) |
                (fIORead  & (T2 | T3 | T4 & clk)) |
                (fIOWrite & (T2 | T3 | T4 & clk)) |
                (fIntr    & (Tw1 & ~clk | Tw2));

assign rd     = (fFetch   & (T1 & ~clk | T2)) |
                (fMRead   & (T1 & ~clk | T2 | T3 & clk)) |
                (fMWrite  & 1'h0) |
                (fIORead  & (T2 | T3 | T4 & clk)) |
                (fIOWrite & 1'h0) |
                (fIntr    & 1'h0);

assign wr     = (fFetch   & 1'h0) |
                (fMRead   & 1'h0) |
                (fMWrite  & (T2 & ~clk | T3 & clk)) |
                (fIORead  & 1'h0) |
                (fIOWrite & (T2 | T3 | T4 & clk)) |
                (fIntr    & 1'h0);

assign rfsh   = (fFetch   & (T3 | T4)) |
                (fMRead   & 1'h0) |
                (fMWrite  & 1'h0) |
                (fIORead  & 1'h0) |
                (fIOWrite & 1'h0) |
                (fIntr    & (Tw1 | Tw2));

//----------------------------------------------------------------------------
// The usual state advancing mechanism can be temporarily paused if the pins
// BUSRQ and WAIT are asserted

// We need this signal: what is normally the last T-cycle for each function since
// at that clock several events need to be checked (busrq, ints, nmi)
logic lastT =   (fFetch   & T4) |
                (fMRead   & T3) |
                (fMWrite  & T3) |
                (fIORead  & T4) |
                (fIOWrite & T4) |
                (fIntr    & Tw2);

// This flip flop stores the state of the BUSREQ signal at its proper sampling time
reg busrq_latch = 0;
always @ (posedge lastT) begin
   busrq_latch = busrq;
end

// BUSACK trails the BUSREQ by 1 clock
reg busack_latch = 0;
always @ (busrq_latch) begin
    busack_latch = busrq_latch;
end

// Assign the BUSACK
assign busack = busack_latch;

// This signal determines the T-clock cycle of each function at which
// we test for the WAIT; the WAIT is then latched at the negative edge of a clock
logic testW =   (fFetch   & T2) |
                (fMRead   & T2) |
                (fMWrite  & T2) |
                (fIORead  & T3) |
                (fIOWrite & T3) |
                (fIntr    & Tw2);

// This flip flop stores the state of the WAIT signal at its proper sampling time
reg wait_latch = 0;
always @ (negedge clk) begin
    if (testW) wait_latch = mwait;
end

// Pause the sequencer if the WAIT or BUSRQ input signals have been asserted
// at certain T state periods and functions
assign hold_clk_timing = busrq_latch | wait_latch;

//----------------------------------------------------------------------------
// NMI flip flop is latched at any time (in spite of what documentation says)
// and it is sampled at the lastT along with INTR over which it takes priority
reg nmi_latch = 0;
always @(posedge nmi) begin
    nmi_latch = 1;
end

//----------------------------------------------------------------------------
// Wires controlling the address and data latches/buffers interfacing with the outside world

// Address bus is given up only during the reset and bus request states
assign bus_ab_pin_oe = ~(reset | busack);

// The same is with the control pins
assign pin_control_oe = ~(reset | busack);

// Write 16-bit address value from the internal address bus into the address pad latch
assign bus_ab_pin_we =
                   (fFetch   & ((T1 & clk) | (T3 & clk))) |
                   (fMRead   & (T1 & clk)) |
                   (fMWrite  & (T1 & clk)) |
                   (fIORead  & (T1 & clk)) |
                   (fIOWrite & (T1 & clk)) |
                   (fIntr    & ((T1 & clk) | (T3 & clk)));

// Output data pad latch value onto the external data pin
assign bus_db_pin_oe =
                   (fFetch   & 1'h0) |
                   (fMRead   & 1'h0) |
                   (fMWrite  & (T1 & ~clk | T2 | T3)) |
                   (fIORead  & 1'h0) |
                   (fIOWrite & (T1 & ~clk | T2 | T3 | T4)) |
                   (fIntr    & 1'h0);

// Read data from the external data pin into the data pad latch
assign bus_db_pin_re =
                   (fFetch   & T2) |
                   (fMRead   & (T3 & clk)) |
                   (fMWrite  & 1'h0) |
                   (fIORead  & (T4 & clk)) |
                   (fIOWrite & 1'h0) |
                   (fIntr    & (Tw2 & ~clk));

// Read data from the data pad latch into the internal data bus
assign bus_db_oe = (fFetch   & T3) |
                   (fMRead   & (T3 & ~clk)) |
                   (fMWrite  & 1'h0) |
                   (fIORead  & (T4 & ~clk)) |
                   (fIOWrite & 1'h0) |
                   (fIntr    & T3);

// Write data from the internal data bus into the data pad latch
assign bus_db_we = (fFetch   & 1'h0) |
                   (fMRead   & 1'h0) |
                   (fMWrite  & (T1 & clk)) |
                   (fIORead  & 1'h0) |
                   (fIOWrite & (T1 & clk)) |
                   (fIntr    & 1'h0);

endmodule
