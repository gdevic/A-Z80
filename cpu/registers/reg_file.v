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
// CREATED		"Fri May 16 08:20:36 2014"

module reg_file(
	reg_sel_pc,
	reg_sel_ir,
	reg_sel_sys_lo,
	reg_sel_sp,
	reg_sel_wz,
	reg_sel_iy,
	reg_sel_ix,
	reg_sel_hl2,
	reg_sel_hl,
	reg_sel_de2,
	reg_sel_de,
	reg_sel_bc2,
	reg_sel_bc,
	reg_sel_af2,
	reg_sel_af,
	reg_sel_gp_hi,
	reg_sel_gp_lo,
	reg_sys_oe,
	reg_gp_oe,
	ctl_sw_4d,
	ctl_sw_4u,
	reg_sel_sys_hi,
	db_hi_as,
	db_hi_ds,
	db_lo_as,
	db_lo_ds
);


input wire	reg_sel_pc;
input wire	reg_sel_ir;
input wire	reg_sel_sys_lo;
input wire	reg_sel_sp;
input wire	reg_sel_wz;
input wire	reg_sel_iy;
input wire	reg_sel_ix;
input wire	reg_sel_hl2;
input wire	reg_sel_hl;
input wire	reg_sel_de2;
input wire	reg_sel_de;
input wire	reg_sel_bc2;
input wire	reg_sel_bc;
input wire	reg_sel_af2;
input wire	reg_sel_af;
input wire	reg_sel_gp_hi;
input wire	reg_sel_gp_lo;
input wire	reg_sys_oe;
input wire	reg_gp_oe;
input wire	ctl_sw_4d;
input wire	ctl_sw_4u;
input wire	reg_sel_sys_hi;
inout wire	[7:0] db_hi_as;
inout wire	[7:0] db_hi_ds;
inout wire	[7:0] db_lo_as;
inout wire	[7:0] db_lo_ds;

wire	SYNTHESIZED_WIRE_84;
wire	SYNTHESIZED_WIRE_85;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
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
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_68;
wire	SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_70;
wire	SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_73;
wire	SYNTHESIZED_WIRE_74;
wire	SYNTHESIZED_WIRE_75;
wire	SYNTHESIZED_WIRE_76;
wire	SYNTHESIZED_WIRE_77;
wire	SYNTHESIZED_WIRE_78;
wire	SYNTHESIZED_WIRE_79;
wire	SYNTHESIZED_WIRE_80;
wire	SYNTHESIZED_WIRE_81;
wire	SYNTHESIZED_WIRE_82;
wire	SYNTHESIZED_WIRE_83;




assign	SYNTHESIZED_WIRE_78 = reg_sys_oe & reg_sel_sys_lo & reg_sel_wz;

assign	SYNTHESIZED_WIRE_76 = reg_sel_wz & reg_sel_sys_hi & reg_sys_oe;

assign	SYNTHESIZED_WIRE_82 = reg_gp_oe & reg_sel_gp_lo & reg_sel_sp;

assign	SYNTHESIZED_WIRE_80 = reg_sel_sp & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_85 =  ~reg_sys_oe;

assign	SYNTHESIZED_WIRE_71 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_iy;

assign	SYNTHESIZED_WIRE_74 = reg_sys_oe & reg_sel_sys_lo & reg_sel_pc;

assign	SYNTHESIZED_WIRE_67 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_ix;

assign	SYNTHESIZED_WIRE_55 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_hl2;

assign	SYNTHESIZED_WIRE_72 = reg_sel_pc & reg_sel_sys_hi & reg_sys_oe;

assign	SYNTHESIZED_WIRE_59 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_hl;

assign	SYNTHESIZED_WIRE_47 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_de2;

assign	SYNTHESIZED_WIRE_51 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_de;

assign	SYNTHESIZED_WIRE_77 = reg_sel_wz & SYNTHESIZED_WIRE_85 & reg_sel_sys_hi;

assign	SYNTHESIZED_WIRE_84 =  ~reg_gp_oe;

assign	SYNTHESIZED_WIRE_70 = reg_gp_oe & reg_sel_gp_lo & reg_sel_iy;

assign	SYNTHESIZED_WIRE_68 = reg_sel_iy & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_39 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_bc2;

assign	SYNTHESIZED_WIRE_43 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_bc;

assign	SYNTHESIZED_WIRE_31 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_af2;

assign	SYNTHESIZED_WIRE_81 = reg_sel_sp & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_66 = reg_gp_oe & reg_sel_gp_lo & reg_sel_ix;

assign	SYNTHESIZED_WIRE_64 = reg_sel_ix & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_35 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_af;

assign	SYNTHESIZED_WIRE_69 = reg_sel_iy & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_63 = reg_sel_sys_lo & SYNTHESIZED_WIRE_85 & reg_sel_ir;

assign	SYNTHESIZED_WIRE_65 = reg_sel_ix & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_53 = reg_sel_hl2 & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_54 = reg_gp_oe & reg_sel_gp_lo & reg_sel_hl2;

