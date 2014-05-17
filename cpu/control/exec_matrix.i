// Regular instructions
if (pla[97]) begin
    $display("pla[97] di/ei");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[95]) begin
    $display("pla[95] halt");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[92]) begin
    $display("pla[92] scf");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[89]) begin
    $display("pla[89] ccf");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[81]) begin
    $display("pla[81] cpl");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[77]) begin
    $display("pla[77] daa");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[69]) begin
    $display("pla[69] add hl,ss");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin                       end
    if (M2 && T2) begin                       end
    if (M2 && T3) begin                       end
    if (M2 && T4) begin             nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin             nextM=1; setM1=1;  end
end

if (pla[66] && !(pla[53] || pla[105])) begin
    $display("pla[66] inc/dec r");
// PLA75 is set for decrement and reset for increment. Route that line for SBC/ADC ALU operation to perform a decrement or increment. Since the timings are the same, we use a single PLA entry for both functions.
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[65]&& !(pla[52] || pla[104])) begin
    $display("pla[65] add/sub/and/or/xor/cmp a,r");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[64]) begin
    $display("pla[64] add/sub/and/or/xor/cmp a,n");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[61] && !(pla[59] || pla[103] || pla[58] || pla[102] || pla[95])) begin
    $display("pla[61] ld r,r'");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[59] && !pla[95]) begin
    $display("pla[59] ld (hl),r");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMWrite=1;            end
    if (M2 && T2) begin fMWrite=1;            end
    if (M2 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[58] && !pla[95]) begin
    $display("pla[58] ld r,(hl)");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[56]) begin
    $display("pla[56] rst");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin             nextM=1;  end
    if (M2 && T1) begin fMWrite=1;            end
    if (M2 && T2) begin fMWrite=1;            end
    if (M2 && T3) begin fMWrite=1;  nextM=1;  end
    if (M3 && T1) begin fMWrite=1;            end
    if (M3 && T2) begin fMWrite=1;            end
    if (M3 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[53]) begin
    $display("pla[53] inc/dec (hl)");
// PLA75 is set for decrement and reset for increment. Route that line for SBC/ADC ALU operation to perform a decrement or increment. Since the timings are the same, we use a single PLA entry for both functions.
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;             end
    if (M2 && T4) begin             nextM=1;  end
    if (M3 && T1) begin fMWrite=1;            end
    if (M3 && T2) begin fMWrite=1;            end
    if (M3 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[52]) begin
    $display("pla[52] add/sub/and/or/xor/cp (hl)");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[51]) begin
    $display("pla[51] ED");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[50]) begin
    $display("pla[50] ld (hl),n");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMWrite=1;            end
    if (M3 && T2) begin fMWrite=1;            end
    if (M3 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[48]) begin
    $display("pla[48] jr ss,e");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1; setM1ss=1; end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1; setM1=1;  end
end

if (pla[47]) begin
    $display("pla[47] jr e");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1; setM1=1;  end
end

if (pla[45]) begin
    $display("pla[45] ret cc");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin             nextM=1; setM1cc=1; end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;             end
    if (M2 && T4) begin fMRead=1;             end
    if (M2 && T5) begin fMRead=1;             end
    if (M2 && T6) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[43]) begin
    $display("pla[43] jp cc,nn");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[42]) begin
    $display("pla[42] call cc,nn");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   setM1cc=1; end
    if (M3 && T4) begin             nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1;  end
    if (M5 && T1) begin fMWrite=1;            end
    if (M5 && T2) begin fMWrite=1;            end
    if (M5 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[39]) begin
    $display("pla[39] ex af,af'");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[38] && pla[13]) begin
    $display("pla[38] ld (nn),a");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[38] && !pla[13]) begin
    $display("pla[38] ld a,(nn)");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1;  end
    if (M4 && T1) begin fMRead=1;             end
    if (M4 && T2) begin fMRead=1;             end
    if (M4 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[37] && pla[28]) begin
    $display("pla[37] out (n),a");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fIOWrite=1;           end
    if (M3 && T2) begin fIOWrite=1;           end
    if (M3 && T3) begin fIOWrite=1;           end
    if (M3 && T4) begin fIOWrite=1; nextM=1; setM1=1;  end
end

if (pla[37] && !pla[28]) begin
    $display("pla[37] in a,(n)");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fIORead=1;            end
    if (M3 && T2) begin fIORead=1;            end
    if (M3 && T3) begin fIORead=1;            end
    if (M3 && T4) begin fIORead=1;  nextM=1; setM1=1;  end
end

