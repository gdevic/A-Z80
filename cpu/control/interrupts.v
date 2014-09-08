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
// CREATED		"Sun Sep 07 21:21:41 2014"

module interrupts(
	reset,
	ctl_iff1_iff2,
	nmi,
	setM1,
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
input wire	ctl_iff1_iff2;
input wire	nmi;
input wire	setM1;
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
wire	in_intr_ALTERA_SYNTHESIZED;
reg	in_nmi_ALTERA_SYNTHESIZED;
reg	int_armed;
reg	nmi_armed;
wire	nreset;
wire	test1;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
reg	DFFE_inst44;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_14;
reg	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_27;

assign	iff2 = SYNTHESIZED_WIRE_15;
assign	SYNTHESIZED_WIRE_5 = 1;
assign	SYNTHESIZED_WIRE_6 = 1;
assign	SYNTHESIZED_WIRE_7 = 1;
assign	SYNTHESIZED_WIRE_8 = 1;
assign	SYNTHESIZED_WIRE_11 = 1;
assign	SYNTHESIZED_WIRE_17 = 1;
assign	SYNTHESIZED_WIRE_19 = 1;
assign	SYNTHESIZED_WIRE_23 = 1;
assign	SYNTHESIZED_WIRE_27 = 1;



assign	SYNTHESIZED_WIRE_16 = ctl_iffx_we | ctl_iff1_iff2;

assign	SYNTHESIZED_WIRE_30 = ctl_im_we & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_29 =  ~reset;

assign	SYNTHESIZED_WIRE_1 =  ~db[0];

assign	SYNTHESIZED_WIRE_9 = ~(in_intr_ALTERA_SYNTHESIZED | reset);

assign	SYNTHESIZED_WIRE_2 =  ~in_nmi_ALTERA_SYNTHESIZED;

assign	SYNTHESIZED_WIRE_25 = db[1] & db[0];

assign	SYNTHESIZED_WIRE_21 = db[1] & SYNTHESIZED_WIRE_1;




assign	in_intr_ALTERA_SYNTHESIZED = SYNTHESIZED_WIRE_2 & DFFE_inst44;

assign	SYNTHESIZED_WIRE_10 = iff_ALTERA_SYNTHESIZED1 & intr;



assign	test1 = setM1 & SYNTHESIZED_WIRE_3;



always@(posedge nmi or negedge SYNTHESIZED_WIRE_4 or negedge SYNTHESIZED_WIRE_6)
begin
if (!SYNTHESIZED_WIRE_4)
	begin
	nmi_armed <= 0;
	end
else
if (!SYNTHESIZED_WIRE_6)
	begin
	nmi_armed <= 1;
	end
else
	begin
	nmi_armed <= SYNTHESIZED_WIRE_5;
	end
end

assign	SYNTHESIZED_WIRE_0 =  ~clk;



always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_7)
begin
if (!nreset)
	begin
	in_nmi_ALTERA_SYNTHESIZED <= 0;
	end
else
if (!SYNTHESIZED_WIRE_7)
	begin
	in_nmi_ALTERA_SYNTHESIZED <= 1;
	end
else
if (test1)
	begin
	in_nmi_ALTERA_SYNTHESIZED <= nmi_armed;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_8)
begin
if (!nreset)
	begin
	DFFE_inst44 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_8)
	begin
	DFFE_inst44 <= 1;
	end
else
if (test1)
	begin
	DFFE_inst44 <= int_armed;
	end
end


assign	nreset =  ~reset;


always@(posedge clk or negedge SYNTHESIZED_WIRE_9 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_9)
	begin
	int_armed <= 0;
	end
else
if (!SYNTHESIZED_WIRE_11)
	begin
	int_armed <= 1;
	end
else
	begin
	int_armed <= SYNTHESIZED_WIRE_10;
	end
end

assign	SYNTHESIZED_WIRE_28 = ~(reset | in_intr_ALTERA_SYNTHESIZED);

assign	SYNTHESIZED_WIRE_14 = ~(in_nmi_ALTERA_SYNTHESIZED | SYNTHESIZED_WIRE_12);

assign	SYNTHESIZED_WIRE_3 =  ~ctl_no_ints;

assign	SYNTHESIZED_WIRE_12 =  ~SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_4 = ~(in_nmi_ALTERA_SYNTHESIZED | reset);


always@(SYNTHESIZED_WIRE_14 or SYNTHESIZED_WIRE_17 or SYNTHESIZED_WIRE_16 or SYNTHESIZED_WIRE_15)
begin
if (~SYNTHESIZED_WIRE_14)
		iff_ALTERA_SYNTHESIZED1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_17)
		iff_ALTERA_SYNTHESIZED1 <= 1'b1;
else if (SYNTHESIZED_WIRE_16)
	iff_ALTERA_SYNTHESIZED1 <= SYNTHESIZED_WIRE_15;
end


always@(SYNTHESIZED_WIRE_28 or SYNTHESIZED_WIRE_19 or ctl_iffx_we or ctl_iffx_bit)
begin
if (~SYNTHESIZED_WIRE_28)
		SYNTHESIZED_WIRE_15 <= 1'b0;
else if (~SYNTHESIZED_WIRE_19)
		SYNTHESIZED_WIRE_15 <= 1'b1;
else if (ctl_iffx_we)
	SYNTHESIZED_WIRE_15 <= ctl_iffx_bit;
end


always@(SYNTHESIZED_WIRE_29 or SYNTHESIZED_WIRE_23 or SYNTHESIZED_WIRE_30 or SYNTHESIZED_WIRE_21)
begin
if (~SYNTHESIZED_WIRE_29)
		im1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_23)
		im1 <= 1'b1;
else if (SYNTHESIZED_WIRE_30)
	im1 <= SYNTHESIZED_WIRE_21;
end


always@(SYNTHESIZED_WIRE_29 or SYNTHESIZED_WIRE_27 or SYNTHESIZED_WIRE_30 or SYNTHESIZED_WIRE_25)
begin
if (~SYNTHESIZED_WIRE_29)
		im2 <= 1'b0;
else if (~SYNTHESIZED_WIRE_27)
		im2 <= 1'b1;
else if (SYNTHESIZED_WIRE_30)
	im2 <= SYNTHESIZED_WIRE_25;
end


assign	iff1 = iff_ALTERA_SYNTHESIZED1;
assign	in_nmi = in_nmi_ALTERA_SYNTHESIZED;
assign	in_intr = in_intr_ALTERA_SYNTHESIZED;

endmodule
