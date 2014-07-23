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
// CREATED		"Wed Jul 23 00:22:52 2014"

module interrupts(
	reset,
	ctl_iffx_clr,
	ctl_iffx_set,
	ctl_iff1_clr,
	ctl_iff1_iff2,
	ctl_im_set,
	ctl_im_sel3,
	ctl_im_sel4,
	iff1,
	iff2,
	im1,
	im2
);


input wire	reset;
input wire	ctl_iffx_clr;
input wire	ctl_iffx_set;
input wire	ctl_iff1_clr;
input wire	ctl_iff1_iff2;
input wire	ctl_im_set;
input wire	ctl_im_sel3;
input wire	ctl_im_sel4;
output reg	iff1;
output wire	iff2;
output reg	im1;
output reg	im2;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_3;
reg	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;

assign	iff2 = SYNTHESIZED_WIRE_4;
assign	SYNTHESIZED_WIRE_18 = 0;
assign	SYNTHESIZED_WIRE_12 = 1;
assign	SYNTHESIZED_WIRE_15 = 1;




assign	SYNTHESIZED_WIRE_19 =  ~reset;

assign	SYNTHESIZED_WIRE_0 =  ~ctl_im_sel3;

assign	SYNTHESIZED_WIRE_14 = ctl_im_sel3 & ctl_im_sel4;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_0 & ctl_im_sel4;


assign	SYNTHESIZED_WIRE_16 = ~(reset | ctl_iffx_clr);

assign	SYNTHESIZED_WIRE_3 = ~(ctl_iff1_clr | SYNTHESIZED_WIRE_1);

assign	SYNTHESIZED_WIRE_17 =  ~ctl_iffx_set;

assign	SYNTHESIZED_WIRE_1 =  ~SYNTHESIZED_WIRE_16;


always@(SYNTHESIZED_WIRE_3 or SYNTHESIZED_WIRE_17 or ctl_iff1_iff2 or SYNTHESIZED_WIRE_4)
begin
if (~SYNTHESIZED_WIRE_3)
		iff1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_17)
		iff1 <= 1'b1;
else if (ctl_iff1_iff2)
	iff1 <= SYNTHESIZED_WIRE_4;
end


always@(SYNTHESIZED_WIRE_16 or SYNTHESIZED_WIRE_17 or SYNTHESIZED_WIRE_18 or SYNTHESIZED_WIRE_18)
begin
if (~SYNTHESIZED_WIRE_16)
		SYNTHESIZED_WIRE_4 <= 1'b0;
else if (~SYNTHESIZED_WIRE_17)
		SYNTHESIZED_WIRE_4 <= 1'b1;
else if (SYNTHESIZED_WIRE_18)
	SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_18;
end


always@(SYNTHESIZED_WIRE_19 or SYNTHESIZED_WIRE_12 or ctl_im_set or SYNTHESIZED_WIRE_11)
begin
if (~SYNTHESIZED_WIRE_19)
		im1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_12)
		im1 <= 1'b1;
else if (ctl_im_set)
	im1 <= SYNTHESIZED_WIRE_11;
end


always@(SYNTHESIZED_WIRE_19 or SYNTHESIZED_WIRE_15 or ctl_im_set or SYNTHESIZED_WIRE_14)
begin
if (~SYNTHESIZED_WIRE_19)
		im2 <= 1'b0;
else if (~SYNTHESIZED_WIRE_15)
		im2 <= 1'b1;
else if (ctl_im_set)
	im2 <= SYNTHESIZED_WIRE_14;
end



endmodule
