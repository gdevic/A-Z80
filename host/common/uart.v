// Simple transmit-only UART model

module uart #(
    parameter BAUD = 115200,
    parameter IN_CLOCK = 50000000)
(
    // Outputs
    output wire busy,          // Set when busy transmitting
    output reg uart_tx,        // UART transmit wire
    // Inputs
    input wire wr,             // Write a new byte to transmit
    input wire [7:0] data,     // 8-bit data
    input wire clk,
    input wire reset
);

reg [3:0] bitcount;
reg [8:0] shifter;

assign busy = |bitcount[3:1];
wire sending = |bitcount;

// Calculate UART clock based on the input clock
reg [28:0] d;
wire [28:0] inc = d[28] ? (BAUD) : (BAUD - IN_CLOCK);
wire [28:0] delta = d + inc;

always @(posedge clk)
begin
    if (reset)
    begin
        d = 0;
    end else
    begin
        d = delta;
    end
end

wire ser_clk = ~d[28]; // UART clock

always @(posedge clk) begin
    if (reset)
    begin
        uart_tx <= 1;
        bitcount <= 0;
        shifter <= 0;
    end else
    begin
        if (wr & ~busy)
        begin
            $strobe("[UART] %c", data[7:0]);
            shifter <= { data[7:0], 1'h0 };
            bitcount <= 4'd11; // 1 + 8 + 2
        end

        if (sending & ser_clk)
        begin
            { shifter, uart_tx } <= { 1'h1, shifter };
            bitcount <= bitcount - 4'd1;
        end
    end
end

endmodule
