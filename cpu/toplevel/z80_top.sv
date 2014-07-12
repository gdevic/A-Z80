//============================================================================
// Z80 Top level
//============================================================================
`timescale 100 ps/ 100 ps

`include "z80.svh"

module z80_top (z80_if.dut z80);

//----------------------------------------------------------------------------
// Instantiate design blocks
//----------------------------------------------------------------------------

logic [7:0] opcode;

ir instruction_reg ( .* );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic [107:0] pla;

pla_decode pla_decode ( .* );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic M1;
logic M2;
logic M3;
logic M4;
logic M5;
logic M6;
logic T1;
logic T2;
logic T3;
logic T4;
logic T5;
logic T6;

sequencer sequencer ( .* );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Control the machine state sequencer
logic nextM;                  // Signal to the sequencer to advance to the next M-cycle (also reset T to T1)
logic setM1;                  // Signal to the sequencer to reset next cycle to M1/T1 (next instruction fetch)
// Set M1 based on a condition signal: setM1 if the condition is false
logic setM1ss;                // setM1 to ~'ss' flag condition signal
logic setM1cc;                // setM1 to ~'cc' flag condition signal
logic setM1bz;                // setM1 to zero-flag (ZF); used for DJNZ after decrementing B
// Control IO pin states sequence
logic fFetch;                 // Pin control to hold the instruction fetch (M1) sequence
logic fMRead;                 // Pin control to hold the memory read sequence
logic fMWrite;                // Pin control to hold the memory write sequence
logic fIORead;                // Pin control to hold the IO read sequence
logic fIOWrite;               // Pin control to hold the IO write sequence
logic FIntr;                  // Pin control to hold the interrupt pin sequence
// Controls internal data bus switches
logic ctl_bus_sw1;            // Switch 1 on (connects pads to ALU)
logic ctl_bus_sw2;            // Switch 2 on (connects top and bottom register byte)
logic ctl_bus_sw4;            // Switch 4 on (connects PC/IR with the rest of the registers)
// Control of Address Latch (AL), address increment (INC) and address mux (AB_MUX)
logic ctl_al_we;              // Write enable to address latch
logic ctl_inc_dec;            // Perform decrement (1) or increment (0)
logic ctl_inc_limit6;         // Limit increment to 6 bits (for incrementing IR)
logic ctl_inc_cy;             // Address increment, carry in value (+/-1 or 0)
logic ctl_ab_mux_inc;         // Address bus mux: select from latch (0) or the increment (1)

logic [4:0] prefix;

logic ctl_ir_we;
logic explode;
logic halt;
logic mwait;
logic fIntr;
logic ctl_bus_zero_oe;
logic ctl_shift_en;
logic ctl_daa_66;
logic ctl_daa_oe;
logic ctl_alu_op_low;
logic ctl_cond_short;
logic iff2;
logic [1:0] ctl_pf_sel;

logic ctl_flags_oe;
logic ctl_flags_bus;
logic ctl_flags_alu;
logic ctl_flags_nf_set;
logic ctl_daa;
logic ctl_flags_we_cf2;
logic ctl_flags_use_cf2;
logic ctl_flags_cf_set;
logic ctl_flags_cf_cpl;
logic ctl_flags_cf_we;
logic ctl_flags_sz_we;
logic ctl_flags_xy_we;
logic ctl_flags_hf_we;
logic ctl_flags_pf_we;
logic ctl_flags_nf_we;

logic alu_core_R;
logic alu_core_V;
logic alu_core_S;
logic alu_bs_oe;
logic alu_oe;
logic alu_shift_oe;
logic alu_core_cf_in;
logic alu_op2_oe;
logic alu_op1_oe;
logic alu_res_oe;
logic alu_op1_sel_low;
logic alu_op1_sel_zero;
logic alu_op1_sel_bus;
logic alu_op2_sel_zero;
logic alu_op2_sel_bus;
logic alu_op2_sel_lq;
logic alu_op_low;
logic alu_sel_op2_neg;
logic alu_sel_op2_high;

logic ctl_sw_4d;
logic ctl_sw_4u;

logic ctl_reg_exx;
logic ctl_reg_use_ixiy;
logic ctl_reg_use_ix;
logic ctl_reg_ex_af;
logic ctl_reg_ex_de_hl;
logic ctl_reg_use_sp;
logic ctl_reg_sel_wz;
logic ctl_reg_sel_pc;
logic ctl_reg_sel_ir;
logic ctl_reg_sel_gp_16;
logic ctl_reg_sel_sys_hi;
logic ctl_reg_sel_sys_lo;
logic ctl_reg_sys_oe;
logic ctl_reg_sel_gp;
logic ctl_reg_gp_oe;
logic [2:0] reg_sel;

logic ctl_bus_inc_we;
logic ctl_inc_zero;

execute execute ( .* );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic nM1;
logic nMREQ;
logic nIORQ;
logic nRD;
logic nWR;
logic nRFSH;
logic nHALT;
logic nWAIT;
logic nBUSACK;
logic nmi;
logic reset;
logic busrq;
logic clk;
logic intr;

