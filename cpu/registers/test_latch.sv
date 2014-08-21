// Test 8-bit latch block
`timescale 100 ps/ 100 ps
module test_latch;

// Bi-directional bus with 3-state
reg  [7:0] db;              // Drive it using these wires
wire [7:0] db_sig;          // Read it using these wires

reg oe_sig;
reg we_sig;

initial begin
    oe_sig = 0;
    we_sig = 0;

    // Test bidirectional data bus and leave it at Z
    #1 db = 8'hAA;
    #1 db = 'z;

    // Write a byte into the latch
    #1 db = 8'h55;
    #1 we_sig = 1;
    #1 we_sig = 0;
    #1 db = 'z;

    // Read latch
    #1 db = 'z;
    #1 oe_sig = 1;
    #1 oe_sig = 0;

    #1 $display("END");

end

// Drive a 3-state bidirectional bus with this statement
assign db_sig = db;

reg_latch reg_latch_inst
(
	.oe(oe_sig) ,	// input  oe_sig
	.we(we_sig) ,	// input  we_sig
	.db(db_sig[7:0]) 	// inout [7:0] db_sig
);

endmodule