if (pla[35]) begin
    $display("pla[35] ret");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[30] && pla[13]) begin
    $display("pla[30] ld (nn),hl");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1;  end
    if (M5 && T1) begin fMWrite=1;            end
    if (M5 && T2) begin fMWrite=1;            end
    if (M5 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[30] && !pla[13]) begin
    $display("pla[30] ld hl,(nn)");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1;  end
    if (M4 && T1) begin fMRead=1;             end
    if (M4 && T2) begin fMRead=1;             end
    if (M4 && T3) begin fMRead=1;   nextM=1;  end
    if (M5 && T1) begin fMRead=1;             end
    if (M5 && T2) begin fMRead=1;             end
    if (M5 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[29]) begin
    $display("pla[29] jp nn");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[26]) begin
    $display("pla[26] djnz e");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin             nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1; setM1bz=1; end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1; setM1=1;  end
end

if (pla[25]) begin
    $display("pla[25] rlca/rla/rrca/rra");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[24]) begin
    $display("pla[24] call nn");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;             end
    if (M3 && T4) begin             nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1;  end
    if (M5 && T1) begin fMWrite=1;            end
    if (M5 && T2) begin fMWrite=1;            end
    if (M5 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[23] && pla[16]) begin
    $display("pla[23] push qq");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin             nextM=1;  end
    if (M2 && T1) begin fMWrite=1;            end
    if (M2 && T2) begin fMWrite=1;            end
    if (M2 && T3) begin fMWrite=1;  nextM=1;  end
    if (M3 && T1) begin fMWrite=1;            end
    if (M3 && T2) begin fMWrite=1;            end
    if (M3 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[23] && !pla[16]) begin
    $display("pla[23] pop qq");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[22]) begin
    $display("pla[22] CB without IX/IY");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[17] && !(pla[40] || pla[50])) begin
    $display("pla[17] ld r,n");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[10]) begin
    $display("pla[10] ex (sp),hl");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;             end
    if (M3 && T4) begin             nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1;  end
    if (M5 && T1) begin fMWrite=1;            end
    if (M5 && T2) begin fMWrite=1;            end
    if (M5 && T3) begin fMWrite=1;            end
    if (M5 && T4) begin                       end
    if (M5 && T5) begin             nextM=1; setM1=1;  end
end

if (pla[9]) begin
    $display("pla[9] inc/dec ss");
// PLA14 is set for decrement and reset for increment. Route that line for SBC/ADC ALU operation to perform a decrement or increment. Since the timings are the same, we use a single PLA entry for both functions.
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin                       end
    if (M1 && T6) begin             nextM=1; setM1=1;  end
end

if (pla[8] && pla[13]) begin
    $display("pla[8] ld (rr),a");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMWrite=1;            end
    if (M2 && T2) begin fMWrite=1;            end
    if (M2 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[8] && !pla[13]) begin
    $display("pla[8] ld a,(rr)");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[7]) begin
    $display("pla[7] ld rr,nn");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[6]) begin
    $display("pla[6] jp hl");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[5]) begin
    $display("pla[5] ld sp,hl");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin                       end
    if (M1 && T6) begin             nextM=1; setM1=1;  end
end

if (pla[3]) begin
    $display("pla[3] IX/IY");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[2]) begin
    $display("pla[2] ex de,hl");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[1]) begin
    $display("pla[1] exx");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

// Instructions with CB-byte prefix
if (pla[74]) begin
    $display("pla[74] set");
    if (M1 && T1) begin                       end
    if (M1 && T2) begin                       end
    if (M1 && T3) begin                       end
    if (M1 && T4) begin                       end
end

if (pla[73]) begin
    $display("pla[73] res");
    if (M1 && T1) begin                       end
    if (M1 && T2) begin                       end
    if (M1 && T3) begin                       end
    if (M1 && T4) begin                       end
end

if (pla[72]) begin
    $display("pla[72] bit");
    if (M1 && T1) begin                       end
    if (M1 && T2) begin                       end
    if (M1 && T3) begin                       end
    if (M1 && T4) begin                       end
end

if (pla[70]) begin
    $display("pla[70] rotate/shift");
    if (M1 && T1) begin                       end
    if (M1 && T2) begin                       end
    if (M1 && T3) begin                       end
    if (M1 && T4) begin                       end
end

