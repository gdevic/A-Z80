// Automatically generated by genglobals.py

// Module: control/ir.v
wire [7:0] opcode;

// Module: control/pla_decode.sv
wire [104:0] pla;

// Module: control/sequencer.v
wire M1;
wire M2;
wire M3;
wire M4;
wire M5;
wire M6;
wire T1;
wire T2;
wire T3;
wire T4;
wire T5;
wire T6;

// Module: control/execute.sv
wire nextM;
wire setM1;
wire fFetch;
wire fMRead;
wire fMWrite;
wire fIORead;
wire fIOWrite;
wire setM1ss;
wire setM1cc;
wire setM1bz;

// Module: control/exec_module.i
wire ctl_ir_we;
wire ctl_iffx_clr;
wire ctl_iffx_set;
wire ctl_iff1_clr;
wire ctl_iff1_iff2;
wire ctl_im_set;
wire ctl_im_sel3;
wire ctl_im_sel4;
wire ctl_shift_en;
wire ctl_daa_66;
wire ctl_daa_oe;
wire ctl_alu_op_low;
wire ctl_cond_short;
wire [1:0] ctl_pf_sel;
wire ctl_alu_oe;
wire ctl_alu_shift_oe;
wire ctl_alu_op2_oe;
wire ctl_alu_res_oe;
wire ctl_alu_op1_oe;
wire ctl_alu_bs_oe;
wire ctl_alu_op1_sel_bus;
wire ctl_alu_op1_sel_low;
wire ctl_alu_op1_sel_zero;
wire ctl_alu_op2_sel_zero;
wire ctl_alu_op2_sel_bus;
wire ctl_alu_op2_sel_lq;
wire ctl_alu_sel_op2_neg;
wire ctl_alu_sel_op2_high;
wire ctl_alu_core_R;
wire ctl_alu_core_V;
wire ctl_alu_core_S;
wire ctl_alu_core_cf_in;
wire ctl_flags_oe;
wire ctl_flags_bus;
wire ctl_flags_alu;
wire ctl_flags_nf_set;
wire ctl_daa;
wire ctl_flags_we_cf2;
wire ctl_flags_use_cf2;
wire ctl_flags_cf_set;
wire ctl_flags_cf_cpl;
wire ctl_flags_cf_we;
wire ctl_flags_sz_we;
wire ctl_flags_xy_we;
wire ctl_flags_hf_we;
wire ctl_flags_pf_we;
wire ctl_flags_nf_we;
wire ctl_sw_4d;
wire ctl_sw_4u;
wire ctl_reg_exx;
wire ctl_reg_use_ixiy;
wire ctl_reg_use_ix;
wire ctl_reg_ex_af;
wire ctl_reg_ex_de_hl;
wire ctl_reg_use_sp;
wire ctl_reg_sel_wz;
wire ctl_reg_sel_pc;
wire ctl_reg_sel_ir;
wire ctl_reg_sel_gp_16;
wire ctl_reg_sel_sys_hi;
wire ctl_reg_sel_sys_lo;
wire ctl_reg_sys_oe;
wire ctl_reg_sel_gp;
wire ctl_reg_gp_oe;
wire ctl_bus_inc_we;
wire ctl_inc_cy;
wire ctl_inc_dec;
wire ctl_inc_zero;
wire ctl_al_we;
wire ctl_ab_mux_inc;
wire ctl_inc_limit6;
wire ctl_bus_ff_oe;
wire ctl_bus_zero_oe;

// Module: control/interrupts.v
wire iff1;
wire iff2;
wire im1;
wire im2;

// Module: control/clk_delay.v
wire Tw1;
wire Tw2;
wire hold_clk_delay;
wire T2_en;

// Module: control/pin_control.sv
wire m1;
wire mreq;
wire iorq;
wire rd;
wire wr;
wire rfsh;
wire busack;
wire hold_clk_timing;
wire pin_control_oe;
wire bus_ab_pin_oe;
wire bus_ab_pin_we;
wire bus_db_pin_oe;
wire bus_db_pin_re;
wire bus_db_we;
wire bus_db_oe;

// Module: alu/alu_control.v
wire alu_shift_in;
wire alu_shift_right;
wire alu_shift_left;
wire shift_cf_out;
wire alu_parity_in;
wire flags_cond_true;
wire daa_cf_out;
wire pf_sel;
wire alu_op_low;
wire [7:0] db;

// Module: alu/alu_select.v
wire alu_oe;
wire alu_shift_oe;
wire alu_op2_oe;
wire alu_res_oe;
wire alu_op1_oe;
wire alu_bs_oe;
wire alu_op1_sel_bus;
wire alu_op1_sel_low;
wire alu_op1_sel_zero;
wire alu_op2_sel_zero;
wire alu_op2_sel_bus;
wire alu_op2_sel_lq;
wire alu_sel_op2_neg;
wire alu_sel_op2_high;
wire alu_core_R;
wire alu_core_V;
wire alu_core_S;
wire alu_core_cf_in;

// Module: alu/alu_flags.v
wire flags_sf;
wire flags_zf;
wire flags_hf;
wire flags_pf;
wire flags_cf;

// Module: alu/alu.v
wire alu_zero;
wire alu_parity_out;
wire alu_high_eq_9;
wire alu_high_gt_9;
wire alu_low_gt_9;
wire alu_shift_db0;
wire alu_shift_db7;
wire alu_core_cf_out;
wire alu_sf_out;
wire alu_yf_out;
wire alu_xf_out;
wire alu_vf_out;
wire [3:0] test_db_high;
wire [3:0] test_db_low;

// Module: registers/reg_control.v
wire reg_sel_bc;
wire reg_sel_bc2;
wire reg_sel_ix;
wire reg_sel_iy;
wire reg_sel_de;
wire reg_sel_hl;
wire reg_sel_de2;
wire reg_sel_hl2;
wire reg_sel_af;
wire reg_sel_af2;
wire reg_sel_wz;
wire reg_sel_pc;
wire reg_sel_ir;
wire reg_sel_sp;
wire reg_sel_gp_hi;
wire reg_sel_gp_lo;
wire reg_sel_sys_hi;
wire reg_sel_sys_lo;
wire reg_sys_oe;
wire reg_gp_oe;

// Module: bus/address_latch.v
wire address_is_1;
wire [15:0] address;

// Module: bus/address_pins.v
wire [15:0] A;

// Module: bus/bus_switch.sv
wire ctl_sw_1u;
wire ctl_sw_1d;
wire ctl_sw_2u;
wire ctl_sw_2d;

// Module: bus/control_pins_p.v
wire nM1;
wire nMREQ;
wire nIORQ;
wire nRD;
wire nWR;
wire nRFSH;
wire nHALT;
wire nBUSACK;
wire nmi;
wire reset;
wire busrq;
wire clk;
wire intr;
wire mwait;
