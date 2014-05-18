// Test ALU shifter core block
`timescale 100 ps/ 100 ps
module test_shifter_core;

// ----------------- INPUT -----------------
reg [7:0] db_sig;           // Input data bus
reg shift_enable_sig;       // Enable input shift
reg shift_right_sig;        // Shift right (1) or left (0)
reg shift_in_sig;           // Carry-in

// ----------------- OUTPUT -----------------
wire cy_out_sig;            // Carry bit after the input shifting
wire [3:0] out_high_sig;    // To internal ALU bus, high nibble
wire [3:0] out_low_sig;     // ..low nibble

initial begin
    db_sig = 8'h0;
    shift_enable_sig = 0;
    shift_right_sig = 0;
    shift_in_sig = 0;
    
    //------------------------------------------------------------
    // Load value without shifting
    
    #1 $display("End of test");
end

//--------------------------------------------------------------
// Instantiate ALU shifter core block
//--------------------------------------------------------------
alu_shifter_core alu_shifter_core_inst
(
	.shift_enable(shift_enable_sig) ,	// input  shift_enable_sig
	.shift_right(shift_right_sig) ,	// input  shift_right_sig
	.shift_in(shift_in_sig) ,	// input  shift_in_sig
	.db(db_sig) ,	// input [7:0] db_sig
	.cy_out(cy_out_sig) ,	// output  cy_out_sig
	.out_high(out_high_sig) ,	// output [3:0] out_high_sig
	.out_low(out_low_sig) 	// output [3:0] out_low_sig
);

endmodule