if (pla[62]) begin
    $display("pla[62] Every CB without IX/IY");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;             end
    if (M2 && T4) begin             nextM=1;  end
    if (M3 && T1) begin fMWrite=1;            end
    if (M3 && T2) begin fMWrite=1;            end
    if (M3 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[54] || pla[49]) begin
    $display("pla[54] Every CB with IX/IY");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;             end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1;  end
    if (M4 && T1) begin fMRead=1;             end
    if (M4 && T2) begin fMRead=1;             end
    if (M4 && T3) begin fMRead=1;             end
    if (M4 && T4) begin             nextM=1;  end
    if (M5 && T1) begin fMWrite=1;            end
    if (M5 && T2) begin fMWrite=1;            end
    if (M5 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

// Instructions with ED-byte prefix
if (pla[96]) begin
    $display("pla[96] im n");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[83]) begin
    $display("pla[83] ld a,i/ld a,r");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin             nextM=1; setM1=1;  end
end

if (pla[82]) begin
    $display("pla[82] neg");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1; setM1=1;  end
end

if (pla[68]) begin
    $display("pla[68] adc/sbc hl,ss");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin                       end
    if (M2 && T2) begin                       end
    if (M2 && T3) begin                       end
    if (M2 && T4) begin             nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin             nextM=1; setM1=1;  end
end

if (pla[67]) begin
    $display("pla[67] in r,(c)");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin                       end
    if (M2 && T2) begin                       end
    if (M2 && T3) begin                       end
    if (M2 && T4) begin             nextM=1; setM1=1;  end
end

if (pla[57]) begin
    $display("pla[57] ld i,a/ld r,a");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin             nextM=1; setM1=1;  end
end

if (pla[46]) begin
    $display("pla[46] reti/retn");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[34]) begin
    $display("pla[34] out (c),r");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin                       end
    if (M2 && T2) begin                       end
    if (M2 && T3) begin                       end
    if (M2 && T4) begin             nextM=1; setM1=1;  end
end

if (pla[31]) begin
    $display("pla[31] ld rr,(nn)/(nn),rr");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1;  end
    if (M5 && T1) begin fMWrite=1;            end
    if (M5 && T2) begin fMWrite=1;            end
    if (M5 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[21]) begin
    $display("pla[21] inx/inxr");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin                       end
    if (M1 && T6) begin             nextM=1;  end
    if (M2 && T1) begin                       end
    if (M2 && T2) begin                       end
    if (M2 && T3) begin             nextM=1;  end
    if (M3 && T1) begin fMWrite=1;            end
    if (M3 && T2) begin fMWrite=1;            end
    if (M3 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[20]) begin
    $display("pla[20] outx/otxr");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;             end
    if (M1 && T5) begin             nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin             nextM=1; setM1=1;  end
end

if (pla[15]) begin
    $display("pla[15] rrd/rld");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin             nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[12]) begin
    $display("pla[12] ldi/ldir/ldd/lddr");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMWrite=1;            end
    if (M3 && T2) begin fMWrite=1;            end
    if (M3 && T3) begin fMWrite=1;            end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1; setM1=1;  end
end

if (pla[11]) begin
    $display("pla[11] cpi/cpir/cpd/cpdr");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1; setM1=1;  end
end

// Regular instructions with IX/IY prefix
if (pla[49]) begin
    $display("pla[49] CB with IX/IY");
end

