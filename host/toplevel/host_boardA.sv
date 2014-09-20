//============================================================================
// Host design containing A-Z80 and a few peripherials
//
// This module is designed to run on "Board B", which is a FPGA board
// with EP2C8Q208C8N. It's also called "Red Core". Got from eBay/China.
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

// Debounce the reset push-button
reg reset_stable = 0;
always @ (posedge slow_clk) begin
    reset_stable <= reset;
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
// RamData is a data writer from the RAM module
wire [7:0] RamData;
wire we;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate A-Z80 CPU module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
z80_top_direct_n z80_( .*, .nRESET(reset_stable), .CLK(slow_clk) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate UART module
// UART uses negative signalling logic, so invert control inputs
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uart_io uart_io_( .*, .reset(!reset_stable), .Address(A[15:8]), .Data(D[7:0]), .IORQ(!nIORQ), .RD(!nRD), .WR(!nWR) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 1Kb of RAM memory with memory select and 3-state data bus
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// 1K is addressable with bits [9:0]
// 1K *blocks* are selectable with bits [15:10]
assign D[7:0] = (A[15:10]=='0 && nMREQ==0 && nRD==0 && nWR==1) ? RamData  : {8{1'bz}};
assign we = A[15:10]=='0 && nMREQ==0 && nRD==1 && nWR==0;

ram ram_( .address(A[9:0]), .clock(clk), .data(D[7:0]), .wren(we), .q(RamData[7:0]) );

endmodule
