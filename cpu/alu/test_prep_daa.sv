// Test ALU preparation for DAA block
`timescale 100 ps/ 100 ps
module test_prep_daa;

// ----------------- INPUT -----------------
reg [3:0] low_sig;          // Input data bus A (independent)
reg [3:0] high_sig;         // Input data bus B (independent)

// ----------------- OUTPUT -----------------
wire low_gt_9_sig;          // low bus > 9
wire high_gt_9_sig;         // high bus > 9
wire high_eq_9_sig;         // high bus == 9

initial begin
    low_sig  = 4'h0;
    high_sig = 4'h0;
    #1
    low_sig  = 4'h1;
    high_sig = 4'h1;
    #1
    low_sig  = 4'h2;
    high_sig = 4'h2;
    #1
    low_sig  = 4'h3;
    high_sig = 4'h3;
    #1
    low_sig  = 4'h4;
    high_sig = 4'h4;
    #1
    low_sig  = 4'h5;
    high_sig = 4'h5;
    #1
    low_sig  = 4'h6;
    high_sig = 4'h6;
    #1
    low_sig  = 4'h7;
    high_sig = 4'h7;
    #1
    low_sig  = 4'h8;
    high_sig = 4'h8;
    #1
    low_sig  = 4'h9;
    high_sig = 4'h9;
    #1
    low_sig  = 4'hA;
    high_sig = 4'hA;
    #1
    low_sig  = 4'hB;
    high_sig = 4'hB;
    #1
    low_sig  = 4'hC;
    high_sig = 4'hC;
    #1
    low_sig  = 4'hD;
    high_sig = 4'hD;
    #1
    low_sig  = 4'hE;
    high_sig = 4'hE;
    #1
    low_sig  = 4'hF;
    high_sig = 4'hF;

    #1 $display("End of test");
end

//--------------------------------------------------------------
// Instantiate prep-DAA block
//--------------------------------------------------------------
alu_prep_daa alu_prep_daa_inst
(
	.low(low_sig) ,	// input [3:0] low_sig
	.high(high_sig) ,	// input [3:0] high_sig
	.low_gt_9(low_gt_9_sig) ,	// output  low_gt_9_sig
	.high_eq_9(high_eq_9_sig) ,	// output  high_eq_9_sig
	.high_gt_9(high_gt_9_sig) 	// output  high_gt_9_sig
);

endmodule
