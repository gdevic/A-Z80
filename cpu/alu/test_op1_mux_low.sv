// Test ALU op1 MUX low
`timescale 100 ps/ 100 ps
module test_op1_mux_low;

// ----------------- INPUT -----------------
reg sel_kk_sig;
reg sel_ll_sig;
reg sel_jj_sig;
reg [3:0] ll_sig;
reg [3:0] jj_sig;

// ----------------- OUTPUT -----------------
wire [3:0] Q_sig;           // Output of a mux
wire ena_out_sig;           // Write enable to the latch

initial begin
    ll_sig = 0;
    jj_sig = 0;
    sel_kk_sig = 0;
    sel_ll_sig = 0;
    sel_jj_sig = 0;
    
    ll_sig = 4'hA;
    jj_sig = 4'h5;
    
    #1  sel_kk_sig = 0;
        sel_ll_sig = 0;
        sel_jj_sig = 0;

    #1  sel_kk_sig = 1;
        sel_ll_sig = 0;
        sel_jj_sig = 0;

    #1  sel_kk_sig = 0;
        sel_ll_sig = 1;
        sel_jj_sig = 0;

    #1  sel_kk_sig = 0;
        sel_ll_sig = 0;
        sel_jj_sig = 1;

    #1  sel_kk_sig = 1;
        sel_ll_sig = 1;
        sel_jj_sig = 1;

    #1 $display("End of test");
end

//--------------------------------------------------------------
// Instantiate a mux
//--------------------------------------------------------------
alu_op1_mux_low alu_op1_mux_low_inst
(
	.sel_kk(sel_kk_sig) ,	// input  sel_kk_sig
	.ll(ll_sig) ,	// input [3:0] ll_sig
	.sel_ll(sel_ll_sig) ,	// input  sel_ll_sig
	.jj(jj_sig) ,	// input [3:0] jj_sig
	.sel_jj(sel_jj_sig) ,	// input  sel_jj_sig
	.Q(Q_sig) ,	// output [3:0] Q_sig
	.ena_out(ena_out_sig) 	// output  ena_out_sig
);

endmodule