assign	SYNTHESIZED_WIRE_52 = reg_sel_hl2 & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_57 = reg_sel_hl & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_45 = reg_sel_de2 & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_49 = reg_sel_de & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_37 = reg_sel_bc2 & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_58 = reg_gp_oe & reg_sel_gp_lo & reg_sel_hl;

assign	SYNTHESIZED_WIRE_56 = reg_sel_hl & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_75 = reg_sel_sys_lo & SYNTHESIZED_WIRE_85 & reg_sel_pc;

assign	SYNTHESIZED_WIRE_41 = reg_sel_bc & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_29 = reg_sel_af2 & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_33 = reg_sel_af & SYNTHESIZED_WIRE_84 & reg_sel_gp_hi;

assign	SYNTHESIZED_WIRE_61 = reg_sel_ir & SYNTHESIZED_WIRE_85 & reg_sel_sys_hi;

assign	SYNTHESIZED_WIRE_46 = reg_gp_oe & reg_sel_gp_lo & reg_sel_de2;

assign	SYNTHESIZED_WIRE_44 = reg_sel_de2 & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_73 = reg_sel_pc & SYNTHESIZED_WIRE_85 & reg_sel_sys_hi;

assign	SYNTHESIZED_WIRE_79 = reg_sel_sys_lo & SYNTHESIZED_WIRE_85 & reg_sel_wz;

assign	SYNTHESIZED_WIRE_50 = reg_gp_oe & reg_sel_gp_lo & reg_sel_de;

assign	SYNTHESIZED_WIRE_48 = reg_sel_de & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_38 = reg_gp_oe & reg_sel_gp_lo & reg_sel_bc2;

assign	SYNTHESIZED_WIRE_36 = reg_sel_bc2 & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_42 = reg_gp_oe & reg_sel_gp_lo & reg_sel_bc;

assign	SYNTHESIZED_WIRE_40 = reg_sel_bc & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_30 = reg_gp_oe & reg_sel_gp_lo & reg_sel_af2;

assign	SYNTHESIZED_WIRE_28 = reg_sel_af2 & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_62 = reg_sys_oe & reg_sel_sys_lo & reg_sel_ir;

assign	SYNTHESIZED_WIRE_34 = reg_gp_oe & reg_sel_gp_lo & reg_sel_af;

assign	SYNTHESIZED_WIRE_32 = reg_sel_af & reg_sel_gp_hi & reg_gp_oe;

assign	SYNTHESIZED_WIRE_60 = reg_sel_ir & reg_sel_sys_hi & reg_sys_oe;

assign	SYNTHESIZED_WIRE_83 = reg_sel_gp_lo & SYNTHESIZED_WIRE_84 & reg_sel_sp;


