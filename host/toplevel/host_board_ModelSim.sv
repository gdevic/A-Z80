//============================================================================
// Host design containing A-Z80 and a few peripherials
//
// This module does not define a physical board but is only meant to be
// compiled within the ModelSim host test.
//
//============================================================================
module host
(
    input wire clk,
    input wire reset,
    output wire uart_tx
);

// ----------------- CPU PINS -----------------
wire nM1;
wire nMREQ;
wire nIORQ;
wire nRD;
wire nWR;
wire nRFSH;
wire nHALT;
wire nBUSACK;

wire nWAIT = 1;
wire nINT = 1;
wire nNMI = 1;
wire nBUSRQ = 1;

wire [15:0] A;
wire [7:0] D;

assign reset_stable = reset;
assign true_clk = clk;

// ----------------- INTERNAL WIRES -----------------
wire [7:0] RomData;                     // RomData is a data writer from the ROM module
wire [7:0] RamData;                     // RamData is a data writer from the RAM module
wire we;
assign we = A[15:9]=='h1 && nIORQ==1 && nRD==1 && nWR==0;

// 512b is addressable with bits [8:0]
// 512b *blocks* are selectable with bits [15:9]
// Memory map:
//   0000 - 01FF  ROM
//   0200 - 03FF  RAM
assign D[7:0] = (A[15:9]=='h0 && nIORQ==1 && nRD==0 && nWR==1) ? RomData :
                (A[15:9]=='h1 && nIORQ==1 && nRD==0 && nWR==1) ? RamData :
                {8{1'bz}};

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate A-Z80 CPU module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
z80_top_direct_n z80_( .*, .nRESET(reset_stable), .CLK(true_clk) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 512b of ROM memory that is preloaded with our Z80 boot code
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rom rom_( .address(A[8:0]), .clock(clk), .q(RomData[7:0]) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 512b of RAM memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ram ram_( .address(A[8:0]), .clock(clk), .data(D[7:0]), .wren(we), .q(RamData[7:0]) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate UART module
// UART uses negative signalling logic, so invert control inputs
// IO Map:
//   0000 - 00FF  Write a byte to UART
//   0200 - 02FF  Get UART busy status in bit 0
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uart_io uart_io_( .*, .reset(!reset_stable), .Address(A[15:8]), .Data(D[7:0]), .IORQ(!nIORQ), .RD(!nRD), .WR(!nWR) );

endmodule
