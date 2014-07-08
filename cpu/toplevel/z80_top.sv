//============================================================================
// Z80 Top level
//============================================================================
`timescale 100 ps/ 100 ps

`include "z80.svh"

module z80_top (intf.dut z80);

//--------------------------------------------------------------
// Instantiate design blocks
//--------------------------------------------------------------
// First, the sequencer, the hart of the CPU

// Cpu control block, IR, PLA
//pla_decode      pla_decode ( .* );
//execute         execute    ( .* );
//ir              ir         ( .* );

// Register file and its control block
//reg_file        reg_file    ( .* );
//reg_control     reg_control ( .* );

// ALU and its control block
//alu             alu         ( .* );
//alu_control     alu_control ( .* );
//alu_flags       alu_flags   ( .* );

// Bus endpoints, switches, address latch/increment module
//address_latch   address_latch ( .* );
//address_pins    address_pins  ( .* );

//logic ctl_bus_pin_oe;
logic m1;
logic mreq;
logic iorq;
logic rd;
logic wr;
logic rfsh;
logic halt;
logic mwait;
logic busack;
logic nmi;
logic reset;
logic busrq;
logic intr;
logic clk;

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
    .CPUCLK  (z80.CPUCLK)
 );

logic M1;
logic M2;
logic M3;
logic M4;
logic M5;
logic M6;
logic T1;                      // T-cycle #1
logic T2;                      // T-cycle #2
logic T3;                      // T-cycle #3
logic T4;                      // T-cycle #4
logic T5;                      // T-cycle #5
logic T6;                      // T-cycle #6
logic fFetch;                  // Function: opcode fetch cycle ("M1")
logic fMRead;                  // Function: memory read cycle
logic fMWrite;                 // Function: memory write cycle
logic fIORead;                 // Function: IO Read cycle
logic fIOWrite;                // Function: IO Write cycle
logic fIntr;                   // Function: Interrupt response cycle
logic nextM;
logic setM1;

logic hold_clk;               // Signal to the sequencer to hold the clock
logic ctl_bus_pin_oe;         // Output enable (vs. Tri-state) of MREQ,IORQ,RD,WR and RFSH
logic ctl_ab_pin_oe;          // Address bus pads: output enable to address pins
logic ctl_ab_we;              // Address bus pads: write the output pin address latch
logic ctl_db_pin_oe;          // Data bus pads: output enable
logic ctl_db_pin_re;          // Data bus pads: read from the output pin into the latch
logic ctl_db_we;              // Data bus pads: write from internal DB to its latch
logic ctl_db_oe;              // Data bus pads: read from its latch into internal DB

pin_control pin_control ( .* );

//assign z80.nM1   = m1;
//assign z80.nMREQ = mreq;
//assign z80.nIORQ = iorq;
//assign z80.nRD   = rd;
//assign z80.nWR   = wr;
//assign z80.nRFSH = rfsh;
//assign z80.nHALT = halt;
//assign z80.nWAIT = mwait;
//assign z80.nBUSACK = busack;

//assign intr  = z80.nINT;
//assign nmi   = z80.nNMI;
//assign reset = z80.nRESET;
//assign busrq = z80.nBUSRQ;
//assign clk   = z80.CPUCLK;


sequencer sequencer ( .* );

//data_pins       data_pins     ( .*, .db(db1[7:0]) );

endmodule
