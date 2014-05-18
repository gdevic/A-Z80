// Test ALU shifter input
`timescale 100 ps/ 100 ps
module test_shifter;

// ----------------- BUSSES -----------------
// We have 2 (well, 3) bi-directional buses:
// To the outside, there is the main ALU bus
reg  [7:0] db;              // Drive it using this bus
wire [7:0] db_sig;          // Read it using this bus

// Inside the ALU, there are high and low 4-bit buses
reg  [3:0] db_high;         // Drive it using this bus
wire [3:0] db_high_sig;     // Read it using this bus

reg  [3:0] db_low;          // Drive it using this bus
wire [3:0] db_low_sig;      // Read it using this bus

// ----------------- INPUT -----------------
reg [2:0] op543_sig;        // Select input bit shifter operation
reg cf_in_sig;              // Carry bit into the shifter
reg alu_shift_enable_sig;   // Enable input shift
reg alu_shift_oe_sig;       // Write shifted bit into the internal ALU bus

reg alu_oe_sig;             // ALU enable writing to the public bus

// ----------------- OUTPUT -----------------
wire cf_out_sig;            // Carry bit after the input shifting

initial begin
    db = 8'h00;
    db_high = 4'h0;
    db_low  = 4'h0;
    op543_sig[2:0] = 3'h0;
    cf_in_sig = 0;
    alu_shift_enable_sig = 0;
    alu_shift_oe_sig = 0;
    alu_oe_sig = 0;

    //------------------------------------------------------------
    // Test ALU output drivers
    #1  db = 'z;
        db_high = 4'h8;
        db_low  = 4'h3;
        alu_oe_sig = 1;         // Expect db = 83

    //------------------------------------------------------------
    // Test input to ALU internal bus with no shifting
    #1  db = 8'h55;             // 0101 0101
        db_high = 'z;
        db_low  = 'z;
        alu_oe_sig = 0;
        alu_shift_oe_sig = 1;   // Expect 5 5

    // Start shifting tests...
    // 000 RLC -> old D7
    // 001 RRC -> old D0
    // 010 RL  -> CF
    // 011 RR  -> CF
    // 100 SLA -> 0
    // 101 SRA -> D7
    // 110 SLL -> 1
    // 111 SRL -> 0
    #1  alu_shift_enable_sig = 1;
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

    #1  db = 8'h01;             // 0000 0001
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

    #1  db = 8'h80;             // 1000 0000
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

// Drive 3-state bidirectional buses with these statements
assign db_sig = db;             // Bus to the outside world

assign db_high_sig = db_high;   // Internal ALU bus
assign db_low_sig = db_low;     // Internal ALU bus

//--------------------------------------------------------------
// Instantiate ALU shifter input block
//--------------------------------------------------------------
alu_shifter alu_shifter_inst
(
	.op543(op543_sig) ,	// input [2:0] op543_sig
	.cf_in(cf_in_sig) ,	// input  cf_in_sig
	.alu_oe(alu_oe_sig) ,	// input  alu_oe_sig
	.alu_shift_enable(alu_shift_enable_sig) ,	// input  alu_shift_enable_sig
	.alu_shift_oe(alu_shift_oe_sig) ,	// input  alu_shift_oe_sig
	.cf_out(cf_out_sig) ,	// output  cf_out_sig
	.db(db_sig) ,	// inout [7:0] db_sig
	.db_high(db_high_sig) ,	// inout [3:0] db_high_sig
	.db_low(db_low_sig) 	// inout [3:0] db_low_sig
);

endmodule
