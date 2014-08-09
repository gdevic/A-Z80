// Copyright (C) 1991-2011 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 11.0 Build 208 07/03/2011 Service Pack 1 SJ Full Version"
// CREATED		"Sat Aug 09 07:40:40 2014"

module decode_state(
	ctl_state_iy_set,
	ctl_state_ixiy_clr,
	ctl_state_ixiy_we,
	reset,
	ctl_state_halt_set,
	ctl_state_halt_clr,
	ctl_state_tbl_clr,
	ctl_state_tbl_ed_set,
	ctl_state_tbl_cb_set,
	ctl_state_alu,
	in_halt,
	table_cb,
	table_ed,
	table_xx,
	use_ix,
	use_ixiy,
	in_alu
);


input wire	ctl_state_iy_set;
input wire	ctl_state_ixiy_clr;
input wire	ctl_state_ixiy_we;
input wire	reset;
input wire	ctl_state_halt_set;
input wire	ctl_state_halt_clr;
input wire	ctl_state_tbl_clr;
input wire	ctl_state_tbl_ed_set;
input wire	ctl_state_tbl_cb_set;
input wire	ctl_state_alu;
output reg	in_halt;
output wire	table_cb;
output wire	table_ed;
output wire	table_xx;
output wire	use_ix;
output wire	use_ixiy;
output wire	in_alu;

reg	SYNTHESIZED_WIRE_0;
reg	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_2;
reg	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_14;

assign	in_alu = ctl_state_alu;
assign	table_cb = SYNTHESIZED_WIRE_1;
assign	table_ed = SYNTHESIZED_WIRE_0;
assign	use_ix = SYNTHESIZED_WIRE_3;
assign	SYNTHESIZED_WIRE_5 = 1;
assign	SYNTHESIZED_WIRE_7 = 1;
assign	SYNTHESIZED_WIRE_9 = 1;
assign	SYNTHESIZED_WIRE_12 = 1;
assign	SYNTHESIZED_WIRE_14 = 1;



assign	table_xx = ~(SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1);

assign	SYNTHESIZED_WIRE_16 = ~(ctl_state_ixiy_clr | reset);

assign	SYNTHESIZED_WIRE_8 = ~(reset | ctl_state_halt_clr);




assign	SYNTHESIZED_WIRE_15 = ~(reset | ctl_state_tbl_clr);

assign	use_ixiy = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;



assign	SYNTHESIZED_WIRE_11 =  ~ctl_state_iy_set;


always@(SYNTHESIZED_WIRE_15 or SYNTHESIZED_WIRE_5 or ctl_state_tbl_cb_set or ctl_state_tbl_cb_set)
begin
if (~SYNTHESIZED_WIRE_15)
		SYNTHESIZED_WIRE_1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_5)
		SYNTHESIZED_WIRE_1 <= 1'b1;
else if (ctl_state_tbl_cb_set)
	SYNTHESIZED_WIRE_1 <= ctl_state_tbl_cb_set;
end


always@(SYNTHESIZED_WIRE_15 or SYNTHESIZED_WIRE_7 or ctl_state_tbl_ed_set or ctl_state_tbl_ed_set)
begin
if (~SYNTHESIZED_WIRE_15)
		SYNTHESIZED_WIRE_0 <= 1'b0;
else if (~SYNTHESIZED_WIRE_7)
		SYNTHESIZED_WIRE_0 <= 1'b1;
else if (ctl_state_tbl_ed_set)
	SYNTHESIZED_WIRE_0 <= ctl_state_tbl_ed_set;
end


always@(SYNTHESIZED_WIRE_8 or SYNTHESIZED_WIRE_9 or ctl_state_halt_set or ctl_state_halt_set)
begin
if (~SYNTHESIZED_WIRE_8)
		in_halt <= 1'b0;
else if (~SYNTHESIZED_WIRE_9)
		in_halt <= 1'b1;
else if (ctl_state_halt_set)
	in_halt <= ctl_state_halt_set;
end


always@(SYNTHESIZED_WIRE_16 or SYNTHESIZED_WIRE_12 or ctl_state_ixiy_we or SYNTHESIZED_WIRE_11)
begin
if (~SYNTHESIZED_WIRE_16)
		SYNTHESIZED_WIRE_3 <= 1'b0;
else if (~SYNTHESIZED_WIRE_12)
		SYNTHESIZED_WIRE_3 <= 1'b1;
else if (ctl_state_ixiy_we)
	SYNTHESIZED_WIRE_3 <= SYNTHESIZED_WIRE_11;
end


always@(SYNTHESIZED_WIRE_16 or SYNTHESIZED_WIRE_14 or ctl_state_ixiy_we or ctl_state_iy_set)
begin
if (~SYNTHESIZED_WIRE_16)
		SYNTHESIZED_WIRE_2 <= 1'b0;
else if (~SYNTHESIZED_WIRE_14)
		SYNTHESIZED_WIRE_2 <= 1'b1;
else if (ctl_state_ixiy_we)
	SYNTHESIZED_WIRE_2 <= ctl_state_iy_set;
end


endmodule
