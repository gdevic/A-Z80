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
// CREATED		"Sat Sep 06 00:43:32 2014"

module interrupts(
	reset,
	ctl_iffx_clr,
	ctl_iff1_clr,
	ctl_iff1_iff2,
	nmi,
	ctl_in_nmi_clr,
	setM1,
	ctl_in_int_clr,
	intr,
	ctl_iffx_we,
	ctl_iffx_bit,
	ctl_im_we,
	clk,
	ctl_no_ints,
	db,
	iff1,
	iff2,
	im1,
	im2,
	in_nmi,
	in_intr
);


input wire	reset;
input wire	ctl_iffx_clr;
input wire	ctl_iff1_clr;
input wire	ctl_iff1_iff2;
input wire	nmi;
input wire	ctl_in_nmi_clr;
input wire	setM1;
input wire	ctl_in_int_clr;
input wire	intr;
input wire	ctl_iffx_we;
input wire	ctl_iffx_bit;
input wire	ctl_im_we;
input wire	clk;
input wire	ctl_no_ints;
input wire	[1:0] db;
output wire	iff1;
output wire	iff2;
output reg	im1;
output reg	im2;
output wire	in_nmi;
output wire	in_intr;

reg	iff_ALTERA_SYNTHESIZED1;
wire	SYNTHESIZED_WIRE_0;
reg	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
reg	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_32;
reg	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_12;
reg	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;

assign	iff2 = SYNTHESIZED_WIRE_13;
assign	in_nmi = SYNTHESIZED_WIRE_1;
assign	SYNTHESIZED_WIRE_8 = 1;
assign	SYNTHESIZED_WIRE_15 = 1;
assign	SYNTHESIZED_WIRE_17 = 1;
assign	SYNTHESIZED_WIRE_21 = 1;
assign	SYNTHESIZED_WIRE_25 = 1;
assign	SYNTHESIZED_WIRE_30 = 1;
assign	SYNTHESIZED_WIRE_31 = 1;



assign	SYNTHESIZED_WIRE_14 = ctl_iffx_we | ctl_iff1_iff2;

assign	SYNTHESIZED_WIRE_36 = ctl_im_we & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_35 =  ~reset;

assign	SYNTHESIZED_WIRE_2 =  ~db[0];

assign	SYNTHESIZED_WIRE_26 = ~(reset | ctl_in_int_clr);

assign	SYNTHESIZED_WIRE_3 =  ~SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_23 = db[1] & db[0];

assign	SYNTHESIZED_WIRE_19 = db[1] & SYNTHESIZED_WIRE_2;




assign	in_intr = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;


always@(SYNTHESIZED_WIRE_32 or SYNTHESIZED_WIRE_8 or SYNTHESIZED_WIRE_33 or SYNTHESIZED_WIRE_6)
begin
if (~SYNTHESIZED_WIRE_32)
		SYNTHESIZED_WIRE_1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_8)
		SYNTHESIZED_WIRE_1 <= 1'b1;
else if (SYNTHESIZED_WIRE_33)
	SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_6;
end

assign	SYNTHESIZED_WIRE_27 = iff_ALTERA_SYNTHESIZED1 & intr;



assign	SYNTHESIZED_WIRE_33 = setM1 & SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_0 =  ~clk;


assign	SYNTHESIZED_WIRE_34 = ~(reset | ctl_iffx_clr);

assign	SYNTHESIZED_WIRE_12 = ~(ctl_iff1_clr | SYNTHESIZED_WIRE_10);

assign	SYNTHESIZED_WIRE_9 =  ~ctl_no_ints;

assign	SYNTHESIZED_WIRE_10 =  ~SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_32 = ~(reset | ctl_in_nmi_clr);


always@(SYNTHESIZED_WIRE_12 or SYNTHESIZED_WIRE_15 or SYNTHESIZED_WIRE_14 or SYNTHESIZED_WIRE_13)
begin
if (~SYNTHESIZED_WIRE_12)
		iff_ALTERA_SYNTHESIZED1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_15)
		iff_ALTERA_SYNTHESIZED1 <= 1'b1;
else if (SYNTHESIZED_WIRE_14)
	iff_ALTERA_SYNTHESIZED1 <= SYNTHESIZED_WIRE_13;
end


always@(SYNTHESIZED_WIRE_34 or SYNTHESIZED_WIRE_17 or ctl_iffx_we or ctl_iffx_bit)
begin
if (~SYNTHESIZED_WIRE_34)
		SYNTHESIZED_WIRE_13 <= 1'b0;
else if (~SYNTHESIZED_WIRE_17)
		SYNTHESIZED_WIRE_13 <= 1'b1;
else if (ctl_iffx_we)
	SYNTHESIZED_WIRE_13 <= ctl_iffx_bit;
end


always@(SYNTHESIZED_WIRE_35 or SYNTHESIZED_WIRE_21 or SYNTHESIZED_WIRE_36 or SYNTHESIZED_WIRE_19)
begin
if (~SYNTHESIZED_WIRE_35)
		im1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_21)
		im1 <= 1'b1;
else if (SYNTHESIZED_WIRE_36)
	im1 <= SYNTHESIZED_WIRE_19;
end


always@(SYNTHESIZED_WIRE_35 or SYNTHESIZED_WIRE_25 or SYNTHESIZED_WIRE_36 or SYNTHESIZED_WIRE_23)
begin
if (~SYNTHESIZED_WIRE_35)
		im2 <= 1'b0;
else if (~SYNTHESIZED_WIRE_25)
		im2 <= 1'b1;
else if (SYNTHESIZED_WIRE_36)
	im2 <= SYNTHESIZED_WIRE_23;
end


always@(SYNTHESIZED_WIRE_26 or SYNTHESIZED_WIRE_33 or SYNTHESIZED_WIRE_27)
begin
if (~SYNTHESIZED_WIRE_26)
		SYNTHESIZED_WIRE_4 <= 1'b0;
else if (SYNTHESIZED_WIRE_33)
	SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_27;
end


always@(SYNTHESIZED_WIRE_32 or SYNTHESIZED_WIRE_31 or nmi or SYNTHESIZED_WIRE_30)
begin
if (~SYNTHESIZED_WIRE_32)
		SYNTHESIZED_WIRE_6 <= 1'b0;
else if (~SYNTHESIZED_WIRE_31)
		SYNTHESIZED_WIRE_6 <= 1'b1;
else if (nmi)
	SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_30;
end


assign	iff1 = iff_ALTERA_SYNTHESIZED1;

endmodule
