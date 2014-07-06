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
// CREATED		"Sun Jul 06 08:42:53 2014"

module reg_control(
	ctl_reg_exx,
	ctl_reg_use_ixiy,
	ctl_reg_use_ix,
	ctl_reg_ex_af,
	ctl_reg_ex_de_hl,
	ctl_reg_use_sp,
	ctl_reg_sel_wz,
	ctl_reg_sel_pc,
	ctl_reg_sel_ir,
	ctl_reg_sel_gp_16,
	ctl_reg_sel_sys_hi,
	ctl_reg_sel_sys_lo,
	ctl_reg_sys_oe,
	ctl_reg_sel_gp,
	reset,
	ctl_reg_gp_oe,
	reg_sel,
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
	reg_sel_sys_hi,
	reg_sel_sys_lo,
	reg_sys_oe,
	reg_gp_oe
);


input wire	ctl_reg_exx;
input wire	ctl_reg_use_ixiy;
input wire	ctl_reg_use_ix;
input wire	ctl_reg_ex_af;
input wire	ctl_reg_ex_de_hl;
input wire	ctl_reg_use_sp;
input wire	ctl_reg_sel_wz;
input wire	ctl_reg_sel_pc;
input wire	ctl_reg_sel_ir;
input wire	ctl_reg_sel_gp_16;
input wire	ctl_reg_sel_sys_hi;
input wire	ctl_reg_sel_sys_lo;
input wire	ctl_reg_sys_oe;
input wire	ctl_reg_sel_gp;
input wire	reset;
input wire	ctl_reg_gp_oe;
input wire	[2:0] reg_sel;
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
output wire	reg_sel_sys_hi;
output wire	reg_sel_sys_lo;
output wire	reg_sys_oe;
output wire	reg_gp_oe;

wire	int_nreset;
reg	sel_exx;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_10;
reg	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_56;
reg	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
reg	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;

assign	reg_sel_wz = ctl_reg_sel_wz;
assign	reg_sel_pc = ctl_reg_sel_pc;
assign	reg_sel_ir = ctl_reg_sel_ir;
assign	reg_sel_sys_hi = ctl_reg_sel_sys_hi;
assign	reg_sel_sys_lo = ctl_reg_sel_sys_lo;
assign	reg_sys_oe = ctl_reg_sys_oe;
assign	reg_gp_oe = ctl_reg_gp_oe;



assign	reg_sel_bc = SYNTHESIZED_WIRE_49 & SYNTHESIZED_WIRE_50;

assign	reg_sel_af = SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_51 = SYNTHESIZED_WIRE_52 & SYNTHESIZED_WIRE_5;

assign	reg_sel_sp = SYNTHESIZED_WIRE_52 & ctl_reg_use_sp;

assign	SYNTHESIZED_WIRE_5 =  ~ctl_reg_use_sp;

assign	reg_sel_ix = SYNTHESIZED_WIRE_53 & ctl_reg_use_ix;

assign	SYNTHESIZED_WIRE_37 = ctl_reg_ex_de_hl & SYNTHESIZED_WIRE_8;

assign	reg_sel_iy = SYNTHESIZED_WIRE_53 & SYNTHESIZED_WIRE_10;

assign	reg_sel_af2 = SYNTHESIZED_WIRE_54 & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_2 =  ~SYNTHESIZED_WIRE_54;

assign	SYNTHESIZED_WIRE_44 = SYNTHESIZED_WIRE_55 & SYNTHESIZED_WIRE_56;

assign	SYNTHESIZED_WIRE_43 = SYNTHESIZED_WIRE_57 & SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_40 = SYNTHESIZED_WIRE_59 & SYNTHESIZED_WIRE_56;

assign	SYNTHESIZED_WIRE_46 = SYNTHESIZED_WIRE_57 & SYNTHESIZED_WIRE_56;

assign	SYNTHESIZED_WIRE_45 = SYNTHESIZED_WIRE_55 & SYNTHESIZED_WIRE_58;

assign	reg_sel_de = SYNTHESIZED_WIRE_50 & SYNTHESIZED_WIRE_21;

assign	reg_sel_hl = SYNTHESIZED_WIRE_50 & SYNTHESIZED_WIRE_23;

assign	reg_sel_de2 = sel_exx & SYNTHESIZED_WIRE_24;

