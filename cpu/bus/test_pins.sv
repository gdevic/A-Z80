// Test address and data pins blocks

// 5 MHz for a functional simulation (no delay timings)
`timescale 100 ns/ 100 ns

module test_pins;

// ------------------------ ADDRESS PINS ---------------------
logic [15:0] ab;            // Internal address bus
logic ctl_ab_we;            // Write enable to address pin latch
logic ctl_ab_pin_oe;        // Output enable to address pins; otherwise tri-stated
wire [15:0] apin;           // Output address bus to address pins

// ------------------------ DATA PINS ------------------------

logic ctl_db_we;            // Write enable to data pin output latch
logic ctl_db_oe;            // Output enable to internal data bus
logic ctl_db_pin_re;        // Read from the data pin into the latch
logic ctl_db_pin_oe;        // Output enable to data pins; otherwise tri-stated

// Bidirectional internal data bus
logic  [7:0] db_w;          // Drive it using this bus
wire [7:0] db;              // Read it using this bus
assign db = db_w;           // Drive 3-state bidirectional bus
always_comb                 // Output to pin bus only when our
begin                       // test is not driving it
    if (db_w==='z)
        ctl_db_oe = 1;
    else
        ctl_db_oe = 0;
end

// Bidirectional external data pins
logic  [7:0] dpin_w;        // Drive it using this bus
wire [7:0] dpin;            // Read it using this bus
assign dpin = dpin_w;       // Drive 3-state bidirectional
always_comb                 // Output to pin bus only when our
begin                       // test is not driving it
    if (dpin_w==='z)
        ctl_db_pin_oe = 1;
    else
        ctl_db_pin_oe = 0;
end

initial begin
    ab = 16'h0;
    ctl_ab_we = 0;
    ctl_ab_pin_oe = 0;
    db_w = 'z;
    dpin_w = 'z;
    ctl_db_we = 0;

    //------------------------------------------------------------
    // Test the address pin logic

    #1  ab = 16'hAA55;      // Latch a value and output it
        ctl_ab_we = 1;
        ctl_ab_pin_oe = 1;
    #1  ctl_ab_we = 0;
    #1  ctl_ab_pin_oe = 0;
        ab = 16'h1234;      // Should not affect
    #1  ctl_ab_pin_oe = 1;  // Toggle output on and off
    #1  ctl_ab_pin_oe = 0;

    //------------------------------------------------------------
    // Test the data pin logic

    #1  dpin_w = 8'hAA;     // Load and latch a value
        ctl_db_pin_re = 1;  // Read into the latch
        
    #1  dpin_w = 'z;
        db_w = 8'h55;
        ctl_db_pin_re = 0;
        ctl_db_we = 1;
    #1  db_w = 'z;

    #1 $display("End of test");
end

//--------------------------------------------------------------
// Instantiate bus block and assign identical nets and variables
//--------------------------------------------------------------

address_pins address_pins_inst( .*, .address(ab[15:0]), .A(apin[15:0]) );

data_pins data_pins_inst( .*, .D(dpin[7:0]) );

endmodule
