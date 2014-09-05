// I/O Model
module io (Address, Data, CS, WE, OE);

// Set to 1 to have text output to the file "iolog.txt"
int iolog = 1;

// Set to 1 if you want debug printout on each IO access
int debug = 0;

input [15:0] Address;
inout [7:0] Data;
input CS, WE, OE;

reg [7:0] IO [0:1<<16];

// Return data at the specified IO address; return 0xFF for non-initialized IO
assign Data = (!CS && !OE) ? (IO[Address]==8'hxx) ? 8'hFF : IO[Address] : {8{1'bz}};

// When printing a text through this IO service, work around the
// fact that IO lasts 2T so we would be printing on each clock
// and thus see duplicate characters
int even = 0;
int fd;

// Read the initial content of the IO map from file
initial begin : init
    $readmemh("io.hex", IO);
    // If logging to a file was enabled, clear the file so we can append
    if (iolog) begin
        fd = $fopen("iolog.txt", "wb");
        $fclose(fd);
    end
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
            // Print only every 2T
            if (even) begin
                $write("%c", Data);
                // If logging to a file was enabled, append a character
                if (iolog) begin
                    fd = $fopen("iolog.txt", "ab");
                    $fwrite(fd, "%c", Data);
                    $fclose(fd);
                end
            end
            even = even ^ 1;
        end
        IO[Address] = Data;
    end

always @(WE or OE)
    if (!WE && !OE)
        $display("[IO] error: OE and WE both active!");

endmodule
