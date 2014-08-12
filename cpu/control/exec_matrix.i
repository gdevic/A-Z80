// 16-bit Load Group
if (pla[7]) begin
    $display("pla[7] ld rr,nn");
    if (M1 && T1) begin                       end
    if (M1 && T2) begin                       end
    if (M1 && T3) begin                       end
    if (M1 && T4) begin             contM2=1; end
    if (M2 && T1) begin fMRead=1;             ctl_reg_sys_sel=`SYS_REG_PC; end
    if (M2 && T2) begin fMRead=1;             ctl_reg_sys_sel=`SYS_REG_PC; end
    if (M2 && T3) begin fMRead=1;   nextM=1;  ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01; end
    if (M3 && T1) begin fMRead=1;             ctl_reg_sys_sel=`SYS_REG_PC; end
    if (M3 && T2) begin fMRead=1;             ctl_reg_sys_sel=`SYS_REG_PC; end
    if (M3 && T3) begin fMRead=1;   nextM=1; setM1=1;  ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10; end
end

if (pla[23] && pla[16]) begin
    $display("pla[23] push qq");
    if (M1 && T1) begin                       end
    if (M1 && T2) begin                       end
    if (M1 && T3) begin                       end
    if (M1 && T4) begin             contM1=1; end
    if (M2 && T1) begin             nextM=1;  end
    if (M3 && T1) begin fMWrite=1;            end
    if (M3 && T2) begin fMWrite=1;            end
    if (M3 && T3) begin fMWrite=1;  nextM=1;  end
    if (M4 && T1) begin fMWrite=1;            end
    if (M4 && T2) begin fMWrite=1;            end
    if (M4 && T3) begin fMWrite=1;  nextM=1; setM1=1;  end
end

if (pla[23] && !pla[16]) begin
    $display("pla[23] pop qq");
    if (M1 && T1) begin                       end
    if (M1 && T2) begin                       end
    if (M1 && T3) begin                       end
    if (M1 && T4) begin             contM2=1; end
    if (M2 && T1) begin fMRead=1;             end
    if (M2 && T2) begin fMRead=1;             end
    if (M2 && T3) begin fMRead=1;   nextM=1;  end
    if (M3 && T1) begin fMRead=1;             end
    if (M3 && T2) begin fMRead=1;             end
    if (M3 && T3) begin fMRead=1;   nextM=1; setM1=1;  end
end

