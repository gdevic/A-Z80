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
// CREATED		"Tue Aug 19 09:36:23 2014"

module sequencer(
	clk,
	nextM,
	setM1,
	reset,
	T2_en,
	hold_clk1,
	hold_clk2,
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
input wire	reset;
input wire	T2_en;
input wire	hold_clk1;
input wire	hold_clk2;
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

reg	SYNTHESIZED_WIRE_67;
reg	SYNTHESIZED_WIRE_68;
reg	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_70;
reg	SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_72;
reg	DFFE_instM2;
reg	DFFE_instM3;
reg	DFFE_instM4;
reg	DFFE_instM5;
wire	SYNTHESIZED_WIRE_73;
reg	SYNTHESIZED_WIRE_74;
reg	DFFE_instT3;
reg	DFFE_instT4;
reg	DFFE_instT5;
wire	SYNTHESIZED_WIRE_75;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_76;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_77;

assign	M2 = DFFE_instM2;
assign	M3 = DFFE_instM3;
assign	M4 = DFFE_instM4;
assign	M5 = DFFE_instM5;
assign	T3 = DFFE_instT3;
assign	T4 = DFFE_instT4;
assign	T5 = DFFE_instT5;
assign	SYNTHESIZED_WIRE_75 = 1;



assign	T2 = T2_en & SYNTHESIZED_WIRE_67;

assign	SYNTHESIZED_WIRE_70 =  ~SYNTHESIZED_WIRE_68;

assign	SYNTHESIZED_WIRE_72 =  ~reset;

assign	SYNTHESIZED_WIRE_77 =  ~clk;

assign	SYNTHESIZED_WIRE_76 =  ~SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_73 =  ~SYNTHESIZED_WIRE_69;

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_70 & SYNTHESIZED_WIRE_71;

assign	M1 = SYNTHESIZED_WIRE_71 & SYNTHESIZED_WIRE_72;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_70 & DFFE_instM2;

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_70 & DFFE_instM3;

assign	SYNTHESIZED_WIRE_33 = SYNTHESIZED_WIRE_70 & DFFE_instM4;

assign	SYNTHESIZED_WIRE_37 = SYNTHESIZED_WIRE_70 & DFFE_instM5;


assign	SYNTHESIZED_WIRE_45 = SYNTHESIZED_WIRE_73 & SYNTHESIZED_WIRE_74;

assign	T1 = SYNTHESIZED_WIRE_72 & SYNTHESIZED_WIRE_74;

assign	SYNTHESIZED_WIRE_49 = SYNTHESIZED_WIRE_73 & SYNTHESIZED_WIRE_67;

assign	SYNTHESIZED_WIRE_53 = SYNTHESIZED_WIRE_73 & DFFE_instT3;

assign	SYNTHESIZED_WIRE_57 = SYNTHESIZED_WIRE_73 & DFFE_instT4;

assign	SYNTHESIZED_WIRE_61 = SYNTHESIZED_WIRE_73 & DFFE_instT5;

assign	SYNTHESIZED_WIRE_63 = hold_clk2 | hold_clk1;


always@(posedge clk or negedge SYNTHESIZED_WIRE_75 or negedge SYNTHESIZED_WIRE_72)
begin
if (!SYNTHESIZED_WIRE_75)
	begin
	SYNTHESIZED_WIRE_71 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_72)
	begin
	SYNTHESIZED_WIRE_71 <= 1;
	end
else
if (SYNTHESIZED_WIRE_69)
	begin
	SYNTHESIZED_WIRE_71 <= SYNTHESIZED_WIRE_68;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	DFFE_instM2 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	DFFE_instM2 <= 1;
	end
else
if (SYNTHESIZED_WIRE_69)
	begin
	DFFE_instM2 <= SYNTHESIZED_WIRE_21;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	DFFE_instM3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	DFFE_instM3 <= 1;
	end
else
if (SYNTHESIZED_WIRE_69)
	begin
	DFFE_instM3 <= SYNTHESIZED_WIRE_25;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	DFFE_instM4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	DFFE_instM4 <= 1;
	end
else
if (SYNTHESIZED_WIRE_69)
	begin
	DFFE_instM4 <= SYNTHESIZED_WIRE_29;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	DFFE_instM5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	DFFE_instM5 <= 1;
	end
else
if (SYNTHESIZED_WIRE_69)
	begin
	DFFE_instM5 <= SYNTHESIZED_WIRE_33;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	M6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	M6 <= 1;
	end
else
if (SYNTHESIZED_WIRE_69)
	begin
	M6 <= SYNTHESIZED_WIRE_37;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_75 or negedge SYNTHESIZED_WIRE_72)
begin
if (!SYNTHESIZED_WIRE_75)
	begin
	SYNTHESIZED_WIRE_74 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_72)
	begin
	SYNTHESIZED_WIRE_74 <= 1;
	end
else
if (SYNTHESIZED_WIRE_76)
	begin
	SYNTHESIZED_WIRE_74 <= SYNTHESIZED_WIRE_69;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	SYNTHESIZED_WIRE_67 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	SYNTHESIZED_WIRE_67 <= 1;
	end
else
if (SYNTHESIZED_WIRE_76)
	begin
	SYNTHESIZED_WIRE_67 <= SYNTHESIZED_WIRE_45;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	DFFE_instT3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	DFFE_instT3 <= 1;
	end
else
if (SYNTHESIZED_WIRE_76)
	begin
	DFFE_instT3 <= SYNTHESIZED_WIRE_49;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	DFFE_instT4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	DFFE_instT4 <= 1;
	end
else
if (SYNTHESIZED_WIRE_76)
	begin
	DFFE_instT4 <= SYNTHESIZED_WIRE_53;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	DFFE_instT5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	DFFE_instT5 <= 1;
	end
else
if (SYNTHESIZED_WIRE_76)
	begin
	DFFE_instT5 <= SYNTHESIZED_WIRE_57;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_72 or negedge SYNTHESIZED_WIRE_75)
begin
if (!SYNTHESIZED_WIRE_72)
	begin
	T6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_75)
	begin
	T6 <= 1;
	end
else
if (SYNTHESIZED_WIRE_76)
	begin
	T6 <= SYNTHESIZED_WIRE_61;
	end
end


always@(SYNTHESIZED_WIRE_77 or SYNTHESIZED_WIRE_63)
begin
if (SYNTHESIZED_WIRE_77)
	SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_63;
end


always@(SYNTHESIZED_WIRE_77 or setM1)
begin
if (SYNTHESIZED_WIRE_77)
	SYNTHESIZED_WIRE_68 <= setM1;
end


always@(SYNTHESIZED_WIRE_77 or nextM)
begin
if (SYNTHESIZED_WIRE_77)
	SYNTHESIZED_WIRE_69 <= nextM;
end


endmodule
