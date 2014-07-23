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
// CREATED		"Tue Jul 22 20:11:04 2014"

module sequencer(
	clk,
	nextM,
	setM1,
	hold_clk,
	reset,
	T2_en,
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
input wire	T2_en;
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

reg	SYNTHESIZED_WIRE_64;
reg	SYNTHESIZED_WIRE_65;
reg	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
reg	DFFE_instM1;
reg	DFFE_instM2;
reg	DFFE_instM3;
reg	DFFE_instM4;
reg	DFFE_instM5;
wire	SYNTHESIZED_WIRE_68;
reg	DFFE_instT1;
reg	DFFE_instT3;
reg	DFFE_instT4;
reg	DFFE_instT5;
wire	SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_70;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_62;

assign	M1 = DFFE_instM1;
assign	M2 = DFFE_instM2;
assign	M3 = DFFE_instM3;
assign	M4 = DFFE_instM4;
assign	M5 = DFFE_instM5;
assign	T1 = DFFE_instT1;
assign	T3 = DFFE_instT3;
assign	T4 = DFFE_instT4;
assign	T5 = DFFE_instT5;
assign	SYNTHESIZED_WIRE_69 = 1;



assign	T2 = T2_en & SYNTHESIZED_WIRE_64;

assign	SYNTHESIZED_WIRE_67 =  ~SYNTHESIZED_WIRE_65;

assign	SYNTHESIZED_WIRE_70 =  ~reset;

assign	SYNTHESIZED_WIRE_62 =  ~clk;

assign	SYNTHESIZED_WIRE_71 =  ~SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_72 =  ~clk;

assign	SYNTHESIZED_WIRE_68 =  ~SYNTHESIZED_WIRE_66;

assign	SYNTHESIZED_WIRE_19 = SYNTHESIZED_WIRE_67 & DFFE_instM1;

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_67 & DFFE_instM2;

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_67 & DFFE_instM3;

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_67 & DFFE_instM4;

assign	SYNTHESIZED_WIRE_35 = SYNTHESIZED_WIRE_67 & DFFE_instM5;


assign	SYNTHESIZED_WIRE_43 = SYNTHESIZED_WIRE_68 & DFFE_instT1;

assign	SYNTHESIZED_WIRE_47 = SYNTHESIZED_WIRE_68 & SYNTHESIZED_WIRE_64;

assign	SYNTHESIZED_WIRE_51 = SYNTHESIZED_WIRE_68 & DFFE_instT3;

assign	SYNTHESIZED_WIRE_55 = SYNTHESIZED_WIRE_68 & DFFE_instT4;

assign	SYNTHESIZED_WIRE_59 = SYNTHESIZED_WIRE_68 & DFFE_instT5;


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	DFFE_instM1 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	DFFE_instM1 <= 1;
	end
else
if (SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM1 <= SYNTHESIZED_WIRE_65;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	DFFE_instM2 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	DFFE_instM2 <= 1;
	end
else
if (SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM2 <= SYNTHESIZED_WIRE_19;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	DFFE_instM3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	DFFE_instM3 <= 1;
	end
else
if (SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM3 <= SYNTHESIZED_WIRE_23;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	DFFE_instM4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	DFFE_instM4 <= 1;
	end
else
if (SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM4 <= SYNTHESIZED_WIRE_27;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	DFFE_instM5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	DFFE_instM5 <= 1;
	end
else
if (SYNTHESIZED_WIRE_66)
	begin
	DFFE_instM5 <= SYNTHESIZED_WIRE_31;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	M6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	M6 <= 1;
	end
else
if (SYNTHESIZED_WIRE_66)
	begin
	M6 <= SYNTHESIZED_WIRE_35;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	DFFE_instT1 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	DFFE_instT1 <= 1;
	end
else
if (SYNTHESIZED_WIRE_71)
	begin
	DFFE_instT1 <= SYNTHESIZED_WIRE_66;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	SYNTHESIZED_WIRE_64 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	SYNTHESIZED_WIRE_64 <= 1;
	end
else
if (SYNTHESIZED_WIRE_71)
	begin
	SYNTHESIZED_WIRE_64 <= SYNTHESIZED_WIRE_43;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	DFFE_instT3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	DFFE_instT3 <= 1;
	end
else
if (SYNTHESIZED_WIRE_71)
	begin
	DFFE_instT3 <= SYNTHESIZED_WIRE_47;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	DFFE_instT4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	DFFE_instT4 <= 1;
	end
else
if (SYNTHESIZED_WIRE_71)
	begin
	DFFE_instT4 <= SYNTHESIZED_WIRE_51;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	DFFE_instT5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	DFFE_instT5 <= 1;
	end
else
if (SYNTHESIZED_WIRE_71)
	begin
	DFFE_instT5 <= SYNTHESIZED_WIRE_55;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_70 or negedge SYNTHESIZED_WIRE_69)
begin
if (!SYNTHESIZED_WIRE_70)
	begin
	T6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_69)
	begin
	T6 <= 1;
	end
else
if (SYNTHESIZED_WIRE_71)
	begin
	T6 <= SYNTHESIZED_WIRE_59;
	end
end


always@(SYNTHESIZED_WIRE_72 or hold_clk)
begin
if (SYNTHESIZED_WIRE_72)
	SYNTHESIZED_WIRE_1 <= hold_clk;
end


always@(SYNTHESIZED_WIRE_62 or setM1)
begin
if (SYNTHESIZED_WIRE_62)
	SYNTHESIZED_WIRE_65 <= setM1;
end


always@(SYNTHESIZED_WIRE_72 or nextM)
begin
if (SYNTHESIZED_WIRE_72)
	SYNTHESIZED_WIRE_66 <= nextM;
end


endmodule
