// Test address latch and increment block

// 5 MHz for a functional simulation (no delay timings)
`timescale 100 ns/ 100 ns

module test_bus;

// Bi-directional bus that can also be tri-stated
reg  [15:0] db;             // Drive it using this bus
wire [15:0] db_sig;         // Read it using this bus

wire [15:0] address_sig;    // Final address ouput

// ----------------- INPUT CONTROL -----------------
reg ctl_ab_mux_inc_sig;     // Mux for the final address output
reg ctl_al_we_sig;          // Write enable to address latch
reg ctl_bus_inc_oe_sig;     // Write incrementer onto the internal data bus

// ----------------- INC/DEC -----------------
reg ctl_inc_dec_sig;        // Perform decrement (1) or increment (0)
reg ctl_inc_limit6_sig;     // Limit increment to 6 bits (for incrementing IR)
reg ctl_inc_cy_sig;         // Address increment, carry in value (+/-1 or 0)
reg ctl_inc_zero_sig;       // Output zero from the incrementer

// ----------------- OUTPUT/STATUS -----------------
wire address_is_1_sig;      // Signals when the final address is 1

initial begin
    db = 'z;
    ctl_ab_mux_inc_sig = 0;
    ctl_al_we_sig = 0;
    ctl_bus_inc_oe_sig = 0;
    ctl_inc_dec_sig = 0;
    ctl_inc_limit6_sig = 0;
    ctl_inc_cy_sig = 0;
    ctl_inc_zero_sig = 0;

    //------------------------------------------------------------
    // Perform a simple increment and decrement
    #1  db = 16'h0;
        ctl_ab_mux_inc_sig = 1;     // Output incrementer to the address bus
        ctl_inc_cy_sig = 1;         // +1  show "1"
    #1  ctl_inc_dec_sig = 1;        // -1  show "FFFF"
    // ...through overflow
    #1  db = 16'hffff;
        ctl_inc_dec_sig = 0;
        ctl_inc_cy_sig = 1;         // +1  show "0"
    #1  ctl_inc_dec_sig = 1;        // -1  show "FFFE"
    // test pass-through
    #1  ctl_inc_cy_sig = 0;         // show "FFFF"
    #1  ctl_inc_dec_sig = 0;

    //------------------------------------------------------------
    // Test the address latch and the mux
    #1  db = 16'hAA55;
        ctl_al_we_sig = 1;          // Write AA55 to the latch
        ctl_inc_cy_sig = 0;
    #1  db = 16'hCAFE;              // Output CAFE through the incrementer
        ctl_al_we_sig = 0;          // show "CAFE"
    #1  ctl_ab_mux_inc_sig = 0;     // show "AA55"

    //------------------------------------------------------------
    // Test the tri-state db
    #1  db = 'z;
        ctl_bus_inc_oe_sig = 1;     // Output latched value (AA55)
    #1  ctl_bus_inc_oe_sig = 0;     // Disable it for a cycle
        
    //------------------------------------------------------------
    // Test the force-to-zero
    #1  ctl_inc_zero_sig = 1;
        ctl_bus_inc_oe_sig = 1;     // Output zero

    #1 $display("End of test");
end

// Drive 3-state bidirectional bus with these statements
assign db_sig = db;

// Instantiate address latch block
address_latch address_latch_inst
(
	.ctl_bus_inc_oe(ctl_bus_inc_oe_sig) ,	// input  ctl_bus_inc_oe_sig
	.ctl_inc_limit6(ctl_inc_limit6_sig) ,	// input  ctl_inc_limit6_sig
	.ctl_inc_cy(ctl_inc_cy_sig) ,	// input  ctl_inc_cy_sig
	.ctl_inc_dec(ctl_inc_dec_sig) ,	// input  ctl_inc_dec_sig
	.ctl_inc_zero(ctl_inc_zero_sig) ,	// input  ctl_inc_zero_sig
	.ctl_al_we(ctl_al_we_sig) ,	// input  ctl_al_we_sig
	.ctl_ab_mux_inc(ctl_ab_mux_inc_sig) ,	// input  ctl_ab_mux_inc_sig
	.address(address_sig[15:0]) ,	// output [15:0] address_sig
	.address_is_1(address_is_1_sig) ,	// output  address_is_1_sig
	.abus(db_sig[15:0]) 	// inout [15:0] db_sig
);

endmodule
