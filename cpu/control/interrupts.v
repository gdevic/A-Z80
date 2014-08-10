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
// CREATED		"Sat Aug 09 20:42:29 2014"

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
reg	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
reg	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_6;
reg	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
reg	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;

assign	iff2 = SYNTHESIZED_WIRE_7;
assign	in_nmi = SYNTHESIZED_WIRE_0;
assign	SYNTHESIZED_WIRE_27 = 0;
assign	SYNTHESIZED_WIRE_15 = 1;
assign	SYNTHESIZED_WIRE_18 = 1;
assign	SYNTHESIZED_WIRE_23 = 1;
assign	SYNTHESIZED_WIRE_24 = 1;




assign	SYNTHESIZED_WIRE_28 =  ~reset;

assign	SYNTHESIZED_WIRE_1 =  ~ctl_im_sel3;

assign	SYNTHESIZED_WIRE_19 = ~(reset | ctl_in_int_clr);

assign	SYNTHESIZED_WIRE_2 =  ~SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_17 = ctl_im_sel3 & ctl_im_sel4;

assign	SYNTHESIZED_WIRE_14 = SYNTHESIZED_WIRE_1 & ctl_im_sel4;




assign	in_intr = SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_20 = iff_ALTERA_SYNTHESIZED1 & intr;

assign	SYNTHESIZED_WIRE_25 = ~(reset | ctl_iffx_clr);

assign	SYNTHESIZED_WIRE_6 = ~(ctl_iff1_clr | SYNTHESIZED_WIRE_4);

assign	SYNTHESIZED_WIRE_26 =  ~ctl_iffx_set;

assign	SYNTHESIZED_WIRE_4 =  ~SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_22 = ~(reset | ctl_in_nmi_clr);


always@(SYNTHESIZED_WIRE_6 or SYNTHESIZED_WIRE_26 or ctl_iff1_iff2 or SYNTHESIZED_WIRE_7)
begin
if (~SYNTHESIZED_WIRE_6)
		iff_ALTERA_SYNTHESIZED1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_26)
		iff_ALTERA_SYNTHESIZED1 <= 1'b1;
else if (ctl_iff1_iff2)
	iff_ALTERA_SYNTHESIZED1 <= SYNTHESIZED_WIRE_7;
end


always@(SYNTHESIZED_WIRE_25 or SYNTHESIZED_WIRE_26 or SYNTHESIZED_WIRE_27 or SYNTHESIZED_WIRE_27)
begin
if (~SYNTHESIZED_WIRE_25)
		SYNTHESIZED_WIRE_7 <= 1'b0;
else if (~SYNTHESIZED_WIRE_26)
		SYNTHESIZED_WIRE_7 <= 1'b1;
else if (SYNTHESIZED_WIRE_27)
	SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_27;
end


always@(SYNTHESIZED_WIRE_28 or SYNTHESIZED_WIRE_15 or ctl_im_set or SYNTHESIZED_WIRE_14)
begin
if (~SYNTHESIZED_WIRE_28)
		im1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_15)
		im1 <= 1'b1;
else if (ctl_im_set)
	im1 <= SYNTHESIZED_WIRE_14;
end


always@(SYNTHESIZED_WIRE_28 or SYNTHESIZED_WIRE_18 or ctl_im_set or SYNTHESIZED_WIRE_17)
begin
if (~SYNTHESIZED_WIRE_28)
		im2 <= 1'b0;
else if (~SYNTHESIZED_WIRE_18)
		im2 <= 1'b1;
else if (ctl_im_set)
	im2 <= SYNTHESIZED_WIRE_17;
end


always@(SYNTHESIZED_WIRE_19 or setM1 or SYNTHESIZED_WIRE_20)
begin
if (~SYNTHESIZED_WIRE_19)
		SYNTHESIZED_WIRE_3 <= 1'b0;
else if (setM1)
	SYNTHESIZED_WIRE_3 <= SYNTHESIZED_WIRE_20;
end


always@(setM1 or SYNTHESIZED_WIRE_21)
begin
if (setM1)
	SYNTHESIZED_WIRE_0 <= SYNTHESIZED_WIRE_21;
end


always@(SYNTHESIZED_WIRE_22 or SYNTHESIZED_WIRE_24 or nmi or SYNTHESIZED_WIRE_23)
begin
if (~SYNTHESIZED_WIRE_22)
		SYNTHESIZED_WIRE_21 <= 1'b0;
else if (~SYNTHESIZED_WIRE_24)
		SYNTHESIZED_WIRE_21 <= 1'b1;
else if (nmi)
	SYNTHESIZED_WIRE_21 <= SYNTHESIZED_WIRE_23;
end


assign	iff1 = iff_ALTERA_SYNTHESIZED1;

endmodule
