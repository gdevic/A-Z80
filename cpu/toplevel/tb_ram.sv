// RAM Model
module ram (Address, Data, CS, WE, OE);

// Set this to 1 if you want debug printout on each RAM access
int debug = 0;

input [15:0] Address;
inout [7:0] Data;
input CS, WE, OE;

reg [7:0] Mem [0:1<<16];

assign Data = (!CS && !OE) ? Mem[Address] : {8{1'bz}};

// Read the initial content of the RAM memory from a file
initial begin : init
    // Read the "boot" code (address 0), it has to be present
    $readmemh("ram.hex", Mem, 0);
    // Read an "executable" (in BDOS terms) starting at the address of 100h
    $readmemh("ram100.hex", Mem, 256);
end : init

always @(!CS && !OE) begin
    if (debug)
        $strobe("[ram] RD A=%H, D=%H", Address, Data);
end

always @(CS or WE)
    if (!CS && !WE) begin
        if (debug)
            $strobe("[ram] WR A=%H, D=%H", Address, Data);
        Mem[Address] = Data;
    end

always @(WE or OE)
    if (!WE && !OE)
        $display("[ram] error: OE and WE both active!");

endmodule
