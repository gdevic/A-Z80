// Test register control and register file blocks

// 5 MHz for a functional simulation (no delay timings)
`timescale 100 ns/ 100 ns

module test_registers;

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
reg reset;                  // Reset latches in the control block

reg ctl_reg_exx_sig;        // Register exchange control
reg ctl_reg_ex_af_sig;      // Register exchange control
reg ctl_reg_ex_de_hl_sig;   // Register exchange control

reg ctl_reg_use_ixiy_sig;   // Use IX or IY instead of HL state wire
reg ctl_reg_use_ix_sig;     // Use IX as opposed to IY

// ----------------- GP REGS -----------------
reg ctl_reg_sel_gp_sig;     // Select one of the GP registers:
reg [2:0] reg_sel_sig;      // Selects one of the GP registers: B, C, D, E,...
reg ctl_reg_sel_gp_16_sig;  // Address a 16-bit pair on both buses
reg ctl_reg_use_sp_sig;     // Use SP instead of AF when indexed through GP selector
reg ctl_reg_gp_oe_sig;      // Write selected GP register to the data bus

// ----------------- SYSTEM REGS -----------------
reg ctl_reg_sel_wz_sig;     // Direct address system register WZ
reg ctl_reg_sel_pc_sig;     // Direct address system register PC
reg ctl_reg_sel_ir_sig;     // Direct address system register IR

reg ctl_reg_sel_sys_hi_sig; // Select high byte of a system register
reg ctl_reg_sel_sys_lo_sig; // Select low byte of a system register
reg ctl_reg_sys_oe_sig;     // Write selected system register to the data bus

// These are the output signals from the control module into the register file module
wire reg_sel_af_sig;
wire reg_sel_af2_sig;
wire reg_sel_bc_sig;
wire reg_sel_bc2_sig;
wire reg_sel_de_sig;
wire reg_sel_de2_sig;
wire reg_sel_hl_sig;
wire reg_sel_hl2_sig;
wire reg_sel_ix_sig;
wire reg_sel_iy_sig;
wire reg_sel_wz_sig;
wire reg_sel_sp_sig;
wire reg_sel_pc_sig;
wire reg_sel_ir_sig;
wire reg_sel_gp_hi_sig;
wire reg_sel_gp_lo_sig;
wire reg_sel_sys_hi_sig;
wire reg_sel_sys_lo_sig;
wire reg_gp_oe_sig;
wire reg_sys_oe_sig;

initial begin
    ctl_sw_4u_sig = 0;
    ctl_sw_4d_sig = 0;
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
    ctl_reg_sel_gp_16_sig = 0;
    ctl_reg_sel_sys_hi_sig = 0;
    ctl_reg_sel_sys_lo_sig = 0;
    ctl_reg_sys_oe_sig = 0;
    ctl_reg_gp_oe_sig = 0;

    // Perform a reset cycle and reset bidirectional buses to Z
    reset = 1;
    db_lo_as = 'z;
    db_hi_as = 'z;
    db_lo_ds = 'z;
    db_hi_ds = 'z;
    #1  reset = 0;

    //------------------------------------------------------------
    // Identify each 16-bit system register and check access to it
    #1  ctl_sw_4d_sig = 1;          // Use unified bus: downstream
        ctl_reg_sel_sys_hi_sig = 1; // 16-bit access
        ctl_reg_sel_sys_lo_sig = 1; // 16-bit access
        db_hi_ds = 8'h81;
        db_lo_ds = 8'h41;
        ctl_reg_sel_wz_sig = 1;     // WZ
    #1  db_hi_ds = 8'h82;
        db_lo_ds = 8'h42;
        ctl_reg_sel_wz_sig = 0;     // WZ off
        ctl_reg_sel_pc_sig = 1;     // PC
    #1  db_hi_ds = 8'h83;
        db_lo_ds = 8'h43;
        ctl_reg_sel_pc_sig = 0;     // PC off
        ctl_reg_sel_ir_sig = 1;     // IR
    #1  db_hi_ds = 'z;
        db_lo_ds = 'z;
        ctl_reg_sel_ir_sig = 0;     // IR off
    // Read back
        ctl_reg_sys_oe_sig = 1;     // Write register value to bus
        ctl_reg_sel_wz_sig = 1;     // WZ
    #1  ctl_reg_sel_wz_sig = 0;     // WZ off
        ctl_reg_sel_pc_sig = 1;     // PC
    #1  ctl_reg_sel_pc_sig = 0;     // PC off
        ctl_reg_sel_ir_sig = 1;     // IR
    // End the test
    #1  ctl_reg_sel_ir_sig = 0;     // IR off
        ctl_sw_4d_sig = 0;
        ctl_reg_sel_sys_hi_sig = 0;
        ctl_reg_sel_sys_lo_sig = 0;

    //------------------------------------------------------------
    // Identify each 16-bit register and check access to it
    #1  ctl_reg_sel_gp_sig = 1;     // select a GP register
        ctl_reg_sel_gp_16_sig = 1;  // 16-bit access
        db_hi_ds = 8'h80;
        db_lo_ds = 8'h40;
        reg_sel_sig = 3'b000;       // BC
    #1  db_hi_ds = 8'h81;
        db_lo_ds = 8'h41;
        reg_sel_sig = 3'b010;       // DE
    #1  db_hi_ds = 8'h82;
        db_lo_ds = 8'h42;
        reg_sel_sig = 3'b100;       // HL
    #1  db_hi_ds = 8'h83;
        db_lo_ds = 8'h43;
        reg_sel_sig = 3'b110;       // AF
    // Read back
    #1  db_hi_ds = 'z;
        db_lo_ds = 'z;
        ctl_reg_gp_oe_sig = 1;      // Write register value to bus
        reg_sel_sig = 3'b000;       // BC
    #1  reg_sel_sig = 3'b010;       // DE
    #1  reg_sel_sig = 3'b100;       // HL
    #1  reg_sel_sig = 3'b110;       // AF
    #1  ctl_reg_gp_oe_sig = 0;      // End the test
        ctl_reg_sel_gp_16_sig = 0;

    //------------------------------------------------------------
    // Identify each 8-bit register and check access to it
    #1  ctl_reg_sel_gp_sig = 1;     // select a GP register
        db_hi_ds = 8'h00;
        db_lo_ds = 'z;
        reg_sel_sig = 3'b000;       // high byte -> B
    #1  db_hi_ds = 'z;
        db_lo_ds = 8'h01;
        reg_sel_sig = 3'b001;       // low byte -> C
    #1  db_hi_ds = 8'h02;
        db_lo_ds = 'z;
        reg_sel_sig = 3'b010;       // high byte -> D
    #1  db_hi_ds = 'z;
        db_lo_ds = 8'h03;
        reg_sel_sig = 3'b011;       // low byte -> E
    #1  db_hi_ds = 8'h04;
        db_lo_ds = 'z;
        reg_sel_sig = 3'b100;       // high byte -> H
    #1  db_hi_ds = 'z;
        db_lo_ds = 8'h05;
        reg_sel_sig = 3'b101;       // low byte -> L
    #1  db_hi_ds = 8'h06;
        db_lo_ds = 'z;
        reg_sel_sig = 3'b110;       // high byte -> A
    #1  db_hi_ds = 'z;
        db_lo_ds = 8'h07;
        reg_sel_sig = 3'b111;       // low byte -> F
    // Read back
    #1  db_hi_ds = 'z;
        db_lo_ds = 'z;
        ctl_reg_gp_oe_sig = 1;      // Write register value to bus
        reg_sel_sig = 3'b000;       // high byte -> B
    #1  reg_sel_sig = 3'b001;       // low byte -> C
    #1  reg_sel_sig = 3'b010;       // high byte -> D
    #1  reg_sel_sig = 3'b011;       // low byte -> E
    #1  reg_sel_sig = 3'b100;       // high byte -> H
    #1  reg_sel_sig = 3'b101;       // low byte -> L
    #1  reg_sel_sig = 3'b110;       // high byte -> A
    #1  reg_sel_sig = 3'b111;       // low byte -> F
    #1  ctl_reg_gp_oe_sig = 0;      // End the test

    #1 $display("END");
    #1 $stop();
end

// Drive 3-state bidirectional buses with these statements
assign db_lo_as_sig = db_lo_as;
assign db_hi_as_sig = db_hi_as;

assign db_lo_ds_sig = db_lo_ds;
assign db_hi_ds_sig = db_hi_ds;

// Instantiate register control block
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
	.reg_gp_oe(reg_gp_oe_sig), 	// output  reg_gp_oe_sig
	.reset(reset)
);

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
