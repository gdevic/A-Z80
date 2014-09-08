// Interrupt test
// The purpose of this model is to inject an interrupt opcode on the bus
module iorq (Data, M1, IORQ);

// Set to 1 if you want debug printout on each IO access
int debug = 0;

inout [7:0] Data;
input M1, IORQ;

// Define the opcode to be sent through IORQ (FF=RST38, C7=RST0,...)
//`define OPCODE  8'hFF
//`define OPCODE  8'hC7
// Test IM2 by pushing 0x80 which is a vector in this mode
`define OPCODE  8'h80

// Return data on an IORQ condition
assign Data = (!M1 && !IORQ) ? `OPCODE : {8{1'bz}};

int fd;

always @(!M1 && !IORQ) begin
    if (debug)
        $strobe("[IORQ] DB=%H", `OPCODE);
end

endmodule
