// Test ALU shifter core block
`timescale 100 ps/ 100 ps
module test_shifter_core;

// ----------------- INPUT -----------------
reg [7:0] db_sig;           // Input data bus
reg shift_enable_sig;       // Enable input shift
reg shift_in_sig;           // Carry-in
reg shift_right_sig;        // Shift right (1) or left (0)
reg shift_sra_sig;          // SRA instruction, keep bit [7]

// ----------------- OUTPUT -----------------
wire shift_out_sig;         // Carry bit after the input shifting
wire [3:0] out_high_sig;    // To internal ALU bus, high nibble
wire [3:0] out_low_sig;     // ..low nibble

initial begin
    db_sig = 8'h00;
    shift_enable_sig = 0;
    shift_right_sig = 0;
    shift_in_sig = 0;
    shift_sra_sig = 0;

    //------------------------------------------------------------
    // Test load without shifting
    #1  db_sig = 8'hAA;
    #1  db_sig = 8'h55;

    //------------------------------------------------------------
    // Test right shift, no carry-in
    #1  db_sig = 8'b00000001;
        shift_enable_sig = 1;
        shift_right_sig = 0;
        shift_in_sig = 0;
    #1  db_sig = 8'b00000010;
    #1  db_sig = 8'b00000100;
    #1  db_sig = 8'b00001000;
    #1  db_sig = 8'b00010000;
    #1  db_sig = 8'b00100000;
    #1  db_sig = 8'b01000000;
    #1  db_sig = 8'b10000000;
    // With carry-in
    #1  db_sig = 8'b00000001;
        shift_in_sig = 1;
    #1  db_sig = 8'b00000010;
    #1  db_sig = 8'b00000100;
    #1  db_sig = 8'b00001000;
    #1  db_sig = 8'b00010000;
    #1  db_sig = 8'b00100000;
    #1  db_sig = 8'b01000000;
    #1  db_sig = 8'b10000000;

    //------------------------------------------------------------
    // Test left shift, no carry-in
    #1  db_sig = 8'b00000001;
        shift_enable_sig = 1;
        shift_right_sig = 1;
        shift_in_sig = 0;
    #1  db_sig = 8'b00000010;
    #1  db_sig = 8'b00000100;
    #1  db_sig = 8'b00001000;
    #1  db_sig = 8'b00010000;
    #1  db_sig = 8'b00100000;
    #1  db_sig = 8'b01000000;
    #1  db_sig = 8'b10000000;
    // With carry-in
    #1  db_sig = 8'b00000001;
        shift_in_sig = 1;
    #1  db_sig = 8'b00000010;
    #1  db_sig = 8'b00000100;
    #1  db_sig = 8'b00001000;
    #1  db_sig = 8'b00010000;
    #1  db_sig = 8'b00100000;
    #1  db_sig = 8'b01000000;
    #1  db_sig = 8'b10000000;

    //------------------------------------------------------------
    // Test right shift, no carry-in - special SRA instruction
    // This instruction simply duplicates bit [7] instead of using CY
    #1  db_sig = 8'b00000001;
        shift_enable_sig = 1;
        shift_right_sig = 1;
        shift_in_sig = 0;
        shift_sra_sig = 1;
    #1  db_sig = 8'b00000010;
    #1  db_sig = 8'b00000100;
    #1  db_sig = 8'b00001000;
    #1  db_sig = 8'b00010000;
    #1  db_sig = 8'b00100000;
    #1  db_sig = 8'b01000000;
    #1  db_sig = 8'b10000000;
    // With carry-in
    #1  db_sig = 8'b00000001;
        shift_in_sig = 1;
    #1  db_sig = 8'b00000010;
    #1  db_sig = 8'b00000100;
    #1  db_sig = 8'b00001000;
    #1  db_sig = 8'b00010000;
    #1  db_sig = 8'b00100000;
    #1  db_sig = 8'b01000000;
    #1  db_sig = 8'b10000000;

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
	.shift_sra(shift_sra_sig) , 	// input shift_sra_sig
	.db(db_sig) ,	// input [7:0] db_sig
	.shift_out(shift_out_sig) ,	// output  shift_out_sig
	.out_high(out_high_sig) ,	// output [3:0] out_high_sig
	.out_low(out_low_sig) 	// output [3:0] out_low_sig
);

endmodule
