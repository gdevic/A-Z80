//============================================================================
// Implementation of the ZX Spectrum keyboard input generator
// This module takes scan-codes from the PS/2 keyboard input and sets
// corresponding ZX key bitfields which are read by IN (FE) instructions.
//
// This code was mostly ported from Mike Stirling's emulator code in VHDL
//============================================================================
module zx_keyboard
(
    input wire clk,
    input wire reset,           // Reset (negative logic)

    // Output ZX-specific keyboard codes when requested by the ULA access
    input wire [15:0] A,        // Address bus
    output wire [4:0] key_row,  // Output the state of a requested row of keys

    // Input key scan codes from the PS/2 keyboard
    input wire [7:0] scan_code, // PS/2 scan-code
    input wire scan_code_ready, // Active for 1 clock: a scan code is ready
    input wire scan_code_error  // Error receiving PS/2 keyboard data
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [4:0] keys [0:7];     // 8 rows of 5 bits each

reg released;
reg extended;

// Output requested row of keys continously
always_comb
begin
    case (A[15:8])
        8'b11111110: key_row = keys[0];
        8'b11111101: key_row = keys[1];
        8'b11111011: key_row = keys[2];
        8'b11110111: key_row = keys[3];
        8'b11101111: key_row = keys[4];
        8'b11011111: key_row = keys[5];
        8'b10111111: key_row = keys[6];
        8'b01111111: key_row = keys[7];
    default:
        key_row = 5'b1;    
    endcase
end

always @(posedge clk or negedge reset)
begin
    if (!reset) begin
        released <= 0;
        extended <= 0;

        keys[0] <= '1;
        keys[1] <= '1;
        keys[2] <= '1;
        keys[3] <= '1;
        keys[4] <= '1;
        keys[5] <= '1;
        keys[6] <= '1;
        keys[7] <= '1;
    end else
    if (scan_code_ready) begin
        if (scan_code==8'hE0)
            extended <= 1;
        else if (scan_code==8'hF0)
            released <= 1;
        else begin
            // Cancel release/extended flags for the next clock
            extended <= 0;
            released <= 0;

            // For each PS/2 scan-code, set the ZX keyboard matrix state
            // 'released' contains 0 when a key is pressed; 1 otherwise
            case (scan_code)
                8'h14:  keys[0][0] <= released;     // CAPS SHIFT = Left or right Ctrl
                8'h12:  keys[0][0] <= released;     // CAPS SHIFT = Left Shift
                8'h59:  keys[0][0] <= released;     // CAPS SHIFT = Right Shift
                8'h1A:  keys[0][1] <= released;     // Z
                8'h22:  keys[0][2] <= released;     // X
                8'h21:  keys[0][3] <= released;     // C
                8'h2A:  keys[0][4] <= released;     // V

                8'h1C:  keys[1][0] <= released;     // A
                8'h1B:  keys[1][1] <= released;     // S
                8'h23:  keys[1][2] <= released;     // D
                8'h2B:  keys[1][3] <= released;     // F
                8'h34:  keys[1][4] <= released;     // G

                8'h15:  keys[2][0] <= released;     // Q
                8'h1D:  keys[2][1] <= released;     // W
                8'h24:  keys[2][2] <= released;     // E
                8'h2D:  keys[2][3] <= released;     // R
                8'h2C:  keys[2][4] <= released;     // T

                8'h16:  keys[3][0] <= released;     // 1
                8'h1E:  keys[3][1] <= released;     // 2
                8'h26:  keys[3][2] <= released;     // 3
                8'h25:  keys[3][3] <= released;     // 4
                8'h2E:  keys[3][4] <= released;     // 5

                8'h45:  keys[4][0] <= released;     // 0
                8'h46:  keys[4][1] <= released;     // 9
                8'h3E:  keys[4][2] <= released;     // 8
                8'h3D:  keys[4][3] <= released;     // 7
                8'h36:  keys[4][4] <= released;     // 6

                8'h4D:  keys[5][0] <= released;     // P
                8'h44:  keys[5][1] <= released;     // O
                8'h43:  keys[5][2] <= released;     // I
                8'h3C:  keys[5][3] <= released;     // U
                8'h35:  keys[5][4] <= released;     // Y

                8'h5A:  keys[6][0] <= released;     // ENTER
                8'h4B:  keys[6][1] <= released;     // L
                8'h42:  keys[6][2] <= released;     // K
                8'h3B:  keys[6][3] <= released;     // J
                8'h33:  keys[6][4] <= released;     // H

                8'h29:  keys[7][0] <= released;     // SPACE
                8'h11:  keys[7][1] <= released;     // SYMBOL SHIFT (Red) = Left and right Alt
                8'h3A:  keys[7][2] <= released;     // M
                8'h31:  keys[7][3] <= released;     // N
                8'h32:  keys[7][4] <= released;     // B

                8'h66:  begin                       // BACKSPACE
                        keys[0][0] <= released;
                        keys[4][0] <= released;
                        end
            endcase
        end
    end
end

endmodule
