//============================================================================
// Host design containing A-Z80 and a few peripherials
//
// This module defines a host board to be run on an FPGA.
//
//============================================================================
// Default CPU slowdown for the FPGA synthesis is
// 50 MHz divided by 2^8 / 2 gives about 100 KHz
module host #(parameter CPU_SLOWDOWN = 8)
(
    input wire clk,
    input wire reset,
    output wire uart_tx,

    // Expose various test points
    output wire tp_reset,
    output wire tp_slow_clk,
    output wire tp_nM1,
    output wire tp_nMREQ,
    output wire tp_nRFSH,
    output wire tp_nRD,
    output wire tp_nWR,
    output wire tp_nIORQ,
    output wire tp_A0,
    output wire tp_A1,
    output wire tp_A2,
    output wire tp_A3,
    output wire tp_D0,
    output wire tp_D1,
    output wire tp_D2,
    output wire tp_D3
);

// ----------------- CLOCKS AND RESET -----------------
// Feed the CPU a slower clock from a counter
reg [CPU_SLOWDOWN-1:0] cnt = 0;     // slowdown counter
reg slow = 0;                       // slow pulses
reg slow_clk = 0;                   // slow clock

always @ (posedge clk) begin
    cnt <= cnt + 1;
    slow <= (cnt == 0);             // one pulse per cnt cycle
    if (slow) begin
        slow_clk <= ~slow_clk;      // toggle the output slow clock
    end
end

// Test: double the clock so the logic analyzer can store each phase
// (SignalTap only triggers on a rising clock edge)
reg true_clk = 0;
always @ (posedge slow_clk) begin
    true_clk <= ~true_clk;
end

// Debounce the reset push-button using a shift-register
reg reset_stable;
reg [20:0] r;
always @ (posedge slow_clk) begin
    r[20:0] <= {r[19:0], reset};
    if (r[20:0]=={20{1'b0}})
        reset_stable <= 1'b0;
    else if (r[20:0]=={20{1'b1}})
        reset_stable <= 1'b1;
    else
        reset_stable <= reset_stable;
end

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

// ----------------- TEST PINS -----------------
assign tp_reset = reset_stable;
assign tp_slow_clk = slow_clk;
assign tp_nM1 = nM1;
assign tp_nMREQ = nMREQ;
assign tp_nRFSH = nRFSH;
assign tp_nRD = nRD;
assign tp_nWR = nWR;
assign tp_nIORQ = nIORQ;
assign tp_A0 = A[0];
assign tp_A1 = A[1];
assign tp_A2 = A[2];
assign tp_A3 = A[3];
assign tp_D0 = D[0];
assign tp_D1 = D[1];
assign tp_D2 = D[2];
assign tp_D3 = D[3];

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
