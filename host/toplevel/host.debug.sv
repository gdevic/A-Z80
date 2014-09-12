//============================================================================
// Host design containing A-Z80 and a few peripherials
//============================================================================
module host(
    input reg clk,
    input reg reset,
    output wire uart_tx,

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

wire nM1;
wire nMREQ;
wire nRFSH;
wire nRD;
wire nWR;
wire nIORQ;
wire nHALT;
wire nBUSACK;

wire nWAIT = 0;
wire nINT = 0;
wire nNMI = 0;
wire nBUSRQ = 0;

wire [15:0] A;
wire [7:0] D;

//wire CPUCLK;                // 10MHz from PLL to CPU
//wire locked;                // PLL has locked the output frequency

//assign tp_pll = CPUCLK;
//assign tp_locked = locked;
//assign tp_clk = clk;
//assign tp_nm1 = nM1;

`define CBITS 8                 // 50 MHz divided by 2^8 gives about 200 KHz
reg [`CBITS-1:0] cnt = 0;       // counter
reg slow = 0;                   // slow pulses
reg slow_clk = 0;               // slow clock
  
always @ (posedge clk) begin
    cnt <= cnt + 1;
    slow <= (cnt == 0);             // one pulse per cnt cycle
    if (slow) begin
        slow_clk <= ~slow_clk;      // toggle the output slow clock
    end
end

reg reset_stable = 0;
always @ (posedge slow_clk) begin
    reset_stable <= ~reset;
end

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

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate A-Z80 CPU module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire [7:0] dummy;
assign dummy[7:0] = (nMREQ==1 && nRD==1 && nWR==0) ? 8'h00  : {8{1'bz}};
z80_top_direct z80_( .*, .nRESET(reset_stable), .CLK(slow_clk), .D(dummy[7:0]) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate PLL providing 10MHz to the CPU
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//pll pll_( .inclk0(clk), .c0(CPUCLK), .locked(locked) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate UART module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uart_io uart_io_( .*, .reset(reset_stable), .Address(A[15:8]), .Data(D[7:0]), .IORQ(nIORQ), .RD(nRD), .WR(nWR) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 1Kb of RAM memory with memory select and 3-state data bus
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire [7:0] RamData;
wire we;

// 1K is addressable with bits [9:0]
// 1K *blocks* are selectable with bits [15:10]
assign D[7:0] = (A[15:10]=='0 && nMREQ==1 && nRD==1 && nWR==0) ? RamData  : {8{1'bz}};
assign we = A[15:10]=='0 && nMREQ==1 && nRD==0 && nWR==1;

ram ram_( .address(A[9:0]), .clock(clk), .data(D[7:0]), .wren(we), .q(RamData[7:0]) );

endmodule
