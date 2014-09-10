//============================================================================
// Z80 Top level using direct wire declaration (not the interface)
//============================================================================
module z80_top_direct(
    output wire nM1,
    output wire nMREQ,
    output wire nIORQ,
    output wire nRD,
    output wire nWR,
    output wire nRFSH,
    output wire nHALT,
    output wire nBUSACK,

    input wire nWAIT,
    input wire nINT,
    input wire nNMI,
    input wire nRESET,
    input wire nBUSRQ,

    input wire CLK,
    output wire [15:0] A,
    inout wire [7:0] D
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Include core A-Z80 level connecting all internal modules
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
`include "core.i"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Address, Data and Control bus drivers connecting to external pins
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
address_pins   address_pins_( .*, .abus(A[15:0]) );
data_pins      data_pins_   ( .*, .db(db0[7:0]), .D(D[7:0]) );
control_pins_p control_pins_( .*,
    .pin_M1      (nM1),
    .pin_MREQ    (nMREQ),
    .pin_IORQ    (nIORQ),
    .pin_RD      (nRD),
    .pin_WR      (nWR),
    .pin_RFSH    (nRFSH),
    .pin_HALT    (nHALT),
    .pin_WAIT    (nWAIT),
    .pin_BUSACK  (nBUSACK),
    .pin_INT     (nINT),
    .pin_NMI     (nNMI),
    .pin_RESET   (nRESET),
    .pin_BUSRQ   (nBUSRQ),
    .CPUCLK  (CLK)
 );

endmodule
