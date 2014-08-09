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
// CREATED		"Sat Aug 09 12:18:37 2014"

module interrupts(
	reset,
	ctl_iffx_clr,
	ctl_iffx_set,
	ctl_iff1_clr,
	ctl_iff1_iff2,
	ctl_im_set,
	ctl_im_sel3,
	ctl_im_sel4,
	nmi,
	ctl_in_nmi_clr,
	setM1,
	ctl_in_int_clr,
	intr,
	iff1,
	iff2,
	im1,
	im2,
	in_nmi,
	in_intr
);


input wire	reset;
input wire	ctl_iffx_clr;
input wire	ctl_iffx_set;
input wire	ctl_iff1_clr;
input wire	ctl_iff1_iff2;
input wire	ctl_im_set;
input wire	ctl_im_sel3;
input wire	ctl_im_sel4;
input wire	nmi;
input wire	ctl_in_nmi_clr;
input wire	setM1;
input wire	ctl_in_int_clr;
input wire	intr;
output wire	iff1;
output wire	iff2;
output reg	im1;
output reg	im2;
output wire	in_nmi;
output wire	in_intr;

reg	iff_ALTERA_SYNTHESIZED1;
wire	SYNTHESIZED_WIRE_0;
reg	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_5;
reg	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
reg	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;

assign	iff2 = SYNTHESIZED_WIRE_6;
assign	in_nmi = SYNTHESIZED_WIRE_1;
assign	SYNTHESIZED_WIRE_26 = 0;
assign	SYNTHESIZED_WIRE_14 = 1;
assign	SYNTHESIZED_WIRE_17 = 1;
assign	SYNTHESIZED_WIRE_22 = 1;
assign	SYNTHESIZED_WIRE_23 = 1;




assign	SYNTHESIZED_WIRE_27 =  ~reset;

assign	SYNTHESIZED_WIRE_0 =  ~ctl_im_sel3;

assign	SYNTHESIZED_WIRE_18 = ~(reset | ctl_in_int_clr);

assign	SYNTHESIZED_WIRE_16 = ctl_im_sel3 & ctl_im_sel4;

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_0 & ctl_im_sel4;




assign	in_intr = SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_19 = iff_ALTERA_SYNTHESIZED1 & intr;

assign	SYNTHESIZED_WIRE_24 = ~(reset | ctl_iffx_clr);

assign	SYNTHESIZED_WIRE_5 = ~(ctl_iff1_clr | SYNTHESIZED_WIRE_3);

assign	SYNTHESIZED_WIRE_25 =  ~ctl_iffx_set;

assign	SYNTHESIZED_WIRE_3 =  ~SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_21 = ~(reset | ctl_in_nmi_clr);


always@(SYNTHESIZED_WIRE_5 or SYNTHESIZED_WIRE_25 or ctl_iff1_iff2 or SYNTHESIZED_WIRE_6)
begin
if (~SYNTHESIZED_WIRE_5)
		iff_ALTERA_SYNTHESIZED1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_25)
		iff_ALTERA_SYNTHESIZED1 <= 1'b1;
else if (ctl_iff1_iff2)
	iff_ALTERA_SYNTHESIZED1 <= SYNTHESIZED_WIRE_6;
end


always@(SYNTHESIZED_WIRE_24 or SYNTHESIZED_WIRE_25 or SYNTHESIZED_WIRE_26 or SYNTHESIZED_WIRE_26)
begin
if (~SYNTHESIZED_WIRE_24)
		SYNTHESIZED_WIRE_6 <= 1'b0;
else if (~SYNTHESIZED_WIRE_25)
		SYNTHESIZED_WIRE_6 <= 1'b1;
else if (SYNTHESIZED_WIRE_26)
	SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_26;
end


always@(SYNTHESIZED_WIRE_27 or SYNTHESIZED_WIRE_14 or ctl_im_set or SYNTHESIZED_WIRE_13)
begin
if (~SYNTHESIZED_WIRE_27)
		im1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_14)
		im1 <= 1'b1;
else if (ctl_im_set)
	im1 <= SYNTHESIZED_WIRE_13;
end


always@(SYNTHESIZED_WIRE_27 or SYNTHESIZED_WIRE_17 or ctl_im_set or SYNTHESIZED_WIRE_16)
begin
if (~SYNTHESIZED_WIRE_27)
		im2 <= 1'b0;
else if (~SYNTHESIZED_WIRE_17)
		im2 <= 1'b1;
else if (ctl_im_set)
	im2 <= SYNTHESIZED_WIRE_16;
end


always@(SYNTHESIZED_WIRE_18 or setM1 or SYNTHESIZED_WIRE_19)
begin
if (~SYNTHESIZED_WIRE_18)
		SYNTHESIZED_WIRE_2 <= 1'b0;
else if (setM1)
	SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_19;
end


always@(setM1 or SYNTHESIZED_WIRE_20)
begin
if (setM1)
	SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_20;
end


always@(SYNTHESIZED_WIRE_21 or SYNTHESIZED_WIRE_23 or nmi or SYNTHESIZED_WIRE_22)
begin
if (~SYNTHESIZED_WIRE_21)
		SYNTHESIZED_WIRE_20 <= 1'b0;
else if (~SYNTHESIZED_WIRE_23)
		SYNTHESIZED_WIRE_20 <= 1'b1;
else if (nmi)
	SYNTHESIZED_WIRE_20 <= SYNTHESIZED_WIRE_22;
end


assign	iff1 = iff_ALTERA_SYNTHESIZED1;

endmodule
