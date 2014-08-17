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
// CREATED		"Sun Aug 17 16:44:16 2014"

module reg_control(
	ctl_reg_exx,
	ctl_reg_use_ixiy,
	ctl_reg_use_ix,
	ctl_reg_ex_af,
	ctl_reg_ex_de_hl,
	ctl_reg_use_sp,
	nreset,
	ctl_reg_sel_pc,
	ctl_reg_sel_ir,
	ctl_reg_sel_wz,
	ctl_reg_gp_we,
	ctl_reg_sys_we,
	ctl_reg_gp_hilo,
	ctl_reg_gp_sel,
	ctl_reg_sys_hilo,
	reg_sel_bc,
	reg_sel_bc2,
	reg_sel_ix,
	reg_sel_iy,
	reg_sel_de,
	reg_sel_hl,
	reg_sel_de2,
	reg_sel_hl2,
	reg_sel_af,
	reg_sel_af2,
	reg_sel_wz,
	reg_sel_pc,
	reg_sel_ir,
	reg_sel_sp,
	reg_sel_gp_hi,
	reg_sel_gp_lo,
	reg_sel_sys_lo,
	reg_sel_sys_hi,
	reg_gp_we,
	reg_sys_we
);


input wire	ctl_reg_exx;
input wire	ctl_reg_use_ixiy;
input wire	ctl_reg_use_ix;
input wire	ctl_reg_ex_af;
input wire	ctl_reg_ex_de_hl;
input wire	ctl_reg_use_sp;
input wire	nreset;
input wire	ctl_reg_sel_pc;
input wire	ctl_reg_sel_ir;
input wire	ctl_reg_sel_wz;
input wire	ctl_reg_gp_we;
input wire	ctl_reg_sys_we;
input wire	[1:0] ctl_reg_gp_hilo;
input wire	[1:0] ctl_reg_gp_sel;
input wire	[1:0] ctl_reg_sys_hilo;
output wire	reg_sel_bc;
output wire	reg_sel_bc2;
output wire	reg_sel_ix;
output wire	reg_sel_iy;
output wire	reg_sel_de;
output wire	reg_sel_hl;
output wire	reg_sel_de2;
output wire	reg_sel_hl2;
output wire	reg_sel_af;
output wire	reg_sel_af2;
output wire	reg_sel_wz;
output wire	reg_sel_pc;
output wire	reg_sel_ir;
output wire	reg_sel_sp;
output wire	reg_sel_gp_hi;
output wire	reg_sel_gp_lo;
output wire	reg_sel_sys_lo;
output wire	reg_sel_sys_hi;
output wire	reg_gp_we;
output wire	reg_sys_we;

wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_10;
reg	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_63;
reg	SYNTHESIZED_WIRE_64;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_23;
reg	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
reg	SYNTHESIZED_WIRE_68;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_70;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_73;

assign	reg_sel_wz = ctl_reg_sel_wz;
assign	reg_sel_pc = ctl_reg_sel_pc;
assign	reg_sel_ir = ctl_reg_sel_ir;
assign	reg_sel_gp_hi = ctl_reg_gp_hilo[1];
assign	reg_sel_gp_lo = ctl_reg_gp_hilo[0];
assign	reg_sel_sys_lo = ctl_reg_sys_hilo[0];
assign	reg_sel_sys_hi = ctl_reg_sys_hilo[1];
assign	reg_gp_we = ctl_reg_gp_we;
assign	reg_sys_we = ctl_reg_sys_we;
assign	SYNTHESIZED_WIRE_70 = 1;
assign	SYNTHESIZED_WIRE_71 = 1;
assign	SYNTHESIZED_WIRE_72 = 1;
assign	SYNTHESIZED_WIRE_73 = 1;



assign	reg_sel_bc = SYNTHESIZED_WIRE_56 & SYNTHESIZED_WIRE_57;

assign	reg_sel_af = SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_58 = SYNTHESIZED_WIRE_59 & SYNTHESIZED_WIRE_5;

assign	reg_sel_sp = SYNTHESIZED_WIRE_59 & ctl_reg_use_sp;

assign	SYNTHESIZED_WIRE_5 =  ~ctl_reg_use_sp;

assign	reg_sel_ix = SYNTHESIZED_WIRE_60 & ctl_reg_use_ix;

assign	SYNTHESIZED_WIRE_38 = ctl_reg_ex_de_hl & SYNTHESIZED_WIRE_57;

assign	reg_sel_iy = SYNTHESIZED_WIRE_60 & SYNTHESIZED_WIRE_10;

assign	reg_sel_af2 = SYNTHESIZED_WIRE_61 & SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_2 =  ~SYNTHESIZED_WIRE_61;

assign	SYNTHESIZED_WIRE_48 = SYNTHESIZED_WIRE_62 & SYNTHESIZED_WIRE_63;

assign	SYNTHESIZED_WIRE_47 = SYNTHESIZED_WIRE_64 & SYNTHESIZED_WIRE_65;

