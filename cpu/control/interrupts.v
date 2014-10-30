// Copyright (C) 1991-2013 Altera Corporation
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
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
// CREATED		"Wed Oct 29 05:59:56 2014"

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
	nreset,
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
input wire	nreset;
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
wire	test1;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
reg	DFFE_inst44;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_9;
reg	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;

assign	iff2 = SYNTHESIZED_WIRE_10;
assign	SYNTHESIZED_WIRE_4 = 1;



assign	SYNTHESIZED_WIRE_11 = ctl_iffx_we | ctl_iff1_iff2;

assign	SYNTHESIZED_WIRE_0 =  ~db[0];

assign	SYNTHESIZED_WIRE_5 = ~(in_intr_ALTERA_SYNTHESIZED | reset);

assign	SYNTHESIZED_WIRE_1 =  ~in_nmi_ALTERA_SYNTHESIZED;

assign	SYNTHESIZED_WIRE_14 = db[1] & db[0];

assign	SYNTHESIZED_WIRE_13 = db[1] & SYNTHESIZED_WIRE_0;


assign	in_intr_ALTERA_SYNTHESIZED = SYNTHESIZED_WIRE_1 & DFFE_inst44;

assign	SYNTHESIZED_WIRE_6 = iff_ALTERA_SYNTHESIZED1 & intr;

assign	test1 = setM1 & SYNTHESIZED_WIRE_2;


always@(posedge nmi or negedge SYNTHESIZED_WIRE_3)
begin
if (!SYNTHESIZED_WIRE_3)
	begin
	nmi_armed <= 0;
	end
else
	begin
	nmi_armed <= SYNTHESIZED_WIRE_4;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	in_nmi_ALTERA_SYNTHESIZED <= 0;
	end
else
if (test1)
	begin
	in_nmi_ALTERA_SYNTHESIZED <= nmi_armed;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_inst44 <= 0;
	end
else
if (test1)
	begin
	DFFE_inst44 <= int_armed;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_5)
begin
if (!SYNTHESIZED_WIRE_5)
	begin
	int_armed <= 0;
	end
else
	begin
	int_armed <= SYNTHESIZED_WIRE_6;
	end
end

assign	SYNTHESIZED_WIRE_15 = ~(reset | in_intr_ALTERA_SYNTHESIZED);

assign	SYNTHESIZED_WIRE_9 = ~(in_nmi_ALTERA_SYNTHESIZED | SYNTHESIZED_WIRE_7);

assign	SYNTHESIZED_WIRE_2 =  ~ctl_no_ints;

assign	SYNTHESIZED_WIRE_7 =  ~SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_3 = ~(in_nmi_ALTERA_SYNTHESIZED | reset);


always@(SYNTHESIZED_WIRE_9 or SYNTHESIZED_WIRE_11 or SYNTHESIZED_WIRE_10)
begin
if (~SYNTHESIZED_WIRE_9)
		iff_ALTERA_SYNTHESIZED1 <= 1'b0;
else if (SYNTHESIZED_WIRE_11)
	iff_ALTERA_SYNTHESIZED1 <= SYNTHESIZED_WIRE_10;
end


always@(SYNTHESIZED_WIRE_15 or ctl_iffx_we or ctl_iffx_bit)
begin
if (~SYNTHESIZED_WIRE_15)
		SYNTHESIZED_WIRE_10 <= 1'b0;
else if (ctl_iffx_we)
	SYNTHESIZED_WIRE_10 <= ctl_iffx_bit;
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	im1 <= 0;
	end
else
if (ctl_im_we)
	begin
	im1 <= SYNTHESIZED_WIRE_13;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	im2 <= 0;
	end
else
if (ctl_im_we)
	begin
	im2 <= SYNTHESIZED_WIRE_14;
	end
end

assign	iff1 = iff_ALTERA_SYNTHESIZED1;
assign	in_nmi = in_nmi_ALTERA_SYNTHESIZED;
assign	in_intr = in_intr_ALTERA_SYNTHESIZED;

endmodule
