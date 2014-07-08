
`ifndef Z80_IFC
`define Z80_IFC

interface z80_ifc;
    logic nM1, nMREQ, nIORQ, nRD, nWR, nRFSH, nHALT, nWAIT, nBUSACK;
    logic nINT, nNMI, nRESET, nBUSRQ, CPUCLK;
    logic A[15:0];
    wire  D[7:0];
    
//=================================================
// Modport for the CPU module (internal) interface
//=================================================
modport i (
    output nM1, nMREQ, nIORQ, nRD, nWR, nRFSH, nHALT, nWAIT, nBUSACK,
    input  nINT, nNMI, nRESET, nBUSRQ, CPUCLK,
    output A,
    inout  D);

//=================================================
// Modport for the user (external) pin interface
//=================================================
modport pin (
    input  nM1, nMREQ, nIORQ, nRD, nWR, nRFSH, nHALT, nWAIT, nBUSACK,
    output nINT, nNMI, nRESET, nBUSRQ, CPUCLK,
    input  A,
    inout  D);

endinterface : z80_ifc

`endif
