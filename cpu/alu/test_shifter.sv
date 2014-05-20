// Test ALU shifter input
`timescale 100 ps/ 100 ps
module test_shifter;

// ----------------- INPUT -----------------
reg [7:0] db_sig;           // Input bus
reg [2:0] op543_sig;        // Select input bit shifter operation
reg cf_in_sig;              // Carry bit into the shifter
reg shift_enable_sig;       // Enable input shift

// ----------------- OUTPUT -----------------
wire [3:0] db_in_low_sig;   // Output low nibble
wire [3:0] db_in_high_sig;  // Output high nibble
wire cf_out_sig;            // Carry bit after the input shifting

initial begin
    db_sig = 8'h00;
    op543_sig[2:0] = 3'h0;
    cf_in_sig = 0;
    shift_enable_sig = 0;

    //------------------------------------------------------------
    // Test input to ALU internal bus with no shifting
    #1  db_sig = 8'h55;             // 0101 0101

    // Start shifting tests...
    // 000 RLC -> old D7
    // 001 RRC -> old D0
    // 010 RL  -> CF
    // 011 RR  -> CF
    // 100 SLA -> 0
    // 101 SRA -> D7
    // 110 SLL -> 1
    // 111 SRL -> 0
    #1  shift_enable_sig = 1;
        cf_in_sig = 0;          // Using CF = 0
        op543_sig[2:0] = 3'h0;  // 000 RLC -> old D7    : aa
    #1  op543_sig[2:0] = 3'h1;  // 001 RRC -> old D0    : aa
    #1  op543_sig[2:0] = 3'h2;  // 010 RL  -> CF        : aa
    #1  op543_sig[2:0] = 3'h3;  // 011 RR  -> CF        : 2a
    #1  op543_sig[2:0] = 3'h4;  // 100 SLA -> 0         : aa
    #1  op543_sig[2:0] = 3'h5;  // 101 SRA -> D7        : 2a
    #1  op543_sig[2:0] = 3'h6;  // 110 SLL -> 1         : ab
    #1  op543_sig[2:0] = 3'h7;  // 111 SRL -> 0         : 2a

    #1  cf_in_sig = 1;          // Using CF = 1
        op543_sig[2:0] = 3'h0;  // 000 RLC -> old D7    : aa
    #1  op543_sig[2:0] = 3'h1;  // 001 RRC -> old D0    : aa
    #1  op543_sig[2:0] = 3'h2;  // 010 RL  -> CF        : ab
    #1  op543_sig[2:0] = 3'h3;  // 011 RR  -> CF        : aa
    #1  op543_sig[2:0] = 3'h4;  // 100 SLA -> 0         : aa
    #1  op543_sig[2:0] = 3'h5;  // 101 SRA -> D7        : 2a
    #1  op543_sig[2:0] = 3'h6;  // 110 SLL -> 1         : ab
    #1  op543_sig[2:0] = 3'h7;  // 111 SRL -> 0         : 2a

    #1  db_sig = 8'h01;             // 0000 0001
        cf_in_sig = 0;          // Using CF = 0
        op543_sig[2:0] = 3'h0;  // 000 RLC -> old D7    : 02
    #1  op543_sig[2:0] = 3'h1;  // 001 RRC -> old D0    : 80
    #1  op543_sig[2:0] = 3'h2;  // 010 RL  -> CF        : 02
    #1  op543_sig[2:0] = 3'h3;  // 011 RR  -> CF        : 00
    #1  op543_sig[2:0] = 3'h4;  // 100 SLA -> 0         : 02
    #1  op543_sig[2:0] = 3'h5;  // 101 SRA -> D7        : 00
    #1  op543_sig[2:0] = 3'h6;  // 110 SLL -> 1         : 03
    #1  op543_sig[2:0] = 3'h7;  // 111 SRL -> 0         : 00

    #1  cf_in_sig = 1;          // Using CF = 1
        op543_sig[2:0] = 3'h0;  // 000 RLC -> old D7    : 02
    #1  op543_sig[2:0] = 3'h1;  // 001 RRC -> old D0    : 80
    #1  op543_sig[2:0] = 3'h2;  // 010 RL  -> CF        : 03
    #1  op543_sig[2:0] = 3'h3;  // 011 RR  -> CF        : 80
    #1  op543_sig[2:0] = 3'h4;  // 100 SLA -> 0         : 02
    #1  op543_sig[2:0] = 3'h5;  // 101 SRA -> D7        : 00
    #1  op543_sig[2:0] = 3'h6;  // 110 SLL -> 1         : 03
    #1  op543_sig[2:0] = 3'h7;  // 111 SRL -> 0         : 00

    #1  db_sig = 8'h80;             // 1000 0000
        cf_in_sig = 0;          // Using CF = 0
        op543_sig[2:0] = 3'h0;  // 000 RLC -> old D7    : 01
    #1  op543_sig[2:0] = 3'h1;  // 001 RRC -> old D0    : 40
    #1  op543_sig[2:0] = 3'h2;  // 010 RL  -> CF        : 00
    #1  op543_sig[2:0] = 3'h3;  // 011 RR  -> CF        : 40
    #1  op543_sig[2:0] = 3'h4;  // 100 SLA -> 0         : 00
    #1  op543_sig[2:0] = 3'h5;  // 101 SRA -> D7        : c0
    #1  op543_sig[2:0] = 3'h6;  // 110 SLL -> 1         : 01
    #1  op543_sig[2:0] = 3'h7;  // 111 SRL -> 0         : 40

    #1  cf_in_sig = 1;          // Using CF = 1
        op543_sig[2:0] = 3'h0;  // 000 RLC -> old D7    : 01
    #1  op543_sig[2:0] = 3'h1;  // 001 RRC -> old D0    : 40
    #1  op543_sig[2:0] = 3'h2;  // 010 RL  -> CF        : 01
    #1  op543_sig[2:0] = 3'h3;  // 011 RR  -> CF        : c0
    #1  op543_sig[2:0] = 3'h4;  // 100 SLA -> 0         : 00
    #1  op543_sig[2:0] = 3'h5;  // 101 SRA -> D7        : c0
    #1  op543_sig[2:0] = 3'h6;  // 110 SLL -> 1         : 01
    #1  op543_sig[2:0] = 3'h7;  // 111 SRL -> 0         : 40

    #1 $display("End of test");
end

//--------------------------------------------------------------
// Instantiate ALU shifter input block
//--------------------------------------------------------------
alu_shifter alu_shifter_inst
(
	.op543(op543_sig) ,	// input [2:0] op543_sig
	.cf_in(cf_in_sig) ,	// input  cf_in_sig
	.db(db_sig) ,	// input [7:0] db_sig
	.shift_enable(shift_enable_sig) ,	// input  shift_enable_sig
	.cf_out(cf_out_sig) ,	// output  cf_out_sig
	.db_in_low(db_in_low_sig) ,	// output [3:0] db_in_low_sig
	.db_in_high(db_in_high_sig) 	// output [3:0] db_in_high_sig
);

endmodule
