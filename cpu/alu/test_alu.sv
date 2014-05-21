// Test complete ALU block
`timescale 100 ps/ 100 ps
module test_alu;

// ----------------- INPUT -----------------
// Bus control
reg alu_oe_sig;             // ALU unit output enable to the outside bus

// Write to the ALU internal data buses
reg alu_op1_oe_sig;         // Enable writing by the OP1 latch
reg alu_op2_oe_sig;         // Enable writing by the OP2 latch
reg alu_res_oe_sig;         // Enable writing by the ALU result latch
reg alu_shift_oe_sig;       // Enable writing by the input shifter
reg alu_bs_oe_sig;          // Enable writing by the input bit selector
// Our own test internal mux to select ALU bus writers
reg [2:0] bus_sel;          // Select internal bus writer:
typedef enum logic[2:0] {
    BUS_HIGHZ, BUS_OP1, BUS_OP2, BUS_RES, BUS_SHIFT, BUS_BS
} bus_t;
always_comb
begin
    alu_op1_oe_sig = 0;
    alu_op2_oe_sig = 0;
    alu_res_oe_sig = 0;
    alu_shift_oe_sig = 0;
    alu_bs_oe_sig = 0;
    case (bus_sel)
        BUS_OP1     : alu_op1_oe_sig = 1;
        BUS_OP2     : alu_op2_oe_sig = 1;
        BUS_RES     : alu_res_oe_sig = 1;
        BUS_SHIFT   : alu_shift_oe_sig = 1;
        BUS_BS      : alu_bs_oe_sig = 1;
    endcase
end

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

// ----------------- FLAGS  -----------------
reg cf;                     // Carry flag
reg pf;                     // Parity flag
reg hf;                     // Half-carry flag

initial begin
    // Init / reset
    db = 8'h00;
    alu_oe_sig = 0;

    bus_sel = BUS_HIGHZ;

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

    alu_parity_in_sig = 0;
    alu_core_cf_in_sig = 0;
    alu_core_R_sig = 0;
    alu_core_S_sig = 0;
    alu_core_V_sig = 0;
    alu_op_low_sig = 0;

    cf = 0;
    hf = 0;
    pf = 0;

    //------------------------------------------------------------
    // Test loading to internal bus from the input bit selector through the OP2 latch
    #1  db = 'z;                        // Not using external bus to load, but the bit-select
        bsel_sig = 2'h3;                // Bit 3:  0000 1000
        bus_sel = BUS_BS;
        alu_op2_sel_bus_sig = 1;        // Write into the OP2 latch

    #1  bsel_sig = 2'h0;
        alu_op2_sel_bus_sig = 0;
        bus_sel = BUS_OP2;
        alu_oe_sig = 1;                 // Write internal bus out to the ALU bus
        // Expected output on the external ALU bus : 0000 1000, 0x08
    #1  // Reset
        bus_sel = BUS_HIGHZ;
        alu_oe_sig = 0;

    //------------------------------------------------------------
    // Test loading to internal bus from the input shifter through the OP1 latch
    #1  db = 8'h24;                     // High: 0010  Low: 0100
        bus_sel = BUS_SHIFT;
        alu_shift_enable_sig = 1;       // Enable shift
        alu_shift_in_sig = 1;           // left shift <- 1
        alu_op1_sel_bus_sig = 1;        // Write into the OP1 latch

    #1  db = 'z;
        alu_shift_enable_sig = 0;
        alu_op1_sel_bus_sig = 0;
        alu_shift_in_sig = 0;
        bus_sel = BUS_OP1;              // Read back OP1 latch
    #1  // *** WHY this does not work in the same cycle??? ***
        alu_oe_sig = 1;                 // Write internal bus out to the ALU bus
        // Expected output on the external ALU bus : 0100 1001, 0x49
    #1  // Reset
        bus_sel = BUS_HIGHZ;
        alu_oe_sig = 0;                 // Write internal bus out to the ALU bus

    //------------------------------------------------------------
    // Test the full adding function, ADD
    #1  db = 8'h8C;                     // Operand 1:  8C
        bus_sel = BUS_SHIFT;            // Shifter writes to internal bus
        alu_op1_sel_bus_sig = 1;        // Write into the OP1 latch

    #1  db = 8'h6D;                     // Operand 1:  6D
        alu_op1_sel_bus_sig = 0;
        bus_sel = BUS_SHIFT;            // Shifter writes to internal bus
        alu_op2_sel_bus_sig = 1;        // Write into the OP2 latch
        // Do a low nibble addition in this cycle
        alu_sel_op2_low_sig = 1;        // Alu select OP2 low nibble
        alu_parity_in_sig = 0;          // Reset parity of the nibble
        alu_core_cf_in_sig = 0;         // CF in 0
        alu_sel_op2_pos_sig = 1;
        alu_core_R_sig = 0;
        alu_core_S_sig = 0;
        alu_core_V_sig = 0;
        alu_op_low_sig = 1;             // Perform the low nibble calculation
        hf = alu_core_cf_out_sig;       // Load the HF with the half-carry out
        pf = alu_parity_out_sig;        // Load the PF with the parity of the nibble result

    #1  db = 'z;
        bus_sel = BUS_RES;              // ALU result latch writes to the bus
        alu_op2_sel_bus_sig = 0;
        alu_sel_op2_low_sig = 0;
        alu_core_cf_in_sig = 0;
        alu_op_low_sig = 0;
        alu_core_cf_in_sig = hf;        // Carry in the half-carry
        alu_parity_in_sig = pf;         // Parity in the parity of the low result nibble
    #1  // *** WHY this does not work in the same cycle??? ***
        alu_oe_sig = 1;                 // Write internal bus out to the ALU bus
    #1  // Reset
        alu_oe_sig = 0;
        bus_sel = BUS_HIGHZ;

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
