onerror {resume}
quietly virtual function -install /test_fuse/dut/alu_ -env /test_fuse { &{/test_fuse/dut/alu_/op1_high, /test_fuse/dut/alu_/op1_low }} OP1
quietly virtual function -install /test_fuse/dut/alu_ -env /test_fuse { &{/test_fuse/dut/alu_/op2_high, /test_fuse/dut/alu_/op2_low }} OP2
quietly virtual function -install /test_fuse/dut/reg_file_ -env /test_fuse/dut/reg_file_/b2v_latch_af_lo { &{/test_fuse/dut/reg_file_/b2v_latch_af_hi/SYNTHESIZED_WIRE_0, /test_fuse/dut/reg_file_/b2v_latch_af_lo/SYNTHESIZED_WIRE_0 }} AF
quietly virtual function -install /test_fuse/dut/reg_file_ -env /test_fuse/dut/reg_file_/b2v_latch_af_lo { &{/test_fuse/dut/reg_file_/b2v_latch_af_hi/SYNTHESIZED_WIRE_0, /test_fuse/dut/reg_file_/b2v_latch_af_lo/SYNTHESIZED_WIRE_0 }} af
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {pads
} /test_fuse/z80/CLK
add wave -noupdate -expand -group {pads
} /test_fuse/z80/nM1
add wave -noupdate -expand -group {pads
} -color Gray90 /test_fuse/z80/nMREQ
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
} /test_fuse/dut/sequencer_/M1
add wave -noupdate -expand -group {clk
} /test_fuse/dut/sequencer_/M2
add wave -noupdate -expand -group {clk
} /test_fuse/dut/sequencer_/M3
add wave -noupdate -expand -group {clk
} /test_fuse/dut/sequencer_/M4
add wave -noupdate -expand -group {clk
} /test_fuse/dut/sequencer_/M5
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer_/T1
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer_/T2
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer_/T3
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer_/T4
add wave -noupdate -expand -group {clk
} -expand -group T /test_fuse/dut/sequencer_/T5
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/clk
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/mwait
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/busrq
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/reset
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/m1
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/mreq
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/iorq
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/rd
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/wr
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/rfsh
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/busack
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/T1
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/T2
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/Tw1
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/Tw2
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/T3
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/T4
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/fFetch
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/fMRead
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/fMWrite
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/fIORead
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/fIOWrite
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/setM1
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/in_intr
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/hold_clk_timing
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/pin_control_oe
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/bus_ab_pin_oe
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/bus_ab_pin_we
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/bus_db_pin_oe
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/bus_db_pin_re
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/busrq_latch
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/busack_latch
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/testW
add wave -noupdate -group {pin control
} /test_fuse/dut/pin_control_/wait_latch
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nINT
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nNMI
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nRESET
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nBUSRQ
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/m1
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/mreq
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/iorq
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/rd
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/wr
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/rfsh
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/busack
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/CPUCLK
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/pin_control_oe
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nWAIT
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/in_halt
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nM1
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nMREQ
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nIORQ
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nRD
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nWR
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nRFSH
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nHALT
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nBUSACK
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/nmi
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/busrq
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/clk
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/intr
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/mwait
add wave -noupdate -group {control pins
} /test_fuse/dut/control_pins_/reset_in
add wave -noupdate -group {regfile
} -radix hexadecimal /test_fuse/dut/reg_file_/AF
add wave -noupdate -group {regfile
} -radix hexadecimal /test_fuse/dut/reg_file_/db_hi_ds
add wave -noupdate -group {regfile
} -radix hexadecimal /test_fuse/dut/reg_file_/db_lo_ds
add wave -noupdate -group {regfile
} /test_fuse/dut/ctl_reg_in
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_control_/reg_in_hi
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_control_/reg_in_lo
add wave -noupdate -group {regfile
} -group {x
} -color Thistle /test_fuse/dut/reg_file_/reg_gp_we
add wave -noupdate -group {regfile
} -group {x
} -color Gold /test_fuse/dut/reg_file_/reg_sel_gp_lo
add wave -noupdate -group {regfile
} -group {x
} -color Gold /test_fuse/dut/reg_file_/reg_sel_gp_hi
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_sp
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_iy
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_ix
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_hl2
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_hl
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_de2
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_de
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_bc2
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_bc
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_af2
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_af
add wave -noupdate -group {regfile
} -group {x
} -color Aquamarine /test_fuse/dut/reg_file_/ctl_sw_4d
add wave -noupdate -group {regfile
} -group {x
} -color Aquamarine /test_fuse/dut/reg_file_/ctl_sw_4u
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sys_we_lo
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sys_we_hi
add wave -noupdate -group {regfile
} -group {x
} -color Gold /test_fuse/dut/reg_file_/reg_sel_sys_lo
add wave -noupdate -group {regfile
} -group {x
} -color Gold /test_fuse/dut/reg_file_/reg_sel_sys_hi
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_wz
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_ir
add wave -noupdate -group {regfile
} -group {x
} /test_fuse/dut/reg_file_/reg_sel_pc
add wave -noupdate -group {regfile
} -radix hexadecimal /test_fuse/dut/reg_file_/db_hi_as
add wave -noupdate -group {regfile
} -radix hexadecimal /test_fuse/dut/reg_file_/db_lo_as
add wave -noupdate -group switch /test_fuse/dut/bus_switch_/ctl_sw_1u
add wave -noupdate -group switch /test_fuse/dut/bus_switch_/ctl_sw_1d
add wave -noupdate -group switch /test_fuse/dut/bus_switch_/ctl_sw_2u
add wave -noupdate -group switch /test_fuse/dut/bus_switch_/ctl_sw_2d
add wave -noupdate -group switch /test_fuse/dut/alu_control_/ctl_daa_oe
add wave -noupdate -expand -group {data pins} /test_fuse/dut/data_pins_/bus_db_pin_oe
add wave -noupdate -expand -group {data pins} /test_fuse/dut/data_pins_/bus_db_pin_re
add wave -noupdate -expand -group {data pins} /test_fuse/dut/data_pins_/ctl_bus_db_we
add wave -noupdate -expand -group {data pins} /test_fuse/dut/data_pins_/bus_db_oe
add wave -noupdate -expand -group {data pins} -radix hexadecimal /test_fuse/dut/data_pins_/D
add wave -noupdate -expand -group {data pins} -radix hexadecimal /test_fuse/dut/data_pins_/db
add wave -noupdate -group db -radix hexadecimal /test_fuse/dut/db0
add wave -noupdate -group db -radix hexadecimal /test_fuse/dut/db1
add wave -noupdate -group db -radix hexadecimal /test_fuse/dut/db2
add wave -noupdate -radix hexadecimal /test_fuse/dut/alu_/test_db_high
add wave -noupdate -radix hexadecimal -childformat {{{/test_fuse/dut/alu_/test_db_low[3]} -radix hexadecimal} {{/test_fuse/dut/alu_/test_db_low[2]} -radix hexadecimal} {{/test_fuse/dut/alu_/test_db_low[1]} -radix hexadecimal} {{/test_fuse/dut/alu_/test_db_low[0]} -radix hexadecimal}} -subitemconfig {{/test_fuse/dut/alu_/test_db_low[3]} {-radix hexadecimal} {/test_fuse/dut/alu_/test_db_low[2]} {-radix hexadecimal} {/test_fuse/dut/alu_/test_db_low[1]} {-radix hexadecimal} {/test_fuse/dut/alu_/test_db_low[0]} {-radix hexadecimal}} /test_fuse/dut/alu_/test_db_low
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_shift_db0
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_shift_db7
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/ctl_shift_en
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/flags_hf
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/ctl_alu_op_low
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_parity_out
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/flags_zf
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/flags_pf
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/flags_sf
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/ctl_cond_short
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_vf_out
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/iff2
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/ctl_pf_sel
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/op543
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_shift_in
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_shift_right
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_shift_left
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/shift_cf_out
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_parity_in
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/flags_cond_true
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/pf_sel
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_op_low
add wave -noupdate -group {alu control} /test_fuse/dut/alu_control_/alu_core_cf_in
add wave -noupdate -group {alu control} -radix hexadecimal /test_fuse/dut/alu_control_/db
add wave -noupdate -group {alu control} -radix hexadecimal /test_fuse/dut/alu_control_/out
add wave -noupdate -group {alu control} -radix hexadecimal /test_fuse/dut/alu_control_/sel
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_oe
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_bus
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_alu
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/alu_sf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/alu_yf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/alu_xf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_nf_set
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/alu_zero
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/shift_cf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/alu_core_cf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/daa_cf_out
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_cf_set
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_cf_cpl
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_hf_cpl
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/pf_sel
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_cf_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_sz_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_xy_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_hf_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_pf_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/ctl_flags_nf_we
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/flags_sf
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/flags_zf
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/flags_pf
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/flags_cf
add wave -noupdate -group {alu flags} /test_fuse/dut/alu_flags_/flags_nf
add wave -noupdate -group {alu flags} -radix hexadecimal /test_fuse/dut/alu_flags_/db
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_shift_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_op2_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_res_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_op1_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_bs_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_op1_sel_bus
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_op1_sel_low
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_op1_sel_zero
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_op2_sel_zero
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_op2_sel_bus
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_op2_sel_lq
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_sel_op2_neg
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_sel_op2_high
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_core_R
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_core_V
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/ctl_alu_core_S
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_shift_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_op2_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_res_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_op1_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_bs_oe
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_op1_sel_bus
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_op1_sel_low
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_op1_sel_zero
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_op2_sel_zero
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_op2_sel_bus
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_op2_sel_lq
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_sel_op2_neg
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_sel_op2_high
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_core_R
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_core_V
add wave -noupdate -group {alu select} /test_fuse/dut/alu_select_/alu_core_S
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_bs_oe
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_parity_in
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_oe
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_shift_oe
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_op2_oe
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_op1_oe
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_res_oe
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_op1_sel_low
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_op1_sel_zero
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_op1_sel_bus
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_op2_sel_zero
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_op2_sel_bus
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_op2_sel_lq
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_op_low
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_shift_in
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_sel_op2_neg
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_sel_op2_high
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_shift_left
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_shift_right
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/bsel
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_zero
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_parity_out
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_high_eq_9
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_high_gt_9
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_low_gt_9
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_shift_db0
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_shift_db7
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_sf_out
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_yf_out
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_xf_out
add wave -noupdate -group {alu} /test_fuse/dut/alu_/alu_vf_out
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/db
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/test_db_high
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/test_db_low
add wave -noupdate -group {alu} -color Magenta /test_fuse/dut/alu_/alu_core_R
add wave -noupdate -group {alu} -color Magenta /test_fuse/dut/alu_/alu_core_V
add wave -noupdate -group {alu} -color Magenta /test_fuse/dut/alu_/alu_core_S
add wave -noupdate -group {alu} -color Magenta /test_fuse/dut/alu_/alu_core_cf_in
add wave -noupdate -group {alu} -color Magenta -radix hexadecimal /test_fuse/dut/alu_/alu_op1
add wave -noupdate -group {alu} -color Magenta -radix hexadecimal /test_fuse/dut/alu_/alu_op2
add wave -noupdate -group {alu} -color Red /test_fuse/dut/alu_/alu_core_cf_out
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/result_hi
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/result_lo
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/db_high
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/db_low
add wave -noupdate -group {alu} -color Green -radix hexadecimal /test_fuse/dut/alu_/OP1
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/op1_high
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/op1_low
add wave -noupdate -group {alu} -color Green -radix hexadecimal /test_fuse/dut/alu_/OP2
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/op2_high
add wave -noupdate -group {alu} -radix hexadecimal /test_fuse/dut/alu_/op2_low
add wave -noupdate -group {address latch} /test_fuse/dut/address_latch_/ctl_inc_cy
add wave -noupdate -group {address latch} /test_fuse/dut/address_latch_/ctl_inc_dec
add wave -noupdate -group {address latch} /test_fuse/dut/address_latch_/ctl_inc_zero
add wave -noupdate -group {address latch} /test_fuse/dut/address_latch_/ctl_al_we
add wave -noupdate -group {address latch} /test_fuse/dut/address_latch_/ctl_ab_mux_inc
add wave -noupdate -group {address latch} /test_fuse/dut/address_latch_/ctl_inc_limit6
add wave -noupdate -group {address latch} /test_fuse/dut/address_latch_/ctl_bus_inc_oe
add wave -noupdate -group {address latch} /test_fuse/dut/address_latch_/address_is_1
add wave -noupdate -group {address latch} -radix hexadecimal /test_fuse/dut/address_latch_/abus
add wave -noupdate -group {address latch} -radix hexadecimal /test_fuse/dut/address_latch_/address
add wave -noupdate -group {address latch} -radix hexadecimal /test_fuse/dut/address_latch_/q
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_state_iy_set
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_state_ixiy_clr
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_state_ixiy_we
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_state_halt_set
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_state_halt_clr
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_state_tbl_clr
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_state_tbl_ed_set
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_state_tbl_cb_set
add wave -noupdate -group state /test_fuse/dut/execute_/setCBED
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_state_alu
add wave -noupdate -group state /test_fuse/dut/decode_state_/clk
add wave -noupdate -group state /test_fuse/dut/decode_state_/reset
add wave -noupdate -group state /test_fuse/dut/decode_state_/address_is_1
add wave -noupdate -group state /test_fuse/dut/decode_state_/ctl_repeat_we
add wave -noupdate -group state /test_fuse/dut/decode_state_/in_halt
add wave -noupdate -group state /test_fuse/dut/decode_state_/table_cb
add wave -noupdate -group state /test_fuse/dut/decode_state_/table_ed
add wave -noupdate -group state /test_fuse/dut/decode_state_/table_xx
add wave -noupdate -group state /test_fuse/dut/decode_state_/use_ix
add wave -noupdate -group state /test_fuse/dut/decode_state_/use_ixiy
add wave -noupdate -group state /test_fuse/dut/decode_state_/in_alu
add wave -noupdate -group state /test_fuse/dut/decode_state_/repeat_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {47400 ns} 0} {{Cursor 2} {3765900 ns} 0}
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
configure wave -timelineunits us
update
WaveRestoreZoom {600 ns} {240500 ns}
