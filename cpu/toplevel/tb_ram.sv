// RAM Model
module ram (Address, Data, CS, WE, OE);

input [15:0] Address;
inout [7:0] Data;
input CS, WE, OE;

reg [7:0] Mem [0:1<<16];

assign Data = (!CS && !OE) ? Mem[Address] : {8{1'bz}};

// Read the initial content of the RAM memory from file
initial begin : init
    $readmemh("ram.hex", Mem);
end : init

always @(!CS && !OE) begin
    $strobe("[ram] RD A=%H, D=%H", Address, Data);
end

always @(CS or WE)
    if (!CS && !WE) begin
        $strobe("[ram] WR A=%H, D=%H", Address, Data);
        Mem[Address] = Data;
    end

always @(WE or OE)
    if (!WE && !OE)
        $display("[ram] error: OE and WE both active!");

endmodule
