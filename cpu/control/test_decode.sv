// Test PLA decode and combinatorial static execute
`timescale 1ns/ 100 ps
module test_decode;

reg [7:0] ir_sig;
reg [4:0] prefix_sig;
wire [107:0] pla_sig;

initial begin
    prefix_sig[4:0] = 5'b00100;
end

always begin
    ir_sig[7:0] = 8'h27;
    #10;
    $stop;
end

pla_decode pla_decode_inst
(
	.ir(ir_sig) ,	// input [7:0] ir_sig
	.prefix(prefix_sig) ,	// input [4:0] prefix_sig
	.pla(pla_sig) 	// output [107:0] pla_sig
);

execute execute_inst
(
	.pla(pla_sig) ,	// input [107:0] pla_sig
	.M1(M1_sig) ,	// input  M1_sig
	.M2(M2_sig) ,	// input  M2_sig
	.M3(M3_sig) ,	// input  M3_sig
	.M4(M4_sig) ,	// input  M4_sig
	.M5(M5_sig) ,	// input  M5_sig
	.M6(M6_sig) ,	// input  M6_sig
	.T1(T1_sig) ,	// input  T1_sig
	.T2(T2_sig) ,	// input  T2_sig
	.T3(T3_sig) ,	// input  T3_sig
	.T4(T4_sig) ,	// input  T4_sig
	.T5(T5_sig) ,	// input  T5_sig
	.T6(T6_sig) ,	// input  T6_sig
	.nextM(nextM_sig) ,	// output  nextM_sig
	.setM1(setM1_sig) ,	// output  setM1_sig
	.setM1ss(setM1ss_sig) ,	// output  setM1ss_sig
	.setM1cc(setM1cc_sig) ,	// output  setM1cc_sig
	.setM1bz(setM1bz_sig) ,	// output  setM1bz_sig
	.fFetch(fFetch_sig) ,	// output  fFetch_sig
	.fMRead(fMRead_sig) ,	// output  fMRead_sig
	.fMWrite(fMWrite_sig) ,	// output  fMWrite_sig
	.fIORead(fIORead_sig) ,	// output  fIORead_sig
	.fIOWrite(fIOWrite_sig) ,	// output  fIOWrite_sig
	.FIntr(FIntr_sig) ,	// output  FIntr_sig
	.ctl_bus_sw1(ctl_bus_sw1_sig) ,	// output  ctl_bus_sw1_sig
	.ctl_bus_sw2(ctl_bus_sw2_sig) ,	// output  ctl_bus_sw2_sig
	.ctl_bus_sw4(ctl_bus_sw4_sig) ,	// output  ctl_bus_sw4_sig
	.ctl_al_we(ctl_al_we_sig) ,	// output  ctl_al_we_sig
	.ctl_inc_dec(ctl_inc_dec_sig) ,	// output  ctl_inc_dec_sig
	.ctl_inc_limit6(ctl_inc_limit6_sig) ,	// output  ctl_inc_limit6_sig
	.ctl_inc_cy(ctl_inc_cy_sig) ,	// output  ctl_inc_cy_sig
	.ctl_ab_mux_inc(ctl_ab_mux_inc_sig) ,	// output  ctl_ab_mux_inc_sig
	.explode(explode_sig) 	// output  explode_sig
);

endmodule
