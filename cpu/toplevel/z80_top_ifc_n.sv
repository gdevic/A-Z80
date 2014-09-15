//============================================================================
// Z80 Top level using the interface declaration.
// Pin signalling is negative (using control_pins_n module).
//============================================================================
`include "z80.svh"

module z80_top_ifc_n (z80_if.dut z80);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Include core A-Z80 level connecting all internal modules
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
`include "core.i"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Address, Data and Control bus drivers connecting to external pins
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
address_pins   address_pins_( .*, .abus(z80.A[15:0]) );
data_pins      data_pins_   ( .*, .db(db0[7:0]), .D(z80.D[7:0]) );
control_pins_n control_pins_( .*,
    .pin_M1      (z80.nM1),
    .pin_MREQ    (z80.nMREQ),
    .pin_IORQ    (z80.nIORQ),
    .pin_RD      (z80.nRD),
    .pin_WR      (z80.nWR),
    .pin_RFSH    (z80.nRFSH),
    .pin_HALT    (z80.nHALT),
    .pin_WAIT    (z80.nWAIT),
    .pin_BUSACK  (z80.nBUSACK),
    .pin_INT     (z80.nINT),
    .pin_NMI     (z80.nNMI),
    .pin_RESET   (z80.nRESET),
    .pin_BUSRQ   (z80.nBUSRQ),
    .CPUCLK      (z80.CLK)
 );

endmodule
