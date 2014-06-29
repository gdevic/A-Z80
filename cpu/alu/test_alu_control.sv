// Test complete ALU control block
`timescale 100 ps/ 100 ps
module test_alu_control;

// ------------------------ BUS LOGIC ------------------------
// Data bus, interface to the outside world: write only
wire [7:0] db;

// Bus control
logic ctl_daa_oe;           // DAA block output enable to the outside bus

// ------------------------ INPUT ------------------------
// Input to the DAA logic
logic ctl_daa_66;           // Force DAA block to output 0x66
logic alu_low_gt_9;
logic alu_high_eq_9;
logic alu_high_gt_9;

logic flags_hf;             // Input half flag
logic flags_cf;             // Input carry flag

// ------------------------ INPUT ------------------------
// Input to the shift control unit
logic alu_shift_db7;
logic alu_shift_db0;
logic ctl_shift_en;
logic [5:3] op543;
logic shift_cf_in;

wire shift_cf_out;
wire alu_shift_left;
wire alu_shift_right;
wire alu_shift_in;


initial begin
    // Init / reset
    ctl_daa_oe = 0;

    ctl_daa_66 = 0;
    alu_low_gt_9 = 0;
    alu_high_eq_9 = 0;
    alu_high_gt_9 = 0;

    flags_hf = 0;
    flags_cf = 0;

    alu_shift_db7 = 0;
    alu_shift_db0 = 0;
    ctl_shift_en = 0;
    op543 = 2'h0;
    shift_cf_in = 0;

    // TODO: Manually controlled, for now...

    #1  $display("End of test");
end

//--------------------------------------------------------------
// Instantiate ALU control block and assign identical nets and variables
//--------------------------------------------------------------
alu_control alu_control_inst( .* );

endmodule