if (pla[40]) begin
    $display("pla[40] ld (ix+d),n");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;             end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[102] && !pla[95]) begin
    $display("pla[102] ld r,(ix+d)");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1;  end
    if (M4 && T1) begin fMRead=1;             end
    if (M4 && T2) begin fMRead=1;             end
    if (M4 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[103] && !pla[95]) begin
    $display("pla[103] ld (ix+d),r");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[104]) begin
    $display("pla[104] add/sub/and/or/xor/cp (ix+d)");
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1;  end
    if (M4 && T1) begin fMRead=1;             end
    if (M4 && T2) begin fMRead=1;             end
    if (M4 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

if (pla[105]) begin
    $display("pla[105] inc/dec (ix+d)");
// PLA75 is set for decrement and reset for increment. Route that line for SBC/ADC ALU operation to perform a decrement or increment. Since the timings are the same, we use a single PLA entry for both functions.
    if (M1 && T1) begin fFetch=1;             end
    if (M1 && T2) begin fFetch=1;             end
    if (M1 && T3) begin fFetch=1;             end
    if (M1 && T4) begin fFetch=1;   nextM=1;  end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin                       end
    if (M3 && T2) begin                       end
    if (M3 && T3) begin                       end
    if (M3 && T4) begin                       end
    if (M3 && T5) begin             nextM=1;  end
    if (M4 && T1) begin fMRead=1;             end
    if (M4 && T2) begin fMRead=1;             end
    if (M4 && T3) begin fMRead=1;             end
    if (M4 && T4) begin             nextM=1;  end
    if (M5 && T1) begin fMWrite=1;            end
    if (M5 && T2) begin fMWrite=1;            end
    if (M5 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

// ALU entries
if (pla[88] && (pla[65] || pla[64] || pla[52] || pla[104])) begin
    $display("pla[88] 101 (XOR)");
end

if (pla[86] && (pla[65] || pla[64] || pla[52] || pla[104])) begin
    $display("pla[86] 110 (OR)");
end

if (pla[85] && (pla[65] || pla[64] || pla[52] || pla[104])) begin
    $display("pla[85] 100 (AND)");
end

if (pla[84] && (pla[65] || pla[64] || pla[52] || pla[104])) begin
    $display("pla[84] 000 (ADD)");
end

if (pla[80] && (pla[65] || pla[64] || pla[52] || pla[104])) begin
    $display("pla[80] 001 (ADC)");
end

if (pla[79] && (pla[65] || pla[64] || pla[52] || pla[104])) begin
    $display("pla[79] 011 (SBC)");
end

if (pla[78] && (pla[65] || pla[64] || pla[52] || pla[104])) begin
    $display("pla[78] 010 (SUB)");
end

if (pla[76] && (pla[65] || pla[64] || pla[52] || pla[104])) begin
    $display("pla[76] 111 (CP)");
end

// Individual opcode bits
if (pla[101]) begin
    $display("pla[101] opcode[4]");
end

if (pla[100]) begin
    $display("pla[100] opcode[3]");
end

if (pla[99]) begin
    $display("pla[99] opcode[0]");
end

// Special signals (not instructions)
if (pla[91]) begin
    $display("pla[91] _blockio(20,21)");
// This signal goes along block IN/OUT instructions.
end

if (pla[75]) begin
    $display("pla[75] _dec(53,66,105)");
// This signal specifies a decrement operation for PLA 53, 66 and 105. Otherwise, it is an increment.
end

if (pla[55]) begin
    $display("pla[55] _cbhl(70,72,73,74)");
// This signal specifies (HL) addressing for all CB-table instructions, PLA entries 70, 72, 73, 74.
end

if (pla[44]) begin
    $display("pla[44] _cb");
// This signal specifies a regular CB opcode (ignoring IX/IY).
end

if (pla[33]) begin
    $display("pla[33] _store(31)");
// This signal specifies whether the register is being loaded or stored to memory for PLA entry 31.
end

if (pla[28]) begin
    $display("pla[28] _out(37)");
// This signal specifies the OUT operation for PLA 37. Otherwise, it is operation.
end

if (pla[27]) begin
    $display("pla[27] _io(34,67)");
// This signal goes along individual IN/OUT instructions in the ED table.
end

if (pla[16]) begin
    $display("pla[16] _push(23)");
// This signal specifies a PUSH operation for PLA23. Otherwise, it is a POP operation.
end

if (pla[14]) begin
    $display("pla[14] _dec(9)");
// This signal specifies a decrement operation for PLA 9. Otherwise, it is an increment.
end

if (pla[13]) begin
    $display("pla[13] _dir(8,30,38)");
// This signal specifies whether the value is being loaded or stored for PLA entries 8, 30 and 38.
end

if (pla[4]) begin
    $display("pla[4] _useir(57,83)");
// This signal goes along instructions that access I and R register (PLA 57 and 83).
end

if (pla[0]) begin
    $display("pla[0] _break(11,12,20,21)");
// This signal specifies *not* to repeat block instructions.
end

// Duplicate PLA entries
if (pla[98]) begin
    $display("pla[98] out (*),a/in a,(*)");
end

if (pla[94]) begin
    $display("pla[94] ldi/ldir/ldd/lddr");
end

if (pla[93]) begin
    $display("pla[93] cpi/cpir/cpd/cpdr");
end

if (pla[90]) begin
    $display("pla[90] djnz *");
end

if (pla[87]) begin
    $display("pla[87] ld a,i/ld a,r");
end

if (pla[71]) begin
    $display("pla[71] rlca/rla/rrca/rra");
end

if (pla[63]) begin
    $display("pla[63] ld r,*");
end

if (pla[60]) begin
    $display("pla[60] rrd/rld");
end

if (pla[41]) begin
    $display("pla[41] IX/IY");
end

if (pla[36]) begin
    $display("pla[36] ld(rr),a/a,(rr)");
end

if (pla[32]) begin
    $display("pla[32] ld(rr),a/a,(rr)");
end

if (pla[19]) begin
    $display("pla[19] cpi/cpir/cpd/cpdr");
end

if (pla[18]) begin
    $display("pla[18] ldi/ldir/ldd/lddr");
end

// Reserved PLA entries for future use
if (pla[106]) begin
    $display("pla[106] reserved1");
end

if (pla[107]) begin
    $display("pla[107] reserved2");
end

