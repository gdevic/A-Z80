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
// CREATED		"Wed Oct 29 08:47:02 2014"

module sequencer(
	clk,
	nextM,
	setM1,
	T2_en,
	hold_clk1,
	hold_clk2,
	nreset,
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
input wire	T2_en;
input wire	hold_clk1;
input wire	hold_clk2;
input wire	nreset;
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

reg	SYNTHESIZED_WIRE_53;
reg	SYNTHESIZED_WIRE_54;
reg	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_56;
reg	SYNTHESIZED_WIRE_57;
reg	DFFE_instM2;
reg	DFFE_instM3;
reg	DFFE_instM4;
reg	DFFE_instM5;
wire	SYNTHESIZED_WIRE_58;
reg	SYNTHESIZED_WIRE_59;
reg	DFFE_instT3;
reg	DFFE_instT4;
reg	DFFE_instT5;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_62;

assign	M2 = DFFE_instM2;
assign	M3 = DFFE_instM3;
assign	M4 = DFFE_instM4;
assign	M5 = DFFE_instM5;
assign	T3 = DFFE_instT3;
assign	T4 = DFFE_instT4;
assign	T5 = DFFE_instT5;
assign	SYNTHESIZED_WIRE_60 = 1;



assign	T2 = T2_en & SYNTHESIZED_WIRE_53;

assign	SYNTHESIZED_WIRE_56 =  ~SYNTHESIZED_WIRE_54;

assign	SYNTHESIZED_WIRE_62 =  ~clk;

assign	SYNTHESIZED_WIRE_61 =  ~SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_58 =  ~SYNTHESIZED_WIRE_55;

assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_56 & SYNTHESIZED_WIRE_57;

assign	M1 = SYNTHESIZED_WIRE_57 & nreset;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_56 & DFFE_instM2;

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_56 & DFFE_instM3;

assign	SYNTHESIZED_WIRE_26 = SYNTHESIZED_WIRE_56 & DFFE_instM4;

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_56 & DFFE_instM5;


assign	SYNTHESIZED_WIRE_35 = SYNTHESIZED_WIRE_58 & SYNTHESIZED_WIRE_59;

assign	T1 = nreset & SYNTHESIZED_WIRE_59;

assign	SYNTHESIZED_WIRE_38 = SYNTHESIZED_WIRE_58 & SYNTHESIZED_WIRE_53;

assign	SYNTHESIZED_WIRE_41 = SYNTHESIZED_WIRE_58 & DFFE_instT3;

assign	SYNTHESIZED_WIRE_44 = SYNTHESIZED_WIRE_58 & DFFE_instT4;

assign	SYNTHESIZED_WIRE_47 = SYNTHESIZED_WIRE_58 & DFFE_instT5;

assign	SYNTHESIZED_WIRE_49 = hold_clk2 | hold_clk1;


always@(posedge clk or negedge SYNTHESIZED_WIRE_60 or negedge nreset)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	SYNTHESIZED_WIRE_57 <= 0;
	end
else
if (!nreset)
	begin
	SYNTHESIZED_WIRE_57 <= 1;
	end
else
if (SYNTHESIZED_WIRE_55)
	begin
	SYNTHESIZED_WIRE_57 <= SYNTHESIZED_WIRE_54;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	DFFE_instM2 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	DFFE_instM2 <= 1;
	end
else
if (SYNTHESIZED_WIRE_55)
	begin
	DFFE_instM2 <= SYNTHESIZED_WIRE_17;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	DFFE_instM3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	DFFE_instM3 <= 1;
	end
else
if (SYNTHESIZED_WIRE_55)
	begin
	DFFE_instM3 <= SYNTHESIZED_WIRE_20;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	DFFE_instM4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	DFFE_instM4 <= 1;
	end
else
if (SYNTHESIZED_WIRE_55)
	begin
	DFFE_instM4 <= SYNTHESIZED_WIRE_23;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	DFFE_instM5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	DFFE_instM5 <= 1;
	end
else
if (SYNTHESIZED_WIRE_55)
	begin
	DFFE_instM5 <= SYNTHESIZED_WIRE_26;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	M6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	M6 <= 1;
	end
else
if (SYNTHESIZED_WIRE_55)
	begin
	M6 <= SYNTHESIZED_WIRE_29;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_60 or negedge nreset)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	SYNTHESIZED_WIRE_59 <= 0;
	end
else
if (!nreset)
	begin
	SYNTHESIZED_WIRE_59 <= 1;
	end
else
if (SYNTHESIZED_WIRE_61)
	begin
	SYNTHESIZED_WIRE_59 <= SYNTHESIZED_WIRE_55;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_53 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	SYNTHESIZED_WIRE_53 <= 1;
	end
else
if (SYNTHESIZED_WIRE_61)
	begin
	SYNTHESIZED_WIRE_53 <= SYNTHESIZED_WIRE_35;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	DFFE_instT3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	DFFE_instT3 <= 1;
	end
else
if (SYNTHESIZED_WIRE_61)
	begin
	DFFE_instT3 <= SYNTHESIZED_WIRE_38;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	DFFE_instT4 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	DFFE_instT4 <= 1;
	end
else
if (SYNTHESIZED_WIRE_61)
	begin
	DFFE_instT4 <= SYNTHESIZED_WIRE_41;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	DFFE_instT5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	DFFE_instT5 <= 1;
	end
else
if (SYNTHESIZED_WIRE_61)
	begin
	DFFE_instT5 <= SYNTHESIZED_WIRE_44;
	end
end


always@(posedge clk or negedge nreset or negedge SYNTHESIZED_WIRE_60)
begin
if (!nreset)
	begin
	T6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_60)
	begin
	T6 <= 1;
	end
else
if (SYNTHESIZED_WIRE_61)
	begin
	T6 <= SYNTHESIZED_WIRE_47;
	end
end


always@(SYNTHESIZED_WIRE_62 or SYNTHESIZED_WIRE_49)
begin
if (SYNTHESIZED_WIRE_62)
	SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_49;
end


always@(SYNTHESIZED_WIRE_62 or setM1)
begin
if (SYNTHESIZED_WIRE_62)
	SYNTHESIZED_WIRE_54 <= setM1;
end


always@(SYNTHESIZED_WIRE_62 or nextM)
begin
if (SYNTHESIZED_WIRE_62)
	SYNTHESIZED_WIRE_55 <= nextM;
end


endmodule