reg_latch	b2v_latch_af2_hi(
	.oen(SYNTHESIZED_WIRE_28),
	.we(SYNTHESIZED_WIRE_29),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_af2_lo(
	.oen(SYNTHESIZED_WIRE_30),
	.we(SYNTHESIZED_WIRE_31),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_af_hi(
	.oen(SYNTHESIZED_WIRE_32),
	.we(SYNTHESIZED_WIRE_33),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_af_lo(
	.oen(SYNTHESIZED_WIRE_34),
	.we(SYNTHESIZED_WIRE_35),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_bc2_hi(
	.oen(SYNTHESIZED_WIRE_36),
	.we(SYNTHESIZED_WIRE_37),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_bc2_lo(
	.oen(SYNTHESIZED_WIRE_38),
	.we(SYNTHESIZED_WIRE_39),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_bc_hi(
	.oen(SYNTHESIZED_WIRE_40),
	.we(SYNTHESIZED_WIRE_41),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_bc_lo(
	.oen(SYNTHESIZED_WIRE_42),
	.we(SYNTHESIZED_WIRE_43),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_de2_hi(
	.oen(SYNTHESIZED_WIRE_44),
	.we(SYNTHESIZED_WIRE_45),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_de2_lo(
	.oen(SYNTHESIZED_WIRE_46),
	.we(SYNTHESIZED_WIRE_47),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_de_hi(
	.oen(SYNTHESIZED_WIRE_48),
	.we(SYNTHESIZED_WIRE_49),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_de_lo(
	.oen(SYNTHESIZED_WIRE_50),
	.we(SYNTHESIZED_WIRE_51),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_hl2_hi1(
	.oen(SYNTHESIZED_WIRE_52),
	.we(SYNTHESIZED_WIRE_53),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_hl2_lo(
	.oen(SYNTHESIZED_WIRE_54),
	.we(SYNTHESIZED_WIRE_55),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_hl_hi(
	.oen(SYNTHESIZED_WIRE_56),
	.we(SYNTHESIZED_WIRE_57),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_hl_lo(
	.oen(SYNTHESIZED_WIRE_58),
	.we(SYNTHESIZED_WIRE_59),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_ir_hi(
	.oen(SYNTHESIZED_WIRE_60),
	.we(SYNTHESIZED_WIRE_61),
	.db(db_hi_as)
	);


reg_latch	b2v_latch_ir_lo(
	.oen(SYNTHESIZED_WIRE_62),
	.we(SYNTHESIZED_WIRE_63),
	.db(db_lo_as)
	);


reg_latch	b2v_latch_ix_hi(
	.oen(SYNTHESIZED_WIRE_64),
	.we(SYNTHESIZED_WIRE_65),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_ix_lo(
	.oen(SYNTHESIZED_WIRE_66),
	.we(SYNTHESIZED_WIRE_67),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_iy_hi(
	.oen(SYNTHESIZED_WIRE_68),
	.we(SYNTHESIZED_WIRE_69),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_iy_lo(
	.oen(SYNTHESIZED_WIRE_70),
	.we(SYNTHESIZED_WIRE_71),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_pc_hi(
	.oen(SYNTHESIZED_WIRE_72),
	.we(SYNTHESIZED_WIRE_73),
	.db(db_hi_as)
	);


reg_latch	b2v_latch_pc_lo(
	.oen(SYNTHESIZED_WIRE_74),
	.we(SYNTHESIZED_WIRE_75),
	.db(db_lo_as)
	);


reg_latch	b2v_latch_sp_hi(
	.oen(SYNTHESIZED_WIRE_76),
	.we(SYNTHESIZED_WIRE_77),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_sp_lo(
	.oen(SYNTHESIZED_WIRE_78),
	.we(SYNTHESIZED_WIRE_79),
	.db(db_lo_ds)
	);


reg_latch	b2v_latch_wz_hi(
	.oen(SYNTHESIZED_WIRE_80),
	.we(SYNTHESIZED_WIRE_81),
	.db(db_hi_ds)
	);


reg_latch	b2v_latch_wz_lo(
	.oen(SYNTHESIZED_WIRE_82),
	.we(SYNTHESIZED_WIRE_83),
	.db(db_lo_ds)
	);

assign	db_lo_ds[7] = ctl_sw_4u ? db_lo_as[7] : 1'bz;
assign	db_lo_ds[6] = ctl_sw_4u ? db_lo_as[6] : 1'bz;
assign	db_lo_ds[5] = ctl_sw_4u ? db_lo_as[5] : 1'bz;
assign	db_lo_ds[4] = ctl_sw_4u ? db_lo_as[4] : 1'bz;
assign	db_lo_ds[3] = ctl_sw_4u ? db_lo_as[3] : 1'bz;
assign	db_lo_ds[2] = ctl_sw_4u ? db_lo_as[2] : 1'bz;
assign	db_lo_ds[1] = ctl_sw_4u ? db_lo_as[1] : 1'bz;
assign	db_lo_ds[0] = ctl_sw_4u ? db_lo_as[0] : 1'bz;

assign	db_lo_as[7] = ctl_sw_4d ? db_lo_ds[7] : 1'bz;
assign	db_lo_as[6] = ctl_sw_4d ? db_lo_ds[6] : 1'bz;
assign	db_lo_as[5] = ctl_sw_4d ? db_lo_ds[5] : 1'bz;
assign	db_lo_as[4] = ctl_sw_4d ? db_lo_ds[4] : 1'bz;
assign	db_lo_as[3] = ctl_sw_4d ? db_lo_ds[3] : 1'bz;
assign	db_lo_as[2] = ctl_sw_4d ? db_lo_ds[2] : 1'bz;
assign	db_lo_as[1] = ctl_sw_4d ? db_lo_ds[1] : 1'bz;
assign	db_lo_as[0] = ctl_sw_4d ? db_lo_ds[0] : 1'bz;

assign	db_hi_ds[7] = ctl_sw_4u ? db_hi_as[7] : 1'bz;
assign	db_hi_ds[6] = ctl_sw_4u ? db_hi_as[6] : 1'bz;
assign	db_hi_ds[5] = ctl_sw_4u ? db_hi_as[5] : 1'bz;
assign	db_hi_ds[4] = ctl_sw_4u ? db_hi_as[4] : 1'bz;
assign	db_hi_ds[3] = ctl_sw_4u ? db_hi_as[3] : 1'bz;
assign	db_hi_ds[2] = ctl_sw_4u ? db_hi_as[2] : 1'bz;
assign	db_hi_ds[1] = ctl_sw_4u ? db_hi_as[1] : 1'bz;
assign	db_hi_ds[0] = ctl_sw_4u ? db_hi_as[0] : 1'bz;

assign	db_hi_as[7] = ctl_sw_4d ? db_hi_ds[7] : 1'bz;
assign	db_hi_as[6] = ctl_sw_4d ? db_hi_ds[6] : 1'bz;
assign	db_hi_as[5] = ctl_sw_4d ? db_hi_ds[5] : 1'bz;
assign	db_hi_as[4] = ctl_sw_4d ? db_hi_ds[4] : 1'bz;
assign	db_hi_as[3] = ctl_sw_4d ? db_hi_ds[3] : 1'bz;
assign	db_hi_as[2] = ctl_sw_4d ? db_hi_ds[2] : 1'bz;
assign	db_hi_as[1] = ctl_sw_4d ? db_hi_ds[1] : 1'bz;
assign	db_hi_as[0] = ctl_sw_4d ? db_hi_ds[0] : 1'bz;


endmodule
