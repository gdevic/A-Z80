// Test pin control unit
`timescale 100 ps/ 100 ps

module test_pin_control;

//----------------------------------------------------------
// Interface from the chip control pin pads - input to the DUT
//----------------------------------------------------------
bit   clk = 1'h0;                   // Input clock
logic mwait = 1'h0;                 // WAIT   - External device is not ready
logic busrq = 1'h0;                 // BUSRQ  - External device requests access to the bus
logic intr = 1'h0;                  // INTR   - External interrupt request
logic nmi = 1'h0;                   // NMI    - External non-maskable interrupt request
logic reset = 1'h0;                 // RESET  - Input reset pin

//----------------------------------------------------------
// Outputs to the chip control pin pads
//----------------------------------------------------------
logic m1;                           // M1     - Opcode fetch phase
logic mreq;                         // MREQ   - Memory request
logic iorq;                         // IORQ   - I/O command in progress
logic rd;                           // RD     - Memory read request
logic wr;                           // WR     - Memory write request
logic rfsh;                         // RFSH   - Memory refresh phase
logic busack;                       // BUSACK - Response to the BUSRQ

//----------------------------------------------------------
// Inputs from internal blocks - input to the DUT
//----------------------------------------------------------
logic T1;                           // T-cycle #1
logic T2;                           // T-cycle #2
logic Tw1;
logic Tw2;
logic T3;                           // T-cycle #3
logic T4;                           // T-cycle #4
logic T5;                           // T-cycle #5
logic T6;                           // T-cycle #6
logic fFetch = 1'h0;                // Function: opcode fetch cycle ("M1")
logic fMRead = 1'h0;                // Function: memory read cycle
logic fMWrite = 1'h0;               // Function: memory write cycle
logic fIORead = 1'h0;               // Function: IO Read cycle
logic fIOWrite = 1'h0;              // Function: IO Write cycle
logic fIntr = 1'h0;                 // Function: Interrupt response cycle

//----------------------------------------------------------
// Outputs to internal blocks
//----------------------------------------------------------
logic hold_clk_timing;              // Signal to the sequencer to hold the clock
logic hold_clk_delay;
logic hold_clk;
assign hold_clk = hold_clk_delay | hold_clk_timing;
logic T2_en;

logic ctl_bus_pin_oe;               // Output enable (vs. Tri-state) of MREQ,IORQ,RD,WR and RFSH
logic ctl_ab_pin_oe;                // Address bus pads: output enable to address pins
logic ctl_ab_we;                    // Address bus pads: write the output pin address latch
logic ctl_db_pin_oe;                // Data bus pads: output enable
logic ctl_db_pin_re;                // Data bus pads: read from the output pin into the latch
logic ctl_db_we;                    // Data bus pads: write from internal DB to its latch
logic ctl_db_oe;                    // Data bus pads: read from its latch into internal DB

logic M1;
logic M2;
logic M3;
logic M4;
logic M5;
logic M6;

logic nextM = 0;
logic setM1;

initial begin
    @(negedge reset);
    
    fIntr = 1;      // Optionally test the 2-cycle delay for interrupt function
    fFetch = 1;
    next_M();
    fFetch = 0;
    fIntr = 0;

    fMRead = 1;
    run_function();
    fMRead = 0;

    fMWrite = 1;
    run_function();
    fMWrite = 0;

    fIORead = 1;
    run_function();
    fIORead = 0;

    fIOWrite = 1;
    run_function();
    fIOWrite = 0;

    #1 $display("End of test");
end

initial repeat (60) #1 clk = ~clk;

initial begin : assert_reset
    reset = 1;
    setM1 = 1; nextM = 1;
    #1 reset = 0;
    setM1 = 0; nextM = 0;
end : assert_reset

task run_function();
    repeat (5) @(posedge clk); reset <= 0;
    setM1 <= 1; nextM <= 1;
    @(posedge clk);
    setM1 <= 0; nextM <= 0;    
endtask

task next_M();
    @(posedge T6);
    setM1 <= 1; nextM <= 1;
    @(posedge clk);
    setM1 <= 0; nextM <= 0;    
endtask

//--------------------------------------------------------------
// Instantiate DUT
//--------------------------------------------------------------

pin_control pin_control ( .* );

pin_delay pin_delay ( .* );

sequencer sequencer ( .* );

endmodule

