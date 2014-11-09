//============================================================================
// Module pin_control in control Z80 CPU
//
// Copyright 2014 Goran Devic
//
// This module implements the pin control within the control unit of the Z80 CPU.
// All the signalling is internally positive which is better suited to an FPGA
// implementation. Signals are inverted outside this module.
//============================================================================

module pin_control
(
    //----------------------------------------------------------
    // Inputs from the chip's control pin pads
    //----------------------------------------------------------
    input wire clk,                     // Input clock
    input wire mwait,                   // WAIT   - External device is not ready
    input wire busrq,                   // BUSRQ  - External device requests access to the bus
    input wire nreset,                  // RESET  - Input reset pin

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
    input wire nextM,                   // Last M cycle of any instruction
    input wire setM1,                   // Last T clock of any instruction
    input wire fFetch,                  // Function: opcode fetch cycle ("M1")
    input wire fMRead,                  // Function: memory read cycle
    input wire fMWrite,                 // Function: memory write cycle
    input wire fIORead,                 // Function: IO Read cycle
    input wire fIOWrite,                // Function: IO Write cycle

    input wire T1,                      // T-cycle #1
    input wire T2,                      // T-cycle #2
    input wire Tw1,                     // Auto-extended T2 cycle when in_intr (1)
    input wire Tw2,                     // Auto-extended T2 cycle when in_intr (2)
    input wire T3,                      // T-cycle #3
    input wire T4,                      // T-cycle #4

    input wire in_intr,                 // Servicing the interrupt

    //----------------------------------------------------------
    // Outputs to internal blocks
    //----------------------------------------------------------
    output wire hold_clk_timing,        // Signal to the sequencer to hold the clock
    output wire pin_control_oe,         // Output enable (vs. Tri-state) of MREQ,IORQ,RD,WR and RFSH
    output wire bus_ab_pin_oe,          // Address bus pads: output enable to address pins
    output wire bus_ab_pin_we,          // Address bus pads: write the output pin address latch
    output wire bus_db_pin_oe,          // Data bus pads: output enable
    output wire bus_db_pin_re,          // Data bus pads: read from the output pin into the latch
    output wire T1up,                   // T1 clock up phase
    output wire T3up                    // T3 clock up phase
);

logic reset;
assign reset = !nreset;

//============================================================================
// Glitch prevention and clock-up signal generation
//============================================================================
// Due to the timing differences between internal T-states (from the sequencer)
// and the actual clock tree in this particular implementation, there was a
// considerable glitching on the output signals.
//
// To prevent this, a set of flops convert timings from the internal T-states into
// the external clk-based timings by bridging the desired active periods across
// clk pulses.

reg T1h = 0;
always @ (negedge clk) T1h = T1;

reg T2h = 0;
always @ (negedge clk) T2h = T2;

reg T3h = 0;
always @ (negedge clk) if (fFetch | fIORead | fIOWrite) T3h = T3;

reg Tw1h = 0;
always @ (negedge clk) Tw1h = Tw1;

reg Tw2h = 0;
always @ (negedge clk) Tw2h = Tw2;

// Some of A-Z80 registers are implemented as transparent latches which need to
// latch on the rising edge of a clock in order to propagate a value

reg nextMh = 0;
always @ (negedge clk) nextMh = nextM;

assign T1up = nextMh & clk;
assign T3up = (T2h | Tw2h) & clk;

//============================================================================
// Static equations to control external CPU pins
//============================================================================
assign m1     = (fFetch   &~in_intr & (T1 | T2)) |
                (fFetch   & in_intr & (T1 | T2 | Tw1 | Tw2)) |
                (fMRead   & 1'h0) |
                (fMWrite  & 1'h0) |
                (fIORead  & 1'h0) |
                (fIOWrite & 1'h0);

assign mreq   = (fFetch   &~in_intr & (T1h | T2 | T3h)) |
                (fFetch   & in_intr & (T3h | T4)) |
                (fMRead   & (T1h | T2 | T2h)) |
                (fMWrite  & (T1h | T2 | T2h)) |
                (fIORead  & 1'h0) |
                (fIOWrite & 1'h0);

assign iorq   = (fFetch   &~in_intr & 1'h0) |
                (fFetch   & in_intr & (Tw1h | Tw2)) |
                (fMRead   & 1'h0) |
                (fMWrite  & 1'h0) |
                (fIORead  & (T2 | T3 | T3h)) |
                (fIOWrite & (T2 | T3 | T3h));

assign rd     = (fFetch   &~in_intr & (T1h | T2)) |
                (fFetch   & in_intr & 1'h0) |
                (fMRead   & (T1h | T2 | T2h)) |
                (fMWrite  & 1'h0) |
                (fIORead  & (T2 | T3 | T3h)) |
                (fIOWrite & 1'h0);

assign wr     = (fFetch   & 1'h0) |
                (fMRead   & 1'h0) |
                (fMWrite  & (T2h)) |
                (fIORead  & 1'h0) |
                (fIOWrite & (T2 | T3 | T3h));

assign rfsh   = (fFetch   & (T3 | T4)) |
                (fMRead   & 1'h0) |
                (fMWrite  & 1'h0) |
                (fIORead  & 1'h0) |
                (fIOWrite & 1'h0);

//----------------------------------------------------------------------------
// The usual state advancing mechanism can be temporarily paused if the pins
// BUSRQ and WAIT are asserted

// This flip flop stores the state of the BUSREQ signal at its proper sampling time
// Global signal setM1 is asserted at the last T-cycle of any instruction. We use it
// to read BUSRQ
reg busrq_latch = 0;
always @ (posedge setM1) begin
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
logic testW;
assign testW =  (fFetch   &~in_intr & T2) |
                (fFetch   & in_intr & Tw2) |
                (fMRead   & T2) |
                (fMWrite  & T2) |
                (fIORead  & T3) |
                (fIOWrite & T3);

// This flip flop stores the state of the WAIT signal at its proper sampling time
reg wait_latch = 0;
always @ (negedge clk) begin
    if (testW) wait_latch = mwait;
end

// Pause the sequencer if the WAIT or BUSRQ input signals have been asserted
// at certain T state periods and functions
assign hold_clk_timing = busrq_latch | wait_latch;

//----------------------------------------------------------------------------
// Wires controlling the address and data latches/buffers interfacing with the outside world

// Address bus is given up only during the reset and bus request states
assign bus_ab_pin_oe = ~(reset | busack);

// The same is with the control pins
assign pin_control_oe = ~(reset | busack);

// Write 16-bit address value from the internal address bus into the address latch
assign bus_ab_pin_we = (fFetch   & (T1 | T3)) |
                       (fMRead   & (T1)) |
                       (fMWrite  & (T1)) |
                       (fIORead  & (T1)) |
                       (fIOWrite & (T1));

// Output data pad latch value onto the external data pin
assign bus_db_pin_oe = (fFetch   & 1'h0) |
                       (fMRead   & 1'h0) |
                       (fMWrite  & (T1h | T2 | T3)) |
                       (fIORead  & 1'h0) |
                       (fIOWrite & (T1h | T2 | T3 | T4));

// Read data from the external data pin into the data pad latch
assign bus_db_pin_re = (fFetch   &~in_intr & (T2)) |
                       (fFetch   & in_intr & (Tw2)) |
                       (fMRead   & (T2)) |
                       (fMWrite  & 1'h0) |
                       (fIORead  & (T3)) |
                       (fIOWrite & 1'h0);

endmodule
