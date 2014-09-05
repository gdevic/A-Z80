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
// CREATED		"Thu Aug 14 09:43:27 2014"

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
wire	SYNTHESIZED_WIRE_29;
reg	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_10;
reg	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;

assign	iff2 = SYNTHESIZED_WIRE_11;
assign	in_nmi = SYNTHESIZED_WIRE_1;
assign	SYNTHESIZED_WIRE_7 = 1;
assign	SYNTHESIZED_WIRE_13 = 1;
assign	SYNTHESIZED_WIRE_15 = 1;
assign	SYNTHESIZED_WIRE_19 = 1;
assign	SYNTHESIZED_WIRE_23 = 1;
assign	SYNTHESIZED_WIRE_27 = 1;
assign	SYNTHESIZED_WIRE_28 = 1;



assign	SYNTHESIZED_WIRE_12 = ctl_iffx_we | ctl_iff1_iff2;

assign	SYNTHESIZED_WIRE_32 = ctl_im_we & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_31 =  ~reset;

assign	SYNTHESIZED_WIRE_2 =  ~db[0];

assign	SYNTHESIZED_WIRE_24 = ~(reset | ctl_in_int_clr);

assign	SYNTHESIZED_WIRE_3 =  ~SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_21 = db[1] & db[0];

assign	SYNTHESIZED_WIRE_17 = db[1] & SYNTHESIZED_WIRE_2;




assign	in_intr = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;


always@(SYNTHESIZED_WIRE_29 or SYNTHESIZED_WIRE_7 or setM1 or SYNTHESIZED_WIRE_6)
begin
if (~SYNTHESIZED_WIRE_29)
		SYNTHESIZED_WIRE_1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_7)
		SYNTHESIZED_WIRE_1 <= 1'b1;
else if (setM1)
	SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_6;
end

assign	SYNTHESIZED_WIRE_25 = iff_ALTERA_SYNTHESIZED1 & intr;



assign	SYNTHESIZED_WIRE_0 =  ~clk;


assign	SYNTHESIZED_WIRE_30 = ~(reset | ctl_iffx_clr);

assign	SYNTHESIZED_WIRE_10 = ~(ctl_iff1_clr | SYNTHESIZED_WIRE_8);

assign	SYNTHESIZED_WIRE_8 =  ~SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_29 = ~(reset | ctl_in_nmi_clr);


always@(SYNTHESIZED_WIRE_10 or SYNTHESIZED_WIRE_13 or SYNTHESIZED_WIRE_12 or SYNTHESIZED_WIRE_11)
begin
if (~SYNTHESIZED_WIRE_10)
		iff_ALTERA_SYNTHESIZED1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_13)
		iff_ALTERA_SYNTHESIZED1 <= 1'b1;
else if (SYNTHESIZED_WIRE_12)
	iff_ALTERA_SYNTHESIZED1 <= SYNTHESIZED_WIRE_11;
end


always@(SYNTHESIZED_WIRE_30 or SYNTHESIZED_WIRE_15 or ctl_iffx_we or ctl_iffx_bit)
begin
if (~SYNTHESIZED_WIRE_30)
		SYNTHESIZED_WIRE_11 <= 1'b0;
else if (~SYNTHESIZED_WIRE_15)
		SYNTHESIZED_WIRE_11 <= 1'b1;
else if (ctl_iffx_we)
	SYNTHESIZED_WIRE_11 <= ctl_iffx_bit;
end


always@(SYNTHESIZED_WIRE_31 or SYNTHESIZED_WIRE_19 or SYNTHESIZED_WIRE_32 or SYNTHESIZED_WIRE_17)
begin
if (~SYNTHESIZED_WIRE_31)
		im1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_19)
		im1 <= 1'b1;
else if (SYNTHESIZED_WIRE_32)
	im1 <= SYNTHESIZED_WIRE_17;
end


always@(SYNTHESIZED_WIRE_31 or SYNTHESIZED_WIRE_23 or SYNTHESIZED_WIRE_32 or SYNTHESIZED_WIRE_21)
begin
if (~SYNTHESIZED_WIRE_31)
		im2 <= 1'b0;
else if (~SYNTHESIZED_WIRE_23)
		im2 <= 1'b1;
else if (SYNTHESIZED_WIRE_32)
	im2 <= SYNTHESIZED_WIRE_21;
end


always@(SYNTHESIZED_WIRE_24 or setM1 or SYNTHESIZED_WIRE_25)
begin
if (~SYNTHESIZED_WIRE_24)
		SYNTHESIZED_WIRE_4 <= 1'b0;
else if (setM1)
	SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_25;
end


always@(SYNTHESIZED_WIRE_29 or SYNTHESIZED_WIRE_28 or nmi or SYNTHESIZED_WIRE_27)
begin
if (~SYNTHESIZED_WIRE_29)
		SYNTHESIZED_WIRE_6 <= 1'b0;
else if (~SYNTHESIZED_WIRE_28)
		SYNTHESIZED_WIRE_6 <= 1'b1;
else if (nmi)
	SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_27;
end


assign	iff1 = iff_ALTERA_SYNTHESIZED1;

endmodule
