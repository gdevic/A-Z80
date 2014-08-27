onerror {resume}
quietly virtual function -install /test_fuse/dut/alu -env /test_fuse { &{/test_fuse/dut/alu/op1_high, /test_fuse/dut/alu/op1_low }} OP1
quietly virtual function -install /test_fuse/dut/alu -env /test_fuse { &{/test_fuse/dut/alu/op2_high, /test_fuse/dut/alu/op2_low }} OP2
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {pads
} /test_fuse/z80/CLK
add wave -noupdate -expand -group {pads
} /test_fuse/z80/nM1
add wave -noupdate -expand -group {pads
} /test_fuse/z80/nMREQ
add wave -noupdate -expand -group {pads
} /test_fuse/z80/nIORQ
add wave -noupdate -expand -group {pads
} /test_fuse/z80/nRD
add wave -noupdate -expand -group {pads
} /test_fuse/z80/nWR
add wave -noupdate -expand -group {pads
} /test_fuse/z80/nRFSH
add wave -noupdate -expand -group {pads
} -radix hexadecimal /test_fuse/z80/A
add wave -noupdate -expand -group {pads
} -radix hexadecimal -childformat {{{/test_fuse/z80/D[7]} -radix hexadecimal} {{/test_fuse/z80/D[6]} -radix hexadecimal} {{/test_fuse/z80/D[5]} -radix hexadecimal} {{/test_fuse/z80/D[4]} -radix hexadecimal} {{/test_fuse/z80/D[3]} -radix hexadecimal} {{/test_fuse/z80/D[2]} -radix hexadecimal} {{/test_fuse/z80/D[1]} -radix hexadecimal} {{/test_fuse/z80/D[0]} -radix hexadecimal}} -subitemconfig {{/test_fuse/z80/D[7]} {-height 15 -radix hexadecimal} {/test_fuse/z80/D[6]} {-height 15 -radix hexadecimal} {/test_fuse/z80/D[5]} {-height 15 -radix hexadecimal} {/test_fuse/z80/D[4]} {-height 15 -radix hexadecimal} {/test_fuse/z80/D[3]} {-height 15 -radix hexadecimal} {/test_fuse/z80/D[2]} {-height 15 -radix hexadecimal} {/test_fuse/z80/D[1]} {-height 15 -radix hexadecimal} {/test_fuse/z80/D[0]} {-height 15 -radix hexadecimal}} /test_fuse/z80/D
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer/T1
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer/T2
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer/T3
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer/T4
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer/T5
add wave -noupdate -expand -group {clk
} /test_fuse/dut/execute/fpga_reset
add wave -noupdate -expand -group {clk
} /test_fuse/dut/execute/reset
add wave -noupdate -expand -group {clk
} /test_fuse/dut/execute/clk
add wave -noupdate -group {regfile
} -radix hexadecimal /test_fuse/dut/reg_file/db_hi_ds
add wave -noupdate -group {regfile
} -radix hexadecimal /test_fuse/dut/reg_file/db_lo_ds
add wave -noupdate -group {regfile
} -color Thistle /test_fuse/dut/reg_file/reg_gp_we
add wave -noupdate -group {regfile
} -color Gold /test_fuse/dut/reg_file/reg_sel_gp_lo
add wave -noupdate -group {regfile
} -color Gold /test_fuse/dut/reg_file/reg_sel_gp_hi
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_sp
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_iy
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_ix
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_hl2
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_hl
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_de2
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_de
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_bc2
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_bc
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_af2
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_af
add wave -noupdate -group {regfile
} -color Aquamarine /test_fuse/dut/reg_file/ctl_sw_4d
add wave -noupdate -group {regfile
} -color Aquamarine /test_fuse/dut/reg_file/ctl_sw_4u
add wave -noupdate -group {regfile
} -color Thistle /test_fuse/dut/reg_file/reg_sys_we
add wave -noupdate -group {regfile
} -color Gold /test_fuse/dut/reg_file/reg_sel_sys_lo
add wave -noupdate -group {regfile
} -color Gold /test_fuse/dut/reg_file/reg_sel_sys_hi
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_wz
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_ir
add wave -noupdate -group {regfile
} /test_fuse/dut/reg_file/reg_sel_pc
add wave -noupdate -group {regfile
} -radix hexadecimal /test_fuse/dut/reg_file/db_hi_as
add wave -noupdate -group {regfile
} -radix hexadecimal /test_fuse/dut/reg_file/db_lo_as
add wave -noupdate -group switch /test_fuse/dut/bus_switch/ctl_sw_1u
add wave -noupdate -group switch /test_fuse/dut/bus_switch/ctl_sw_1d
add wave -noupdate -group switch /test_fuse/dut/bus_switch/ctl_sw_2u
add wave -noupdate -group switch /test_fuse/dut/bus_switch/ctl_sw_2d
add wave -noupdate -expand -group {data pins} /test_fuse/dut/data_pins/bus_db_pin_oe
add wave -noupdate -expand -group {data pins} /test_fuse/dut/data_pins/bus_db_pin_re
add wave -noupdate -expand -group {data pins} /test_fuse/dut/data_pins/ctl_bus_db_we
add wave -noupdate -expand -group {data pins} /test_fuse/dut/data_pins/bus_db_oe
add wave -noupdate -expand -group {data pins} -radix hexadecimal /test_fuse/dut/data_pins/D
add wave -noupdate -expand -group {data pins} -radix hexadecimal /test_fuse/dut/data_pins/db
add wave -noupdate -expand -group db -radix hexadecimal /test_fuse/dut/db0
add wave -noupdate -expand -group db -radix hexadecimal /test_fuse/dut/db1
add wave -noupdate -expand -group db -radix hexadecimal /test_fuse/dut/db2
add wave -noupdate -radix hexadecimal /test_fuse/dut/alu/test_db_high
add wave -noupdate -radix hexadecimal /test_fuse/dut/alu/test_db_low
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_shift_db0
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_shift_db7
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/ctl_shift_en
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_low_gt_9
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_high_gt_9
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_high_eq_9
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/ctl_daa_66
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/ctl_daa_oe
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/flags_hf
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/ctl_alu_op_low
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_parity_out
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/flags_cf
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/flags_zf
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/flags_pf
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/flags_sf
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/ctl_cond_short
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_vf_out
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/iff2
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/address_is_1
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/ctl_pf_sel
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/op543
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_shift_in
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_shift_right
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_shift_left
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/shift_cf_out
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_parity_in
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/flags_cond_true
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/daa_cf_out
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/pf_sel
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_op_low
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/alu_core_cf_in
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/db
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/out
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control/sel
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_oe
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_bus
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_alu
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/alu_sf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/alu_yf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/alu_xf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_nf_set
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/alu_zero
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/shift_cf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/alu_core_cf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/daa_cf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_daa
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_cf_set
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_cf_cpl
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/pf_sel
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_cf_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_sz_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_xy_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_hf_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_pf_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_nf_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_sel_cf2
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/ctl_flags_cf2_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/flags_sf
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/flags_zf
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/flags_hf
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/flags_pf
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/flags_cf
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags/db
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_shift_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_op2_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_res_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_op1_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_bs_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_op1_sel_bus
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_op1_sel_low
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_op1_sel_zero
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_op2_sel_zero
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_op2_sel_bus
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_op2_sel_lq
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_sel_op2_neg
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_sel_op2_high
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_core_R
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_core_V
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/ctl_alu_core_S
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_shift_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_op2_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_res_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_op1_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_bs_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_op1_sel_bus
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_op1_sel_low
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_op1_sel_zero
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_op2_sel_zero
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_op2_sel_bus
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_op2_sel_lq
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_sel_op2_neg
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_sel_op2_high
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_core_R
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_core_V
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select/alu_core_S
add wave -noupdate -group alu /test_fuse/dut/alu/alu_bs_oe
add wave -noupdate -group alu /test_fuse/dut/alu/alu_parity_in
add wave -noupdate -group alu /test_fuse/dut/alu/alu_oe
add wave -noupdate -group alu /test_fuse/dut/alu/alu_shift_oe
add wave -noupdate -group alu /test_fuse/dut/alu/alu_op2_oe
add wave -noupdate -group alu /test_fuse/dut/alu/alu_op1_oe
add wave -noupdate -group alu /test_fuse/dut/alu/alu_res_oe
add wave -noupdate -group alu /test_fuse/dut/alu/alu_op1_sel_low
add wave -noupdate -group alu /test_fuse/dut/alu/alu_op1_sel_zero
add wave -noupdate -group alu /test_fuse/dut/alu/alu_op1_sel_bus
add wave -noupdate -group alu /test_fuse/dut/alu/alu_op2_sel_zero
add wave -noupdate -group alu /test_fuse/dut/alu/alu_op2_sel_bus
add wave -noupdate -group alu /test_fuse/dut/alu/alu_op2_sel_lq
add wave -noupdate -group alu /test_fuse/dut/alu/alu_op_low
add wave -noupdate -group alu /test_fuse/dut/alu/alu_shift_in
add wave -noupdate -group alu /test_fuse/dut/alu/alu_sel_op2_neg
add wave -noupdate -group alu /test_fuse/dut/alu/alu_sel_op2_high
add wave -noupdate -group alu /test_fuse/dut/alu/alu_shift_left
add wave -noupdate -group alu /test_fuse/dut/alu/alu_shift_right
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/bsel
add wave -noupdate -group alu /test_fuse/dut/alu/alu_zero
add wave -noupdate -group alu /test_fuse/dut/alu/alu_parity_out
add wave -noupdate -group alu /test_fuse/dut/alu/alu_high_eq_9
add wave -noupdate -group alu /test_fuse/dut/alu/alu_high_gt_9
add wave -noupdate -group alu /test_fuse/dut/alu/alu_low_gt_9
add wave -noupdate -group alu /test_fuse/dut/alu/alu_shift_db0
add wave -noupdate -group alu /test_fuse/dut/alu/alu_shift_db7
add wave -noupdate -group alu /test_fuse/dut/alu/alu_sf_out
add wave -noupdate -group alu /test_fuse/dut/alu/alu_yf_out
add wave -noupdate -group alu /test_fuse/dut/alu/alu_xf_out
add wave -noupdate -group alu /test_fuse/dut/alu/alu_vf_out
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/db
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/test_db_high
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/test_db_low
add wave -noupdate -group alu -color Magenta /test_fuse/dut/alu/alu_core_R
add wave -noupdate -group alu -color Magenta /test_fuse/dut/alu/alu_core_V
add wave -noupdate -group alu -color Magenta /test_fuse/dut/alu/alu_core_S
add wave -noupdate -group alu -color Magenta /test_fuse/dut/alu/alu_core_cf_in
add wave -noupdate -group alu -color Magenta -radix hexadecimal /test_fuse/dut/alu/alu_op1
add wave -noupdate -group alu -color Magenta -radix hexadecimal /test_fuse/dut/alu/alu_op2
add wave -noupdate -group alu -color Red /test_fuse/dut/alu/alu_core_cf_out
add wave -noupdate -group alu -color Magenta -radix hexadecimal /test_fuse/dut/alu/result
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/db_high
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/db_low
add wave -noupdate -group alu -color Green -radix hexadecimal /test_fuse/dut/alu/OP1
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/op1_high
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/op1_low
add wave -noupdate -group alu -color Green -radix hexadecimal /test_fuse/dut/alu/OP2
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/op2_high
add wave -noupdate -group alu -radix hexadecimal /test_fuse/dut/alu/op2_low
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3900 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 163
configure wave -valuecolwidth 53
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3500 ps}
