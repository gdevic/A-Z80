// Test complete ALU block
`timescale 100 ps/ 100 ps
module test_alu;

// ----------------- INPUT -----------------
// Bus control
reg alu_oe_sig;             // ALU unit output enable to the outside bus

// Write to the ALU internal data buses
reg alu_shift_oe_sig;       // Enable writing by the input shifter
reg alu_op1_oe_sig;         // Enable writing by the OP1 latch
reg alu_op2_oe_sig;         // Enable writing by the OP2 latch
reg alu_res_oe_sig;         // Enable writing by the ALU result latch
reg alu_bs_oe_sig;          // Enable writing by the input bit selector

// Input shifter control wires and output from the shifter
reg alu_shift_enable_sig;   // Enable input shift vs. pass-through
reg alu_shift_in_sig;       // Carry-in
reg alu_shift_right_sig;    // Shift right (1) or left (0)
reg alu_shift_sra_sig;      // SRA instruction, keep bit [7]
wire alu_shift_out_sig;     // Output carry bit from the input shifter

// Input bit selector control wires
reg [2:0] bsel_sig;         // Selects a bit to generate

// Operator latch 1 mux select
reg alu_op1_sel_bus_sig;    // OP1 is read from the internal bus
reg alu_op1_sel_low_sig;    // OP1 is read from the low nibble
reg alu_op1_sel_zero_sig;   // OP1 is loaded with zero

// Operator 2 latch mux select
reg alu_op2_sel_bus_sig;    // OP2 is read from the internal bus
reg alu_op2_sel_lq_sig;     // OP2 is read from the L-Q gates (see schematic)
reg alu_op2_sel_zero_sig;   // OP2 is loaded with zero

// ALU operator mux select
reg alu_sel_op2_pos_sig;    // Selects positive OP2 as opposed to complemented bits
reg alu_sel_op2_low_sig;    // Selects low OP2 nibble as opposed to high OP2 nibble

// ALU Core operations
reg alu_core_cf_in_sig;     // Carry input into the ALU core
reg alu_core_R_sig;         // Operation control "R"
reg alu_core_S_sig;         // Operation control "S"
reg alu_core_V_sig;         // Operation control "V"
reg alu_op_low_sig;         // Signal to compute and store the low nibble (see schematic)
wire alu_core_cf_out_sig;   // Output carry bit from the ALU core

// Zero-detect, parity calculation and DAA-preparation logic
reg alu_parity_in_sig;      // Input parity bit from a previous nibble
wire alu_parity_out_sig;    // Output parity on the result and a previous nibble
wire alu_zero_sig;          // Output signal that the result is zero
wire alu_low_gt_9_sig;      // Output signal that the low nibble result > 9
wire alu_high_gt_9_sig;     // Output signal that the high nibble result > 9
wire alu_high_eq_9_sig;     // Output signal that the high nibble result == 9

// ----------------- BUSSES -----------------
// Bidirectional data bus, interface to the outside world
reg  [7:0] db;              // Drive it using this bus
wire [7:0] db_sig;          // Read it using this bus

wire [3:0] test_db_low_sig; // Test point to probe internal low nibble bus
wire [3:0] test_db_high_sig;// Test point to probe internal high nibble bus

initial begin
    // Init / reset
    db = 8'h00;
    alu_oe_sig = 0;

    alu_shift_oe_sig = 0;
    alu_op1_oe_sig = 0;
    alu_op2_oe_sig = 0;
    alu_res_oe_sig = 0;
    alu_bs_oe_sig = 0;

    alu_shift_enable_sig = 0;
    alu_shift_in_sig = 0;
    alu_shift_right_sig = 0;
    alu_shift_sra_sig = 0;

    bsel_sig = 2'h0;

    alu_op1_sel_bus_sig = 0;
    alu_op1_sel_low_sig = 0;
    alu_op1_sel_zero_sig = 0;

    alu_op2_sel_bus_sig = 0;
    alu_op2_sel_lq_sig = 0;
    alu_op2_sel_zero_sig = 0;

    alu_sel_op2_pos_sig = 0;
    alu_sel_op2_low_sig = 0;

    alu_core_cf_in_sig = 0;
    alu_core_R_sig = 0;
    alu_core_S_sig = 0;
    alu_core_V_sig = 0;
    alu_op_low_sig = 0;

    alu_parity_in_sig = 0;


    #1 $display("End of test");
end

// Drive 3-state bidirectional bus with these statements
assign db_sig = db;

//--------------------------------------------------------------
// Instantiate ALU block
//--------------------------------------------------------------
alu alu_inst
(
	.alu_shift_enable(alu_shift_enable_sig) ,	// input  alu_shift_enable_sig
	.alu_shift_in(alu_shift_in_sig) ,	// input  alu_shift_in_sig
	.alu_shift_right(alu_shift_right_sig) ,	// input  alu_shift_right_sig
	.alu_shift_sra(alu_shift_sra_sig) ,	// input  alu_shift_sra_sig
	.alu_shift_out(alu_shift_out_sig) ,	// output  alu_shift_out_sig

	.alu_op1_sel_bus(alu_op1_sel_bus_sig) ,	// input  alu_op1_sel_bus_sig
	.alu_op1_sel_low(alu_op1_sel_low_sig) ,	// input  alu_op1_sel_low_sig
	.alu_op1_sel_zero(alu_op1_sel_zero_sig) ,	// input  alu_op1_sel_zero_sig

	.alu_op2_sel_bus(alu_op2_sel_bus_sig) ,	// input  alu_op2_sel_bus_sig
	.alu_op2_sel_lq(alu_op2_sel_lq_sig) ,	// input  alu_op2_sel_lq_sig
	.alu_op2_sel_zero(alu_op2_sel_zero_sig) ,	// input  alu_op2_sel_zero_sig

	.alu_sel_op2_pos(alu_sel_op2_pos_sig) ,	// input  alu_sel_op2_pos_sig
	.alu_sel_op2_low(alu_sel_op2_low_sig) ,	// input  alu_sel_op2_low_sig

	.alu_core_cf_in(alu_core_cf_in_sig) ,	// input  alu_core_cf_in_sig
	.alu_core_R(alu_core_R_sig) ,	// input  alu_core_R_sig
	.alu_core_S(alu_core_S_sig) ,	// input  alu_core_S_sig
	.alu_core_V(alu_core_V_sig) ,	// input  alu_core_V_sig
	.alu_op_low(alu_op_low_sig) ,	// input  alu_op_low_sig
	.alu_core_cf_out(alu_core_cf_out_sig) ,	// output  alu_core_cf_out_sig

	.alu_parity_in(alu_parity_in_sig) ,	// input  alu_parity_in_sig
	.alu_parity_out(alu_parity_out_sig) ,	// output  alu_parity_out_sig
	.alu_zero(alu_zero_sig) ,	// output  alu_zero_sig
	.alu_low_gt_9(alu_low_gt_9_sig) ,	// output  alu_low_gt_9_sig
	.alu_high_gt_9(alu_high_gt_9_sig) ,	// output  alu_high_gt_9_sig
	.alu_high_eq_9(alu_high_eq_9_sig) ,	// output  alu_high_eq_9_sig

	.alu_oe(alu_oe_sig) ,	// input  alu_oe_sig
	.alu_shift_oe(alu_shift_oe_sig) ,	// input  alu_shift_oe_sig
	.alu_op1_oe(alu_op1_oe_sig) ,	// input  alu_op1_oe_sig
	.alu_op2_oe(alu_op2_oe_sig) ,	// input  alu_op2_oe_sig
	.alu_res_oe(alu_res_oe_sig) ,	// input  alu_res_oe_sig
	.alu_bs_oe(alu_bs_oe_sig) ,	// input  alu_bs_oe_sig
	.bsel(bsel_sig) ,	// input [2:0] bsel_sig
	.db(db_sig) ,	// inout [7:0] db_sig
	.test_db_low(test_db_low_sig) ,	// output [3:0] test_db_low_sig
	.test_db_high(test_db_high_sig) 	// output [3:0] test_db_high_sig
);

endmodule
