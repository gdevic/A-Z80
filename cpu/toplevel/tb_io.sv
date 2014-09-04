// I/O Model
module io (Address, Data, CS, WE, OE);

// Set this to 1 if you want debug printout on each IO access
int debug = 0;

input [15:0] Address;
inout [7:0] Data;
input CS, WE, OE;

reg [7:0] IO [0:1<<16];

assign Data = (!CS && !OE) ? IO[Address] : {8{1'bz}};

// Read the initial content of the IO map from file
initial begin : init
    $readmemh("io.hex", IO);
end : init

always @(!CS && !OE) begin
    if (debug)
        $strobe("[IO] IN A=%H, D=%H", Address, Data);
end

always @(CS or WE)
    if (!CS && !WE) begin
        if (debug)
            $strobe("[IO] OUT A=%H, D=%H", Address, Data);
        if (Address==2222) begin
            $write("%c", Data);
        end
        IO[Address] = Data;
    end

always @(WE or OE)
    if (!WE && !OE)
        $display("[IO] error: OE and WE both active!");

endmodule
