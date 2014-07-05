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
// CREATED		"Sat Jul 05 10:06:41 2014"

module sequencer(
	clk,
	nextM,
	setM1,
	hold_clk,
	reset,
	M1,
	M2,
	M3,
	M4,
	M5,
	M6,
	T1,
	T2,
	T3,
	T4,
	T5,
	T6
);


input wire	clk;
input wire	nextM;
input wire	setM1;
input wire	hold_clk;
input wire	reset;
output wire	M1;
output wire	M2;
output wire	M3;
output wire	M4;
output wire	M5;
output reg	M6;
output wire	T1;
output wire	T2;
output wire	T3;
output wire	T4;
output wire	T5;
output reg	T6;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
reg	DFFE_instM1;
reg	DFFE_instM2;
reg	DFFE_instM3;
reg	DFFE_instM4;
reg	DFFE_instM5;
wire	SYNTHESIZED_WIRE_65;
reg	DFFE_instT1;
reg	DFFE_instT2;
reg	DFFE_instT3;
reg	DFFE_instT4;
reg	DFFE_instT5;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_68;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_60;

assign	M1 = DFFE_instM1;
assign	M2 = DFFE_instM2;
assign	M3 = DFFE_instM3;
assign	M4 = DFFE_instM4;
assign	M5 = DFFE_instM5;
assign	T1 = DFFE_instT1;
assign	T2 = DFFE_instT2;
assign	T3 = DFFE_instT3;
assign	T4 = DFFE_instT4;
assign	T5 = DFFE_instT5;
assign	SYNTHESIZED_WIRE_67 = 1;



assign	SYNTHESIZED_WIRE_63 =  ~SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_64 =  ~SYNTHESIZED_WIRE_62;

assign	SYNTHESIZED_WIRE_66 =  ~reset;

assign	SYNTHESIZED_WIRE_0 =  ~nextM;

assign	SYNTHESIZED_WIRE_68 =  ~hold_clk;

assign	SYNTHESIZED_WIRE_62 =  ~SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_2 =  ~setM1;

assign	SYNTHESIZED_WIRE_65 =  ~SYNTHESIZED_WIRE_63;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_64 & DFFE_instM1;

assign	SYNTHESIZED_WIRE_24 = SYNTHESIZED_WIRE_64 & DFFE_instM2;

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_64 & DFFE_instM3;

assign	SYNTHESIZED_WIRE_32 = SYNTHESIZED_WIRE_64 & DFFE_instM4;

assign	SYNTHESIZED_WIRE_36 = SYNTHESIZED_WIRE_64 & DFFE_instM5;


assign	SYNTHESIZED_WIRE_44 = SYNTHESIZED_WIRE_65 & DFFE_instT1;

assign	SYNTHESIZED_WIRE_48 = SYNTHESIZED_WIRE_65 & DFFE_instT2;

assign	SYNTHESIZED_WIRE_52 = SYNTHESIZED_WIRE_65 & DFFE_instT3;

assign	SYNTHESIZED_WIRE_56 = SYNTHESIZED_WIRE_65 & DFFE_instT4;

assign	SYNTHESIZED_WIRE_60 = SYNTHESIZED_WIRE_65 & DFFE_instT5;


always@(posedge clk or negedge SYNTHESIZED_WIRE_67 or negedge SYNTHESIZED_WIRE_66)
begin
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instM1 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM1 <= 1;
	end
else
if (SYNTHESIZED_WIRE_63)
	begin
	DFFE_instM1 <= SYNTHESIZED_WIRE_62;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM2 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instM2 <= 1;
	end
else
if (SYNTHESIZED_WIRE_63)
	begin
	DFFE_instM2 <= SYNTHESIZED_WIRE_20;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instM3 <= 1;
	end
else
if (SYNTHESIZED_WIRE_63)
	begin
	DFFE_instM3 <= SYNTHESIZED_WIRE_24;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instM4 <= 1;
	end
else
if (SYNTHESIZED_WIRE_63)
	begin
	DFFE_instM4 <= SYNTHESIZED_WIRE_28;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instM5 <= 1;
	end
else
if (SYNTHESIZED_WIRE_63)
	begin
	DFFE_instM5 <= SYNTHESIZED_WIRE_32;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	M6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	M6 <= 1;
	end
else
if (SYNTHESIZED_WIRE_63)
	begin
	M6 <= SYNTHESIZED_WIRE_36;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_67 or negedge SYNTHESIZED_WIRE_66)
begin
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instT1 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instT1 <= 1;
	end
else
if (SYNTHESIZED_WIRE_68)
	begin
	DFFE_instT1 <= SYNTHESIZED_WIRE_63;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instT2 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instT2 <= 1;
	end
else
if (SYNTHESIZED_WIRE_68)
	begin
	DFFE_instT2 <= SYNTHESIZED_WIRE_44;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instT3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instT3 <= 1;
	end
else
if (SYNTHESIZED_WIRE_68)
	begin
	DFFE_instT3 <= SYNTHESIZED_WIRE_48;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instT4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instT4 <= 1;
	end
else
if (SYNTHESIZED_WIRE_68)
	begin
	DFFE_instT4 <= SYNTHESIZED_WIRE_52;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	DFFE_instT5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	DFFE_instT5 <= 1;
	end
else
if (SYNTHESIZED_WIRE_68)
	begin
	DFFE_instT5 <= SYNTHESIZED_WIRE_56;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_66 or negedge SYNTHESIZED_WIRE_67)
begin
if (!SYNTHESIZED_WIRE_66)
	begin
	T6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_67)
	begin
	T6 <= 1;
	end
else
if (SYNTHESIZED_WIRE_68)
	begin
	T6 <= SYNTHESIZED_WIRE_60;
	end
end


endmodule
