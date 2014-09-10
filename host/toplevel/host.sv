//============================================================================
// Host design containing A-Z80 and a few peripherials
//============================================================================
module host(
    input wire clk,
    input wire reset,
    output wire uart_tx
);

wire nM1;
wire nMREQ;
wire nIORQ;
wire nRD;
wire nWR;
wire nRFSH;
wire nHALT;
wire nBUSACK;

wire nWAIT = 0;
wire nINT = 0;
wire nNMI = 0;
wire nBUSRQ = 0;
wire nRESET = !reset;

wire [15:0] A;
wire [7:0] D;


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate UART module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uart_io uart_io_( .*, .Address(A[15:8]), .Data(D[7:0]), .IORQ(nIORQ), .RD(nRD), .WR(nWR) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate A-Z80 CPU module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire CPUCLK;

z80_top_direct z80_( .*, .CLK(CPUCLK) );

pll pll_( .inclk0(clk), .c0(CPUCLK) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 1Kb of RAM memory with memory select and 3-state data bus
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire [7:0] RamData;
wire we;

assign D[7:0] = (A[15:8]=='0 && nMREQ==1 && nRD==1 && nWR==0) ? RamData  : 8'bz;
assign we = A[15:8]=='0 && nMREQ==1 && nRD==0 && nWR==1;

ram ram_(
    .address (A[9:0]),
    .clock (clk),
    .data (D[7:0]),
    .wren (we),
    .q (RamData[7:0]) );
    
endmodule
