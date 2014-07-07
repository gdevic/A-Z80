//============================================================================
// Z80 Top level
//============================================================================
`timescale 100 ps/ 100 ps

module z80_top(
    nM1, nMREQ, nIORQ, nRD, nWR, nRFSH, nHALT, nWAIT, nBUSACK,
    nINT, nNMI, nRESET, nBUSRQ, CPUCLK,
    A[15:0], D[7:0]
// TODO: interface
);

//--------------------------------------------------------------
// Instantiate design blocks
//--------------------------------------------------------------
// First, the sequencer, the hart of the CPU
sequencer       sequencer  ( .* );

// Cpu control block, IR, PLA
pla_decode      pla_decode ( .* );
execute         execute    ( .* );
ir              ir         ( .* );

// Register file and its control block
reg_file        reg_file    ( .* );
reg_control     reg_control ( .* );

// ALU and its control block
alu             alu         ( .* );
alu_control     alu_control ( .* );
alu_flags       alu_flags   ( .* );

// Bus endpoints, switches, address latch/increment module
address_latch   address_latch ( .* );
address_pins    address_pins  ( .* );
control_pins    control_pins  ( .* );
data_pins       data_pins     ( .*, .db(db1[7:0]) );

endmodule
