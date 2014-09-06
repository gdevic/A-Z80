// Test register file block

// 5 MHz for a functional simulation (no delay timings)
`timescale 100 ns/ 100 ns

module test_regfile;

// We have 4 Bi-directional buses that can also be 3-stated:
// On the address-side, there are high and low 8-bit buses
reg  [7:0] db_lo_as;        // Drive it using this bus
wire [7:0] db_lo_as_sig;    // Read it using this bus

reg  [7:0] db_hi_as;        // Drive it using this bus
wire [7:0] db_hi_as_sig;    // Read it using this bus

// ----------------- BUSES -----------------
// On the data-side, there are high and low 8-bit buses
reg  [7:0] db_lo_ds;        // Drive it using this bus
wire [7:0] db_lo_ds_sig;    // Read it using this bus

reg  [7:0] db_hi_ds;        // Drive it using this bus
wire [7:0] db_hi_ds_sig;    // Read it using this bus

// ----------------- CONTROL -----------------
reg ctl_sw_4u_sig;          // Bus switch #4 upstream gate
reg ctl_sw_4d_sig;          // Bus switch #4 downstream gate

// ----------------- GP REGS -----------------
reg reg_sel_af_sig;         // Select AF register
reg reg_sel_af2_sig;        // ...
reg reg_sel_bc_sig;
reg reg_sel_bc2_sig;
reg reg_sel_de_sig;
reg reg_sel_de2_sig;
reg reg_sel_hl_sig;
reg reg_sel_hl2_sig;
reg reg_sel_ix_sig;
reg reg_sel_iy_sig;
reg reg_sel_wz_sig;
reg reg_sel_sp_sig;

reg reg_sel_gp_hi_sig;      // Select high byte of a GP register
reg reg_sel_gp_lo_sig;      // Select low byte of a GP register
reg reg_gp_oe_sig;          // Write selected GP register to the data bus

// ----------------- SYSTEM REGS -----------------
reg reg_sel_pc_sig;         // Select PC register
reg reg_sel_ir_sig;         // Select IR register

reg reg_sel_sys_hi_sig;     // Select high byte of a system register
reg reg_sel_sys_lo_sig;     // Select low byte of a system register
reg reg_sys_oe_sig;         // Write selected system register to the data bus

initial begin
    ctl_sw_4d_sig = 0;
    ctl_sw_4u_sig = 0;

    reg_sel_af_sig = 0;         // Select AF register
    reg_sel_af2_sig = 0;        // ...
    reg_sel_bc_sig = 0;
    reg_sel_bc2_sig = 0;
    reg_sel_de_sig = 0;
    reg_sel_de2_sig = 0;
    reg_sel_hl_sig = 0;
    reg_sel_hl2_sig = 0;
    reg_sel_ix_sig = 0;
    reg_sel_iy_sig = 0;
    reg_sel_wz_sig = 0;
    reg_sel_sp_sig = 0;

    reg_sel_gp_hi_sig = 0;      // Select high byte of a GP register
    reg_sel_gp_lo_sig = 0;      // Select low byte of a GP register
    reg_gp_oe_sig = 0;          // Write selected GP register to the data bus

    reg_sel_pc_sig = 0;         // Select PC register
    reg_sel_ir_sig = 0;         // Select IR register

    reg_sel_sys_hi_sig = 0;     // Select high byte of a system register
    reg_sel_sys_lo_sig = 0;     // Select low byte of a system register
    reg_sys_oe_sig = 0;         // Write selected system register to the data bus

    // Test bidirectional data buses and leave them at Z
    #1  db_lo_as = 8'hAA;
        db_hi_as = 8'h55;
        db_lo_ds   = 8'hCA;
        db_hi_ds   = 8'hFE;

    #1  db_lo_as = 'z;
        db_hi_as = 'z;
        db_lo_ds   = 'z;
        db_hi_ds   = 'z;

    // Store a value in a GP register and read it back
    #1  db_lo_ds = 8'h12;
        db_hi_ds = 8'h34;
        reg_sel_gp_hi_sig = 1;
        reg_sel_gp_lo_sig = 1;
        reg_sel_af_sig = 1;
    #1  db_lo_ds = 'z;
        db_hi_ds = 'z;
        reg_sel_af_sig = 0;
    #1
    #1  reg_sel_gp_hi_sig = 1;
        reg_sel_gp_lo_sig = 1;
        reg_sel_af_sig = 1;
        reg_gp_oe_sig = 1;
    #1


    #1 $display("END");

end

// Drive 3-state bidirectional buses with these statements
assign db_lo_as_sig = db_lo_as;
assign db_hi_as_sig = db_hi_as;

assign db_lo_ds_sig = db_lo_ds;
assign db_hi_ds_sig = db_hi_ds;

// Instantiate register file block
reg_file reg_file_inst
(
	.ctl_sw_4u(ctl_sw_4u_sig) ,	// input  ctl_sw_4u_sig
	.ctl_sw_4d(ctl_sw_4d_sig) ,	// input  ctl_sw_4d_sig
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
	.db_lo_as(db_lo_as_sig[7:0]) ,	// inout [7:0] db_lo_as_sig
	.db_hi_as(db_hi_as_sig[7:0]) ,	// inout [7:0] db_hi_as_sig
	.db_lo_ds(db_lo_ds_sig[7:0]) ,	// inout [7:0] db_lo_ds_sig
	.db_hi_ds(db_hi_ds_sig[7:0]) 	// inout [7:0] db_hi_ds_sig
);

endmodule
