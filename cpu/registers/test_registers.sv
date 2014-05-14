// Test register control and register file blocks
`timescale 1ns/ 100 ps
module test_registers;

logic [7:0] dbus_lo_as_sig;
logic [7:0] dbus_hi_as_sig;

logic [7:0] db_lo_ds_sig;
logic [7:0] db_hi_ds_sig;

reg ctl_sw_4_sig;

reg [2:0] reg_sel_sig;

reg ctl_reg_exx_sig;
reg ctl_reg_ex_af_sig;
reg ctl_reg_ex_de_hl_sig;
reg ctl_reg_use_ixiy_sig;
reg ctl_reg_use_ix_sig;
reg ctl_reg_use_sp_sig;
reg ctl_reg_sel_gp_sig;
reg ctl_reg_sel_wz_sig;
reg ctl_reg_sel_pc_sig;
reg ctl_reg_sel_ir_sig;
reg ctl_reg_sel_sp_sig;
reg ctl_reg_sel_gp_16_sig;
reg ctl_reg_sel_sys_hi_sig;
reg ctl_reg_sel_sys_lo_sig;
reg ctl_reg_sys_oe_sig;
reg ctl_reg_gp_oe_sig;

wire reg_sel_bc_sig;
wire reg_sel_bc2_sig;
wire reg_sel_ix_sig;
wire reg_sel_iy_sig;
wire reg_sel_de_sig;
wire reg_sel_hl_sig;
wire reg_sel_de2_sig;
wire reg_sel_hl2_sig;
wire reg_sel_af_sig;
wire reg_sel_af2_sig;
wire reg_sel_wz_sig;
wire reg_sel_pc_sig;
wire reg_sel_ir_sig;
wire reg_sel_sp_sig;
wire reg_sel_gp_hi_sig;
wire reg_sel_gp_lo_sig;
wire reg_sel_sys_hi_sig;
wire reg_sel_sys_lo_sig;
wire reg_sys_oe_sig;
wire reg_gp_oe_sig;

initial begin
    ctl_sw_4_sig = 1;
    reg_sel_sig = 3'b000;
    ctl_reg_exx_sig = 0;
    ctl_reg_ex_af_sig = 0;
    ctl_reg_ex_de_hl_sig = 0;
    ctl_reg_use_ixiy_sig = 0;
    ctl_reg_use_ix_sig = 0;
    ctl_reg_use_sp_sig = 0;
    ctl_reg_sel_gp_sig = 0;
    ctl_reg_sel_wz_sig = 0;
    ctl_reg_sel_pc_sig = 0;
    ctl_reg_sel_ir_sig = 0;
    ctl_reg_sel_sp_sig = 0;
    ctl_reg_sel_gp_16_sig = 0;
    ctl_reg_sel_sys_hi_sig = 0;
    ctl_reg_sel_sys_lo_sig = 0;
    ctl_reg_sys_oe_sig = 0;
    ctl_reg_gp_oe_sig = 0;

    #1  ctl_reg_sel_gp_sig = 1;
        ctl_reg_sys_oe_sig = 1;
        ctl_reg_sel_gp_16_sig = 1;
        
    
    #1 $display("END");

end

reg_control reg_control_inst
(
	.reg_sel(reg_sel_sig) ,	// input [2:0] reg_sel_sig
	.ctl_reg_exx(ctl_reg_exx_sig) ,	// input  ctl_reg_exx_sig
	.ctl_reg_use_ixiy(ctl_reg_use_ixiy_sig) ,	// input  ctl_reg_use_ixiy_sig
	.ctl_reg_use_ix(ctl_reg_use_ix_sig) ,	// input  ctl_reg_use_ix_sig
	.ctl_reg_ex_af(ctl_reg_ex_af_sig) ,	// input  ctl_reg_ex_af_sig
	.ctl_reg_ex_de_hl(ctl_reg_ex_de_hl_sig) ,	// input  ctl_reg_ex_de_hl_sig
	.ctl_reg_use_sp(ctl_reg_use_sp_sig) ,	// input  ctl_reg_use_sp_sig
	.ctl_reg_sel_gp(ctl_reg_sel_gp_sig) ,	// input  ctl_reg_sel_gp_sig
	.ctl_reg_sel_wz(ctl_reg_sel_wz_sig) ,	// input  ctl_reg_sel_wz_sig
	.ctl_reg_sel_pc(ctl_reg_sel_pc_sig) ,	// input  ctl_reg_sel_pc_sig
	.ctl_reg_sel_ir(ctl_reg_sel_ir_sig) ,	// input  ctl_reg_sel_ir_sig
	.ctl_reg_sel_sp(ctl_reg_sel_sp_sig) ,	// input  ctl_reg_sel_sp_sig
	.ctl_reg_sel_gp_16(ctl_reg_sel_gp_16_sig) ,	// input  ctl_reg_sel_gp_16_sig
	.ctl_reg_sel_sys_hi(ctl_reg_sel_sys_hi_sig) ,	// input  ctl_reg_sel_sys_hi_sig
	.ctl_reg_sel_sys_lo(ctl_reg_sel_sys_lo_sig) ,	// input  ctl_reg_sel_sys_lo_sig
	.ctl_reg_sys_oe(ctl_reg_sys_oe_sig) ,	// input  ctl_reg_sys_oe_sig
	.ctl_reg_gp_oe(ctl_reg_gp_oe_sig) ,	// input  ctl_reg_gp_oe_sig
	.reg_sel_bc(reg_sel_bc_sig) ,	// output  reg_sel_bc_sig
	.reg_sel_bc2(reg_sel_bc2_sig) ,	// output  reg_sel_bc2_sig
	.reg_sel_ix(reg_sel_ix_sig) ,	// output  reg_sel_ix_sig
	.reg_sel_iy(reg_sel_iy_sig) ,	// output  reg_sel_iy_sig
	.reg_sel_de(reg_sel_de_sig) ,	// output  reg_sel_de_sig
	.reg_sel_hl(reg_sel_hl_sig) ,	// output  reg_sel_hl_sig
	.reg_sel_de2(reg_sel_de2_sig) ,	// output  reg_sel_de2_sig
	.reg_sel_hl2(reg_sel_hl2_sig) ,	// output  reg_sel_hl2_sig
	.reg_sel_af(reg_sel_af_sig) ,	// output  reg_sel_af_sig
	.reg_sel_af2(reg_sel_af2_sig) ,	// output  reg_sel_af2_sig
	.reg_sel_wz(reg_sel_wz_sig) ,	// output  reg_sel_wz_sig
	.reg_sel_pc(reg_sel_pc_sig) ,	// output  reg_sel_pc_sig
	.reg_sel_ir(reg_sel_ir_sig) ,	// output  reg_sel_ir_sig
	.reg_sel_sp(reg_sel_sp_sig) ,	// output  reg_sel_sp_sig
	.reg_sel_gp_hi(reg_sel_gp_hi_sig) ,	// output  reg_sel_gp_hi_sig
	.reg_sel_gp_lo(reg_sel_gp_lo_sig) ,	// output  reg_sel_gp_lo_sig
	.reg_sel_sys_hi(reg_sel_sys_hi_sig) ,	// output  reg_sel_sys_hi_sig
	.reg_sel_sys_lo(reg_sel_sys_lo_sig) ,	// output  reg_sel_sys_lo_sig
	.reg_sys_oe(reg_sys_oe_sig) ,	// output  reg_sys_oe_sig
	.reg_gp_oe(reg_gp_oe_sig) 	// output  reg_gp_oe_sig
);

reg_file reg_file_inst
(
	.ctl_sw_4(ctl_sw_4_sig) ,	// input  ctl_sw_4_sig
	.reg_sel_pc(reg_sel_pc_sig) ,	// input  reg_sel_pc_sig
	.reg_sel_ir(reg_sel_ir_sig) ,	// input  reg_sel_ir_sig
	.reg_sel_sys_lo(reg_sel_sys_lo_sig) ,	// input  reg_sel_sys_lo_sig
	.reg_sel_sys_hi(reg_sel_sys_hi_sig) ,	// input  reg_sel_sys_hi_sig
	.reg_sel_sp(reg_sel_sp_sig) ,	// input  reg_sel_sp_sig
	.reg_sel_wz(reg_sel_wz_sig) ,	// input  reg_sel_wz_sig
	.reg_sel_iy(reg_sel_iy_sig) ,	// input  reg_sel_iy_sig
	.reg_sel_ix(reg_sel_ix_sig) ,	// input  reg_sel_ix_sig
	.reg_sel_hl2(reg_sel_hl2_sig) ,	// input  reg_sel_hl2_sig
	.reg_sel_hl(reg_sel_hl_sig) ,	// input  reg_sel_hl_sig
	.reg_sel_de2(reg_sel_de2_sig) ,	// input  reg_sel_de2_sig
	.reg_sel_de(reg_sel_de_sig) ,	// input  reg_sel_de_sig
	.reg_sel_bc2(reg_sel_bc2_sig) ,	// input  reg_sel_bc2_sig
	.reg_sel_bc(reg_sel_bc_sig) ,	// input  reg_sel_bc_sig
	.reg_sel_af2(reg_sel_af2_sig) ,	// input  reg_sel_af2_sig
	.reg_sel_af(reg_sel_af_sig) ,	// input  reg_sel_af_sig
	.reg_sel_gp_hi(reg_sel_gp_hi_sig) ,	// input  reg_sel_gp_hi_sig
	.reg_sel_gp_lo(reg_sel_gp_lo_sig) ,	// input  reg_sel_gp_lo_sig
	.reg_gp_oe(reg_gp_oe_sig) ,	// input  reg_sel_gp_oe_sig
	.reg_sys_oe(reg_sys_oe_sig) ,	// input  reg_sys_oe_sig
	.dbus_lo_as(dbus_lo_as_sig[7:0]) ,	// inout [7:0] dbus_lo_as_sig
	.dbus_hi_as(dbus_hi_as_sig[7:0]) ,	// inout [7:0] dbus_hi_as_sig
	.db_lo_ds(db_lo_ds_sig[7:0]) ,	// inout [7:0] db_lo_ds_sig
	.db_hi_ds(db_hi_ds_sig[7:0]) 	// inout [7:0] db_hi_ds_sig
);

endmodule