assign	SYNTHESIZED_WIRE_43 = SYNTHESIZED_WIRE_66 & SYNTHESIZED_WIRE_63;

assign	SYNTHESIZED_WIRE_50 = SYNTHESIZED_WIRE_64 & SYNTHESIZED_WIRE_63;

assign	SYNTHESIZED_WIRE_49 = SYNTHESIZED_WIRE_62 & SYNTHESIZED_WIRE_65;

assign	reg_sel_de = SYNTHESIZED_WIRE_57 & SYNTHESIZED_WIRE_21;

assign	reg_sel_hl = SYNTHESIZED_WIRE_57 & SYNTHESIZED_WIRE_23;

assign	reg_sel_de2 = SYNTHESIZED_WIRE_67 & SYNTHESIZED_WIRE_24;

assign	reg_sel_hl2 = SYNTHESIZED_WIRE_67 & SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_42 = SYNTHESIZED_WIRE_68 & SYNTHESIZED_WIRE_65;

assign	SYNTHESIZED_WIRE_57 =  ~SYNTHESIZED_WIRE_67;

assign	SYNTHESIZED_WIRE_46 = SYNTHESIZED_WIRE_68 & SYNTHESIZED_WIRE_63;

assign	SYNTHESIZED_WIRE_45 = SYNTHESIZED_WIRE_66 & SYNTHESIZED_WIRE_65;

assign	SYNTHESIZED_WIRE_56 = SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_66 =  ~SYNTHESIZED_WIRE_68;

assign	SYNTHESIZED_WIRE_63 = SYNTHESIZED_WIRE_69 & SYNTHESIZED_WIRE_33;

assign	SYNTHESIZED_WIRE_35 =  ~ctl_reg_gp_sel[1];

assign	SYNTHESIZED_WIRE_60 = SYNTHESIZED_WIRE_69 & ctl_reg_use_ixiy;

assign	SYNTHESIZED_WIRE_44 =  ~ctl_reg_gp_sel[0];

assign	SYNTHESIZED_WIRE_41 = ctl_reg_ex_de_hl & SYNTHESIZED_WIRE_67;

assign	SYNTHESIZED_WIRE_33 =  ~ctl_reg_use_ixiy;

assign	SYNTHESIZED_WIRE_65 = ctl_reg_gp_sel[0] & SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_10 =  ~ctl_reg_use_ix;

assign	SYNTHESIZED_WIRE_62 =  ~SYNTHESIZED_WIRE_64;


always@(posedge SYNTHESIZED_WIRE_38 or negedge nreset or negedge SYNTHESIZED_WIRE_70)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_68 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_70)
	begin
	SYNTHESIZED_WIRE_68 <= 1;
	end
else
	SYNTHESIZED_WIRE_68 <= SYNTHESIZED_WIRE_68 ^ SYNTHESIZED_WIRE_70;
end


always@(posedge SYNTHESIZED_WIRE_41 or negedge nreset or negedge SYNTHESIZED_WIRE_71)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_64 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_71)
	begin
	SYNTHESIZED_WIRE_64 <= 1;
	end
else
	SYNTHESIZED_WIRE_64 <= SYNTHESIZED_WIRE_64 ^ SYNTHESIZED_WIRE_71;
end

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_42 | SYNTHESIZED_WIRE_43;

assign	SYNTHESIZED_WIRE_69 = SYNTHESIZED_WIRE_44 & ctl_reg_gp_sel[1];


assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_45 | SYNTHESIZED_WIRE_46;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_47 | SYNTHESIZED_WIRE_48;

assign	SYNTHESIZED_WIRE_24 = SYNTHESIZED_WIRE_49 | SYNTHESIZED_WIRE_50;




assign	SYNTHESIZED_WIRE_59 = ctl_reg_gp_sel[0] & ctl_reg_gp_sel[1];

assign	SYNTHESIZED_WIRE_30 =  ~ctl_reg_gp_sel[0];

assign	SYNTHESIZED_WIRE_31 =  ~ctl_reg_gp_sel[1];


always@(posedge ctl_reg_exx or negedge nreset or negedge SYNTHESIZED_WIRE_72)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_67 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_72)
	begin
	SYNTHESIZED_WIRE_67 <= 1;
	end
else
	SYNTHESIZED_WIRE_67 <= SYNTHESIZED_WIRE_67 ^ SYNTHESIZED_WIRE_72;
end

assign	reg_sel_bc2 = SYNTHESIZED_WIRE_56 & SYNTHESIZED_WIRE_67;


always@(posedge ctl_reg_ex_af or negedge nreset or negedge SYNTHESIZED_WIRE_73)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_61 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_73)
	begin
	SYNTHESIZED_WIRE_61 <= 1;
	end
else
	SYNTHESIZED_WIRE_61 <= SYNTHESIZED_WIRE_61 ^ SYNTHESIZED_WIRE_73;
end


endmodule