control_pins_p control_pins ( .*,
    .nM1     (z80.nM1),
    .nMREQ   (z80.nMREQ),
    .nIORQ   (z80.nIORQ),
    .nRD     (z80.nRD),
    .nWR     (z80.nWR),
    .nRFSH   (z80.nRFSH),
    .nHALT   (z80.nHALT),
    .nWAIT   (z80.nWAIT),
    .nBUSACK (z80.nBUSACK),
    .nINT    (z80.nINT),
    .nNMI    (z80.nNMI),
    .nRESET  (z80.nRESET),
    .nBUSRQ  (z80.nBUSRQ),
    .CPUCLK  (z80.CLK)
 );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    //----------------------------------------------------------
    // Outputs to the chip control pin pads
    //----------------------------------------------------------
    logic m1;                     // M1     - Opcode fetch phase
    logic mreq;                   // MREQ   - Memory request
    logic iorq;                   // IORQ   - I/O command in progress
    logic rd;                     // RD     - Memory read request
    logic wr;                     // WR     - Memory write request
    logic rfsh;                   // RFSH   - Memory refresh phase
    logic busack;                 // BUSACK - Response to the BUSRQ

    //----------------------------------------------------------
    // Outputs to internal blocks
    //----------------------------------------------------------
    logic hold_clk;               // Signal to the sequencer to hold the clock
    logic ctl_bus_pin_oe;         // Output enable (vs. Tri-state) of MREQ,IORQ,RD,WR and RFSH
    logic ctl_ab_pin_oe;          // Address bus pads: output enable to address pins
    logic ctl_ab_we;              // Address bus pads: write the output pin address latch
    logic ctl_db_pin_oe;          // Data bus pads: output enable
    logic ctl_db_pin_re;          // Data bus pads: read from the output pin into the latch
    logic ctl_db_we;              // Data bus pads: write from internal DB to its latch
    logic ctl_db_oe;              // Data bus pads: read from its latch into internal DB

pin_control pin_control ( .* );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic [7:0] db;

data_pins data_pins ( .*, .db(db[7:0]), .D(z80.D[7:0]) );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

bus_zero bus_zero ( .* );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic [7:0] db1;

data_switch sw1 ( .ctl_sw_up(ctl_sw_1u), .ctl_sw_down(ctl_sw_1d), .db_up(db[7:0]), .db_down(db1[7:0]));
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic alu_shift_in;
logic alu_shift_right;
logic alu_shift_left;
logic shift_cf_out;
logic alu_parity_in;
logic flags_cond_true;
logic daa_cf_out;
logic pf_sel;

alu_control alu_control ( .*, .db(db1[7:0]), .op543(db[5:3]) );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic flags_sf;
logic flags_zf;
logic flags_hf;
logic flags_pf;
logic flags_cf;

alu_flags alu_flags ( .*, .db(db1[7:0]) );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic [7:0] db2;

data_switch sw2 ( .ctl_sw_up(ctl_sw_2u), .ctl_sw_down(ctl_sw_2d), .db_up(db1[7:0]), .db_down(db2[7:0]));
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic alu_zero;
logic alu_parity_out;
logic alu_high_eq_9;
logic alu_high_gt_9;
logic alu_low_gt_9;
logic alu_shift_db0;
logic alu_shift_db7;
logic alu_core_cf_out;
logic alu_sf_out;
logic alu_yf_out;
logic alu_xf_out;
logic alu_vf_out;
logic [3:0] test_db_high;
logic [3:0] test_db_low;

alu alu ( .*, .db(db2[7:0]), .bsel(db[5:3]) );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic [7:0] db_hi_as;
logic [7:0] db_lo_as;

reg_file reg_file ( .*, .db_hi_ds(db2[7:0]), .db_lo_ds(db1[7:0]), .db_hi_as(db_hi_as[7:0]), .db_lo_as(db_lo_as[7:0]) );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic reg_sel_bc;
logic reg_sel_bc2;
logic reg_sel_ix;
logic reg_sel_iy;
logic reg_sel_de;
logic reg_sel_hl;
logic reg_sel_de2;
logic reg_sel_hl2;
logic reg_sel_af;
logic reg_sel_af2;
logic reg_sel_wz;
logic reg_sel_pc;
logic reg_sel_ir;
logic reg_sel_sp;
logic reg_sel_gp_hi;
logic reg_sel_gp_lo;
logic reg_sel_sys_hi;
logic reg_sel_sys_lo;
logic reg_sys_oe;
logic reg_gp_oe;

reg_control reg_control ( .* );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

logic address_is_1;
logic [15:0] address;

address_latch address_latch ( .*, .abus({db_hi_as[7:0], db_lo_as[7:0]}) );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

address_pins address_pins ( .*, .A(z80.A[15:0]) );
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

endmodule