assign	reg_sel_hl2 = sel_exx & SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_39 = SYNTHESIZED_WIRE_60 & SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_8 =  ~sel_exx;

assign	SYNTHESIZED_WIRE_42 = SYNTHESIZED_WIRE_60 & SYNTHESIZED_WIRE_56;

assign	SYNTHESIZED_WIRE_41 = SYNTHESIZED_WIRE_59 & SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_49 = SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_31 & ctl_reg_sel_gp;

assign	SYNTHESIZED_WIRE_59 =  ~SYNTHESIZED_WIRE_60;

assign	SYNTHESIZED_WIRE_50 =  ~sel_exx;

assign	SYNTHESIZED_WIRE_56 = SYNTHESIZED_WIRE_61 & SYNTHESIZED_WIRE_33;

assign	SYNTHESIZED_WIRE_58 = reg_sel[1] & ctl_reg_sel_gp & SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_34 =  ~reg_sel[2];

assign	SYNTHESIZED_WIRE_61 = SYNTHESIZED_WIRE_35 & ctl_reg_sel_gp & reg_sel[2];

assign	SYNTHESIZED_WIRE_53 = SYNTHESIZED_WIRE_61 & ctl_reg_use_ixiy;

assign	SYNTHESIZED_WIRE_35 =  ~reg_sel[1];

assign	SYNTHESIZED_WIRE_38 = ctl_reg_ex_de_hl & sel_exx;

assign	SYNTHESIZED_WIRE_33 =  ~ctl_reg_use_ixiy;

assign	SYNTHESIZED_WIRE_52 = ctl_reg_sel_gp & reg_sel[1] & reg_sel[2];

assign	SYNTHESIZED_WIRE_10 =  ~ctl_reg_use_ix;

assign	SYNTHESIZED_WIRE_55 =  ~SYNTHESIZED_WIRE_57;


always@(posedge SYNTHESIZED_WIRE_37 or negedge int_nreset or negedge int_nreset)
begin
if (!int_nreset)
	begin
	SYNTHESIZED_WIRE_60 <= 0;
	end
else
if (!int_nreset)
	begin
	SYNTHESIZED_WIRE_60 <= 1;
	end
else
	SYNTHESIZED_WIRE_60 <= SYNTHESIZED_WIRE_60 ^ int_nreset;
end

assign	SYNTHESIZED_WIRE_47 =  ~reg_sel[0];


always@(posedge SYNTHESIZED_WIRE_38 or negedge int_nreset or negedge int_nreset)
begin
if (!int_nreset)
	begin
	SYNTHESIZED_WIRE_57 <= 0;
	end
else
if (!int_nreset)
	begin
	SYNTHESIZED_WIRE_57 <= 1;
	end
else
	SYNTHESIZED_WIRE_57 <= SYNTHESIZED_WIRE_57 ^ int_nreset;
end

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_40;

assign	reg_sel_gp_lo = reg_sel[0] | ctl_reg_sel_gp_16;

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_41 | SYNTHESIZED_WIRE_42;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_43 | SYNTHESIZED_WIRE_44;

assign	SYNTHESIZED_WIRE_24 = SYNTHESIZED_WIRE_45 | SYNTHESIZED_WIRE_46;

assign	reg_sel_gp_hi = SYNTHESIZED_WIRE_47 | ctl_reg_sel_gp_16;

assign	SYNTHESIZED_WIRE_30 =  ~reg_sel[1];

assign	SYNTHESIZED_WIRE_31 =  ~reg_sel[2];


always@(posedge ctl_reg_exx or negedge int_nreset or negedge int_nreset)
begin
if (!int_nreset)
	begin
	sel_exx <= 0;
	end
else
if (!int_nreset)
	begin
	sel_exx <= 1;
	end
else
	sel_exx <= sel_exx ^ int_nreset;
end

assign	reg_sel_bc2 = SYNTHESIZED_WIRE_49 & sel_exx;


always@(posedge ctl_reg_ex_af or negedge int_nreset or negedge int_nreset)
begin
if (!int_nreset)
	begin
	SYNTHESIZED_WIRE_54 <= 0;
	end
else
if (!int_nreset)
	begin
	SYNTHESIZED_WIRE_54 <= 1;
	end
else
	SYNTHESIZED_WIRE_54 <= SYNTHESIZED_WIRE_54 ^ int_nreset;
end

assign	int_nreset =  ~reset;


endmodule
