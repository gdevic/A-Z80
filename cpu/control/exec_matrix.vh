if (pla[17] & ~pla[50]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo={~rsel3,rsel3};
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; setM1=1; end
end

if (pla[61] & ~pla[58] & ~pla[59]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo={~rsel3,rsel3};
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_alu_oe=1;
                    ctl_alu_op1_oe=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
end

if (use_ixiy & pla[58]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo={~rsel3,rsel3};
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; end
    if (M3 & T1) begin ixy_d=1; end
    if (M3 & T2) begin ixy_d=1; end
    if (M3 & T3) begin ixy_d=1; end
    if (M3 & T4) begin ixy_d=1; end
    if (M3 & T5) begin nextM=1; ctl_mRead=1; ixy_d=1; end
end

if (~use_ixiy & pla[58]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo={~rsel3,rsel3};
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1; end
    if (M2 & T3) begin fMRead=1; setM1=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1; setM1=1; end
end

if (use_ixiy & pla[59]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; end
    if (M3 & T1) begin ixy_d=1; end
    if (M3 & T2) begin ixy_d=1; end
    if (M3 & T3) begin ixy_d=1; end
    if (M3 & T4) begin ixy_d=1; end
    if (M3 & T5) begin nextM=1; ctl_mWrite=1; ixy_d=1; end
end

if (~use_ixiy & pla[59]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M2 & T1) begin fMWrite=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMWrite=1; end
    if (M2 & T3) begin fMWrite=1; setM1=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M4 & T2) begin fMWrite=1; end
    if (M4 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[40]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; ixy_d=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; ixy_d=1; end
    if (M3 & T3) begin fMRead=1; ixy_d=1; end
    if (M3 & T4) begin ixy_d=1; end
    if (M3 & T5) begin nextM=1; ctl_mWrite=1; ixy_d=1; end
end

if (pla[50] & ~pla[40]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1; end
    if (M3 & T1) begin fMWrite=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMWrite=1; end
    if (M3 & T3) begin fMWrite=1; setM1=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T2) begin fMWrite=1; end
    if (M4 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[8] & pla[13]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M2 & T1) begin fMWrite=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMWrite=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[8] & ~pla[13]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; setM1=1; end
end

if (pla[38] & pla[13]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M4 & T2) begin fMWrite=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[38] & ~pla[13]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M4 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin fMRead=1; setM1=1; end
end

if (pla[83]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_IFF2;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1;
                    ctl_reg_sel_ir=1; ctl_reg_sys_hilo={~op3,op3}; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T5) begin setM1=1; end
end

if (pla[57]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_ir=1; ctl_reg_sys_hilo={~op3,op3}; ctl_sw_4d=1;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_alu_oe=1;
                    ctl_alu_op1_oe=1; end
    if (M1 & T5) begin setM1=1; end
end

if (pla[7]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_reg_use_sp=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_reg_use_sp=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; setM1=1; end
end

if (pla[30] & pla[13]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M4 & T2) begin fMWrite=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin fMWrite=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M5 & T2) begin fMWrite=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[30] & ~pla[13]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M4 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M5 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M5 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M5 & T3) begin fMRead=1; setM1=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
end

if (pla[31] & pla[33]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_reg_use_sp=1; end
    if (M4 & T2) begin fMWrite=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin fMWrite=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_reg_use_sp=1; end
    if (M5 & T2) begin fMWrite=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[31] & ~pla[33]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M4 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_reg_use_sp=1; end
    if (M5 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M5 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M5 & T3) begin fMRead=1; setM1=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_reg_use_sp=1; end
end

if (pla[5]) begin
    if (M1 & T4) begin validPLA=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M1 & T5) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_bus_inc_oe=1; end
    if (M1 & T6) begin setM1=1; end
end

if (pla[23] & pla[16]) begin
    if (M1 & T4) begin validPLA=1; end
    if (M1 & T5) begin nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1; end
    if (M2 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M2 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMWrite=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1; end
    if (M3 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M3 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[23] & ~pla[16]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; setM1=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
end

if (pla[2]) begin
    if (M1 & T2) begin
                    ctl_reg_ex_de_hl=1; end
    if (M1 & T4) begin validPLA=1; setM1=1; end
end

if (pla[39]) begin
    if (M1 & T2) begin
                    ctl_reg_ex_af=1; end
    if (M1 & T4) begin validPLA=1; setM1=1; end
end

if (pla[1]) begin
    if (M1 & T2) begin
                    ctl_reg_exx=1; end
    if (M1 & T4) begin validPLA=1; setM1=1; end
end

if (pla[10]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M4 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin fMWrite=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M5 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M5 & T3) begin fMWrite=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M5 & T4) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_bus_inc_oe=1; end
    if (M5 & T5) begin setM1=1; end
end

if (pla[0]) begin
    begin nonRep=1; end
end

if (pla[12]) begin
    if (M1 & T1) begin
                    ctl_flags_alu=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_REP;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_use_cf2=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=op3;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_flags_cf2_we=1; end
    if (M3 & T1) begin fMWrite=1;
                    ctl_reg_gp_sel=`GP_REG_DE; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_use_cf2=1; end
    if (M3 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_DE; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=op3;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMWrite=1;
                    ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T4) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1;
                    ctl_repeat_we=1; end
    if (M3 & T5) begin nextM=1; setM1=nonRep | ~repeat_en; end
    if (M4 & T1) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M4 & T2) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M4 & T4) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T5) begin setM1=1; end
end

if (pla[11]) begin
    if (M1 & T1) begin
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_op1_sel_zero=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_set|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_REP;
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1;
                    ctl_flags_use_cf2=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_hf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=op3;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_set|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_flags_cf2_we=1; end
    if (M3 & T1) begin
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_set|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_use_cf2=1; end
    if (M3 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T4) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1;
                    ctl_repeat_we=1; end
    if (M3 & T5) begin nextM=1; setM1=nonRep | ~repeat_en | flags_zf; end
    if (M4 & T1) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M4 & T2) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M4 & T4) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T5) begin setM1=1; end
end

if (pla[65] & ~pla[52]) begin
    if (M1 & T1) begin
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_state_alu=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_state_alu=1;
                    ctl_flags_hf_cpl=flags_nf; ctl_flags_cf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_state_alu=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1; end
end

if (pla[64]) begin
    if (M1 & T1) begin
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_state_alu=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_state_alu=1;
                    ctl_flags_hf_cpl=flags_nf; ctl_flags_cf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1;
                    ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_state_alu=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1;
                    ctl_state_alu=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; setM1=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_state_alu=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1; end
end

if (use_ixiy & pla[52]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; end
    if (M3 & T1) begin ixy_d=1; end
    if (M3 & T2) begin ixy_d=1; end
    if (M3 & T3) begin ixy_d=1; end
    if (M3 & T4) begin ixy_d=1; end
    if (M3 & T5) begin nextM=1; ctl_mRead=1; ixy_d=1; end
end

if (~use_ixiy & pla[52]) begin
    if (M1 & T1) begin
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_state_alu=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_state_alu=1;
                    ctl_flags_hf_cpl=flags_nf; ctl_flags_cf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; setM1=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_state_alu=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T2) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M4 & T3) begin fMRead=1; setM1=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_state_alu=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1; end
end

if (pla[66] & ~pla[53]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo={~rsel3,rsel3};
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V;
                    ctl_flags_use_cf2=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_hf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
        if (op4 & op5 & ~op3) begin ctl_bus_zero_oe=1; end
        if (~(op4 & op5 & ~op3)) begin ctl_reg_gp_sel=op54; ctl_reg_gp_hilo={~rsel3,rsel3}; end
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_set=1;
                    ctl_flags_cf2_we=1; end
end

if (pla[75]) begin
    if (M1 & T1) begin
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1;
                    ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_alu_sel_op2_neg=1; end
    if (M1 & T4) begin
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1;
                    ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_alu_sel_op2_neg=1; end
end

if ((M2 | M4) & pla[75]) begin
    begin
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1;
                    ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_alu_sel_op2_neg=1; end
end

if (use_ixiy & pla[53]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; end
    if (M3 & T1) begin ixy_d=1; end
    if (M3 & T2) begin ixy_d=1; end
    if (M3 & T3) begin ixy_d=1; end
    if (M3 & T4) begin ixy_d=1; end
    if (M3 & T5) begin nextM=1; ctl_mRead=1; ixy_d=1; end
end

if (~use_ixiy & pla[53]) begin
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_hf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1; end
    if (M2 & T3) begin fMRead=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_set=1;
                    ctl_flags_cf2_we=1; end
    if (M2 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V;
                    ctl_flags_use_cf2=1; end
    if (M3 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1; end
    if (M3 & T2) begin fMWrite=1; end
    if (M3 & T3) begin fMWrite=1; setM1=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_set=1;
                    ctl_flags_cf2_we=1; end
    if (M4 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V;
                    ctl_flags_use_cf2=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1; end
    if (M5 & T2) begin fMWrite=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[69]) begin
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
    if (M2 & T1) begin
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_reg_use_sp=1; end
    if (M2 & T2) begin
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_xy_we=1;
                    ctl_flags_cf_we=1; end
    if (M2 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
    if (M2 & T4) begin nextM=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_reg_use_sp=1; end
    if (M3 & T1) begin
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_xy_we=1;
                    ctl_flags_cf_we=1; end
    if (M3 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin setM1=1; end
end

if (op3 & pla[68]) begin
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
    if (M2 & T1) begin
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_reg_use_sp=1; end
    if (M2 & T2) begin
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_cf_we=1; end
    if (M2 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
    if (M2 & T4) begin nextM=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_reg_use_sp=1; end
    if (M3 & T1) begin
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V;
                    ctl_flags_cf_we=1;
                    ctl_alu_zero_16bit=1; end
    if (M3 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin setM1=1; end
end

if (~op3 & pla[68]) begin
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_hf_cpl=flags_nf; ctl_flags_cf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
    if (M2 & T1) begin
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_reg_use_sp=1; end
    if (M2 & T2) begin
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_cf_we=1; end
    if (M2 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
    if (M2 & T4) begin nextM=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_sel_op2_neg=1; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_reg_use_sp=1; end
    if (M3 & T1) begin
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V;
                    ctl_flags_cf_we=1;
                    ctl_alu_zero_16bit=1; end
    if (M3 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin setM1=1; end
end

if (pla[9]) begin
    if (M1 & T4) begin validPLA=1;
                    ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_use_sp=1; end
    if (M1 & T5) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=op3;
                    ctl_bus_inc_oe=1;
                    ctl_reg_use_sp=1; end
    if (M1 & T6) begin setM1=1; end
end

if (pla[77]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_cf_we=1;
                    ctl_alu_sel_op2_neg=flags_nf; ctl_flags_cf_cpl=~flags_nf; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_use_cf2=1;
                    ctl_flags_hf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf2_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_cf_set=1;
                    ctl_flags_cf2_we=1; ctl_flags_cf2_sel_daa=1;
                    ctl_daa_oe=1;
                    ctl_alu_sel_op2_neg=flags_nf; ctl_flags_cf_cpl=~flags_nf; end
end

if (pla[81]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1;
                    ctl_alu_sel_op2_neg=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_hf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_flags_alu=1;
                    ctl_alu_op1_sel_zero=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1;
                    ctl_alu_sel_op2_neg=1; end
end

if (pla[82]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_set|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V;
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_hf_cpl=flags_nf; ctl_flags_cf_cpl=flags_nf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_flags_alu=1;
                    ctl_alu_op1_sel_zero=1;
                    ctl_alu_op_low=1;
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_set|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1;
                    ctl_flags_cf_we=1; end
end

if (pla[89]) begin
    if (M1 & T1) begin
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_cf_we=1; ctl_flags_cf_cpl=1;
                    ctl_flags_hf_cpl=~flags_cf; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_flags_alu=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
end

if (pla[92]) begin
    if (M1 & T1) begin
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_cf_set=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_flags_alu=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
end

if (pla[95]) begin
    if (M1 & T3) begin
                    ctl_state_halt_set=1; end
    if (M1 & T4) begin validPLA=1; setM1=1; end
end

if (pla[97]) begin
    if (M1 & T3) begin
                    ctl_iffx_bit=op3; ctl_iffx_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_no_ints=1; end
end

if (pla[96]) begin
    if (M1 & T3) begin
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_im_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1; end
end

if (pla[25]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_use_cf2=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=1; ctl_shift_en=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf2_we=1; ctl_flags_cf2_sel_shift=1; end
end

if (~use_ixiy & pla[70] & ~pla[55]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_use_cf2=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=1; ctl_shift_en=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf2_we=1; ctl_flags_cf2_sel_shift=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_bus_db_oe=1;
                    ctl_ir_we=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=1; ctl_shift_en=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf2_we=1; ctl_flags_cf2_sel_shift=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_we=1; end
    if (M5 & T2) begin fMWrite=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1; end
end

if (~use_ixiy & pla[70] & pla[55]) begin
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1;
                    ctl_flags_use_cf2=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1; end
    if (M2 & T3) begin fMRead=1; end
    if (M2 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=1; ctl_shift_en=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf2_we=1; ctl_flags_cf2_sel_shift=1; end
    if (M3 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_we=1; end
    if (M3 & T2) begin fMWrite=1; end
    if (M3 & T3) begin fMWrite=1; setM1=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_bus_db_oe=1;
                    ctl_ir_we=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=1; ctl_shift_en=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf2_we=1; ctl_flags_cf2_sel_shift=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1;
                    ctl_flags_cf_we=1; end
    if (M5 & T2) begin fMWrite=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[15] & op3) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; end
    if (M3 & T1) begin
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_lq=1;
                    ctl_alu_op_low=1; end
    if (M3 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_low=1;
                    ctl_alu_sel_op2_high=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_alu_oe=1;
                    ctl_alu_op2_oe=1; end
    if (M4 & T2) begin fMWrite=1;
                    ctl_alu_op1_oe=1;
                    ctl_alu_op2_sel_bus=1; end
    if (M4 & T3) begin fMWrite=1; setM1=1;
                    ctl_flags_alu=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
end

if (pla[15] & ~op3) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; end
    if (M3 & T1) begin
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_lq=1;
                    ctl_alu_op1_sel_low=1;
                    ctl_alu_op_low=1; end
    if (M3 & T2) begin
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_alu_oe=1;
                    ctl_alu_op2_oe=1; end
    if (M3 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_lq=1;
                    ctl_alu_op_low=1; end
    if (M3 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_low=1;
                    ctl_alu_sel_op2_high=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_alu_oe=1;
                    ctl_alu_op2_oe=1; end
    if (M4 & T2) begin fMWrite=1;
                    ctl_alu_op1_oe=1;
                    ctl_alu_op2_sel_bus=1; end
    if (M4 & T3) begin fMWrite=1; setM1=1;
                    ctl_flags_alu=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
end

if (~use_ixiy & pla[72] & ~pla[55]) begin
    if (M1 & T1) begin
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_bus=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_bus_inc_oe=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_ir_we=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1; end
    if (M4 & T4) begin setM1=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
end

if (~use_ixiy & pla[72] & pla[55]) begin
    if (M1 & T1) begin
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_bus=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1; end
    if (M2 & T3) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_flags_xy_we=1; end
    if (M2 & T4) begin setM1=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_ir_we=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1; end
    if (M4 & T4) begin setM1=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
end

if (~use_ixiy & pla[74] & ~pla[55]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_bus=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_ir_we=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
    if (M5 & T2) begin fMWrite=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1; end
end

if (~use_ixiy & pla[74] & pla[55]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_bus=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1; end
    if (M2 & T3) begin fMRead=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
    if (M2 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
    if (M3 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1; end
    if (M3 & T2) begin fMWrite=1; end
    if (M3 & T3) begin fMWrite=1; setM1=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_ir_we=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
    if (M5 & T2) begin fMWrite=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1; end
end

if (~use_ixiy & pla[73] & ~pla[55]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_alu_sel_op2_neg=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_bus=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_reg_gp_sel=op21; ctl_reg_gp_hilo={~rsel0,rsel0};
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_alu_sel_op2_neg=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_ir_we=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_alu_sel_op2_neg=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_alu_sel_op2_neg=1; end
    if (M5 & T2) begin fMWrite=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1; end
end

if (~use_ixiy & pla[73] & pla[55]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_bus=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1; end
    if (M2 & T3) begin fMRead=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_alu_sel_op2_neg=1; end
    if (M2 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_alu_sel_op2_neg=1; end
    if (M3 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1; end
    if (M3 & T2) begin fMWrite=1; end
    if (M3 & T3) begin fMWrite=1; setM1=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_ir_we=1; end
    if (M4 & T2) begin fMRead=1; end
    if (M4 & T3) begin fMRead=1; nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_alu_sel_op2_neg=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_alu_sel_op2_neg=1; end
    if (M5 & T2) begin fMWrite=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1; end
end

if (pla[37] & ~pla[28]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_iorw=1; end
    if (M3 & T1) begin fIORead=1;
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T2) begin fIORead=1; end
    if (M3 & T3) begin fIORead=1; end
    if (M3 & T4) begin fIORead=1; setM1=1; end
end

if (pla[27] & ~pla[34]) begin
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=op54; ctl_reg_gp_hilo={~rsel3,rsel3};
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_iorw=1; end
    if (M2 & T1) begin fIORead=1;
                    ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fIORead=1; end
    if (M2 & T3) begin fIORead=1; end
    if (M2 & T4) begin fIORead=1; setM1=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
end

if (pla[37] & pla[28]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_iorw=1;
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_in_lo=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fIOWrite=1;
                    ctl_bus_inc_oe=1;
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M3 & T2) begin fIOWrite=1; end
    if (M3 & T3) begin fIOWrite=1; end
    if (M3 & T4) begin fIOWrite=1; setM1=1; end
end

if (pla[27] & pla[34]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_iorw=1;
        if (op4 & op5 & ~op3) begin ctl_bus_zero_oe=1; end
        if (~(op4 & op5 & ~op3)) begin ctl_reg_gp_sel=op54; ctl_reg_gp_hilo={~rsel3,rsel3}; end
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M2 & T1) begin fIOWrite=1;
                    ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fIOWrite=1; end
    if (M2 & T3) begin fIOWrite=1; end
    if (M2 & T4) begin fIOWrite=1; setM1=1; end
end

if (pla[91] & pla[21]) begin
    if (M1 & T1) begin
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; end
    if (M1 & T5) begin nextM=1; ctl_iorw=1; end
    if (M2 & T1) begin fIORead=1;
                    ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fIORead=1;
                    ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_alu_sel_op2_neg=1; end
    if (M2 & T3) begin fIORead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_cf_we=1;
                    ctl_alu_sel_op2_neg=1; end
    if (M2 & T4) begin fIORead=1; nextM=1; ctl_mWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_nf_we=1;
                    ctl_alu_sel_op2_neg=1; end
    if (M3 & T1) begin fMWrite=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=op3;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMWrite=1; nextM=1; setM1=nonRep | flags_zf; end
    if (M4 & T1) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M4 & T2) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M4 & T4) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T5) begin setM1=1; end
end

if (pla[91] & pla[20]) begin
    if (M1 & T1) begin
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_R=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P; end
    if (M1 & T2) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_oe=1; end
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1;
                    ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_alu_sel_op2_neg=1; end
    if (M1 & T5) begin nextM=1; ctl_mRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_alu_sel_op2_neg=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=op3;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_iorw=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
    if (M3 & T1) begin fIOWrite=1;
                    ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T2) begin fIOWrite=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_flags_nf_we=1; end
    if (M3 & T3) begin fIOWrite=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_cf_we=1; end
    if (M3 & T4) begin fIOWrite=1; nextM=1; setM1=nonRep | flags_zf; end
    if (M4 & T1) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M4 & T2) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M4 & T4) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T5) begin setM1=1; end
end

if (pla[29]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_reg_not_pc=1; end
end

if (pla[43]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; setM1=1;
                    ctl_reg_not_pc|=flags_cond_true; ctl_reg_sel_wz|=flags_cond_true; ctl_reg_sys_hilo|={flags_cond_true,flags_cond_true}; ctl_sw_4d|=flags_cond_true;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=flags_cond_true; ctl_reg_sel_wz=flags_cond_true; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
end

if (pla[47]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; end
    if (M3 & T1) begin
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_flags_sz_we=1; end
    if (M3 & T2) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b01; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1; end
    if (M3 & T3) begin
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_cf_we=1; end
    if (M3 & T4) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b10; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_alu_sel_op2_neg=flags_sf; end
    if (M3 & T5) begin setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_alu_sel_op2_neg=flags_sf;
                    ctl_reg_not_pc=1; end
end

if (pla[48]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1;
                    ctl_cond_short=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; setM1=~flags_cond_true; end
    if (M3 & T1) begin
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_flags_sz_we=1; end
    if (M3 & T2) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b01; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1; end
    if (M3 & T3) begin
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_cf_we=1; end
    if (M3 & T4) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b10; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_alu_sel_op2_neg=flags_sf; end
    if (M3 & T5) begin setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_alu_sel_op2_neg=flags_sf;
                    ctl_reg_not_pc=1; end
end

if (pla[6]) begin
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_not_pc=1; end
end

if (pla[26]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1;
                    ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_alu_sel_op2_neg=1; end
    if (M1 & T5) begin nextM=1; ctl_mRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_BC; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_sz_we=1;
                    ctl_alu_sel_op2_neg=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; setM1=flags_zf; end
    if (M3 & T1) begin
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_flags_sz_we=1; end
    if (M3 & T2) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b01; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1; end
    if (M3 & T3) begin
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_cf_we=1; end
    if (M3 & T4) begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b10; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_alu_sel_op2_neg=flags_sf; end
    if (M3 & T5) begin setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_alu_sel_op2_neg=flags_sf;
                    ctl_reg_not_pc=1; end
end

if (pla[24]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b10; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M4 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin fMWrite=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b01; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M5 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_not_pc=1; end
end

if (pla[42]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; nextM=~flags_cond_true; setM1=~flags_cond_true;
                    ctl_reg_sys_we_hi=flags_cond_true; ctl_reg_sel_wz=flags_cond_true; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T4) begin nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1; end
    if (M4 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b10; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M4 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M4 & T3) begin fMWrite=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1; end
    if (M5 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b01; ctl_sw_4u=1;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M5 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M5 & T3) begin fMWrite=1; setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_not_pc=1; end
end

if (pla[35]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_reg_not_pc=1; end
end

if (pla[45]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1; end
    if (M1 & T4) begin validPLA=1; end
    if (M1 & T5) begin nextM=1; ctl_mRead=1; setM1=~flags_cond_true; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_reg_not_pc=1; end
end

if (pla[46]) begin
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1;
                    ctl_iff1_iff2=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMRead=1; setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_reg_not_pc=1; end
end

if (pla[56]) begin
    if (M1 & T3) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_oe=1;
                    ctl_alu_op1_oe=1;
                    ctl_alu_op1_sel_zero=1;
                    ctl_sw_mask543_en=~((in_intr & im2) | in_nmi);
                    ctl_sw_1d=~in_nmi; ctl_66_oe=in_nmi;
                    ctl_bus_ff_oe=in_intr & im1; end
    if (M1 & T4) begin validPLA=1; end
    if (M1 & T5) begin nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
    if (M2 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b10; ctl_sw_4u=1;
                    ctl_reg_out_hi=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M2 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMWrite=1; nextM=1; ctl_mWrite=1;
                    ctl_reg_use_sp=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_sw_4d=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_al_we=1; end
    if (M3 & T1) begin fMWrite=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_apin_mux=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b01; ctl_sw_4u=1;
                    ctl_reg_out_lo=1;
                    ctl_sw_2u=1;
                    ctl_sw_1u=1;
                    ctl_bus_db_we=1; end
    if (M3 & T2) begin fMWrite=1;
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11; ctl_reg_use_sp=1; ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold; ctl_inc_dec=1;
                    ctl_bus_inc_oe=1; end
    if (M3 & T3) begin fMWrite=1; nextM=1; ctl_mRead=in_intr & im2; setM1=~(in_intr & im2);
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_not_pc=1; end
    if (M4 & T1) begin fMRead=1;
                    ctl_reg_sel_ir=1; ctl_reg_sys_hilo=2'b10; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_alu_oe=1;
                    ctl_alu_op1_oe=1; end
    if (M4 & T2) begin fMRead=1;
                    ctl_sw_4u=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1;
                    ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1; end
    if (M4 & T3) begin fMRead=1; nextM=1; ctl_mRead=1;
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1; end
    if (M5 & T1) begin fMRead=1;
                    ctl_reg_sel_ir=1; ctl_reg_sys_hilo=2'b10; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_alu_oe=1;
                    ctl_alu_op1_oe=1; end
    if (M5 & T2) begin fMRead=1;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M5 & T3) begin fMRead=1; setM1=1;
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_reg_not_pc=1; end
end

if (pla[49]) begin
    if (M1 & T3) begin
                    ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b11;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_bus=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_flags_sz_we=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_hf_we=1;
                    ctl_flags_pf_we=1;
                    ctl_flags_nf_we=1;
                    ctl_flags_cf_we=1;
                    ctl_state_tbl_cb_set=1; setCBED=1; end
    if (M1 & T4) begin validPLA=1; nextM=1; ctl_mRead=1; end
    if (M2 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
    if (M2 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; end
    if (M2 & T3) begin fMRead=1; nextM=1; ctl_mRead=1; end
    if (M3 & T1) begin fMRead=1;
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; ixy_d=1; end
    if (M3 & T2) begin fMRead=1;
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; ixy_d=1; end
    if (M3 & T3) begin fMRead=1; ixy_d=1; end
    if (M3 & T4) begin ixy_d=1; end
    if (M3 & T5) begin nextM=1; ctl_mRead=1; ixy_d=1; end
    if (M4 & T1) begin
                    ctl_bus_db_oe=1;
                    ctl_alu_bs_oe=1;
                    ctl_alu_op2_sel_bus=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_ir_we=1; end
end

if (pla[3]) begin
    if (M1 & T2) begin
                    ctl_state_ixiy_we=1; ctl_state_iy_set=op5; setIXIY=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_no_ints=1; end
end

if (pla[44]) begin
    if (M1 & T2) begin
                    ctl_state_tbl_cb_set=1; setCBED=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_no_ints=1; end
end

if (pla[51]) begin
    if (M1 & T2) begin
                    ctl_state_tbl_ed_set=1; setCBED=1; end
    if (M1 & T4) begin validPLA=1; setM1=1;
                    ctl_no_ints=1; end
end

if (pla[76]) begin
    begin
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_set|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1; end
    if (M1 & T1) begin
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V; end
end

if (pla[78]) begin
    begin
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_set|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1; end
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V; end
end

if (pla[79]) begin
    begin
                    ctl_alu_sel_op2_neg=1; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_nf_we=1; ctl_flags_nf_set=1; end
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V; end
end

if (pla[80]) begin
    begin
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V; end
end

if (pla[84]) begin
    begin
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_V; end
end

if (pla[85]) begin
    begin
                    ctl_alu_core_S=1; ctl_flags_cf_set=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P; end
    if (M1 & T2) begin
                    ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
end

if (pla[86]) begin
    begin
                    ctl_alu_core_R=1; ctl_alu_core_V=1; ctl_alu_core_S=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P; end
    if (M1 & T2) begin
                    ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
end

if (pla[88]) begin
    begin
                    ctl_alu_core_R=1; ctl_flags_cf_set=1; ctl_flags_cf_cpl=1;
                    ctl_flags_nf_we=1; ctl_flags_nf_clr=1; end
    if (M1 & T1) begin
                    ctl_reg_gp_we=1; ctl_reg_gp_sel=`GP_REG_AF; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_in_hi=1; ctl_reg_in_lo=1;
                    ctl_flags_xy_we=1;
                    ctl_flags_pf_we=1; ctl_pf_sel=`PFSEL_P; end
    if (M1 & T2) begin
                    ctl_flags_cf_set=1; ctl_flags_cf_cpl=1; end
end

if (ixy_d) begin
    if (T1) begin
                    ctl_sw_2d=1;
                    ctl_sw_1d=1;
                    ctl_bus_db_oe=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_bus=1;
                    ctl_flags_sz_we=1; end
    if (T2) begin
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b01;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_sw_2d=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_flags_cf_set|=ctl_alu_op_low; ctl_flags_cf_cpl|=ctl_alu_op_low; ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1; end
    if (T3) begin
                    ctl_reg_sys_we_lo=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={ctl_reg_sys_hilo[1],1'b1};
                    ctl_reg_in_lo=1;
                    ctl_sw_2u=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_cf2_we=1; end
    if (T4) begin
                    ctl_reg_gp_sel=`GP_REG_HL; ctl_reg_gp_hilo=2'b10;
                    ctl_reg_out_hi=1; ctl_reg_out_lo=1;
                    ctl_flags_alu=1;
                    ctl_alu_shift_oe=~ctl_alu_bs_oe;
                    ctl_alu_op2_sel_zero=1;
                    ctl_alu_op1_sel_bus=1;
                    ctl_alu_op_low=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_hf_we=1;
                    ctl_flags_use_cf2=1;
                    ctl_alu_sel_op2_neg=flags_sf; end
    if (T5) begin
                    ctl_reg_sel_wz=1; ctl_reg_sys_hilo=2'b11; ctl_sw_4d=1;
                    ctl_al_we=1;
                    ctl_reg_sys_we_hi=1; ctl_reg_sel_wz=1; ctl_reg_sys_hilo={1'b1,ctl_reg_sys_hilo[0]};
                    ctl_reg_in_hi=1;
                    ctl_flags_alu=1;
                    ctl_alu_oe=1;
                    ctl_alu_res_oe=1;
                    ctl_alu_sel_op2_high=1;
                    ctl_alu_core_hf|=~ctl_alu_op_low;
                    ctl_flags_xy_we=1;
                    ctl_alu_sel_op2_neg=flags_sf;
                    ctl_state_ixiy_we=1; ctl_state_ixiy_clr=~setIXIY; end
end

if (1) begin
    if (M1 & T1) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11; pc_inc_hold=(in_halt | in_intr | in_nmi);
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; ctl_apin_mux2=1; end
    if (M1 & T2) begin
                    ctl_reg_sel_ir=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1;
                    ctl_bus_db_oe=1;
                    ctl_state_ixiy_we=1; ctl_state_ixiy_clr=~setIXIY;
                    ctl_state_tbl_clr=~setCBED;
                    ctl_ir_we=1;
                    ctl_bus_zero_oe=in_halt; ctl_bus_ff_oe=(in_intr & (im1 | im2)) | in_nmi; end
    if (M1 & T3) begin
                    ctl_reg_sys_we=1; ctl_reg_sel_ir=1; ctl_reg_sys_hilo=2'b11;
                    ctl_inc_cy=~pc_inc_hold;
                    ctl_bus_inc_oe=1; ctl_apin_mux2=1;
                    ctl_inc_limit6=1; end
    if (M1 & T4) begin
                    ctl_eval_cond=1; end
end

if (~validPLA) begin
    if (M1 & T4) begin setM1=1; end
end

if (setM1) begin
    begin
                    ctl_reg_sel_pc=1; ctl_reg_sys_hilo=2'b11;
                    ctl_al_we=1; end
end

