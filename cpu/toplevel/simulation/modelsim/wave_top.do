onerror {resume}
quietly virtual function -install /test_top/dut/reg_file -env /test_top/dut/reg_file/b2v_latch_hl2_lo { &{/test_top/dut/reg_file/b2v_latch_hl2_hi/SYNTHESIZED_WIRE_0, /test_top/dut/reg_file/b2v_latch_hl2_lo/SYNTHESIZED_WIRE_0 }} HL2
quietly virtual function -install /test_top/dut/reg_file -env /test_top/dut/reg_file/b2v_latch_de2_lo { &{/test_top/dut/reg_file/b2v_latch_de2_hi/SYNTHESIZED_WIRE_0, /test_top/dut/reg_file/b2v_latch_de2_lo/SYNTHESIZED_WIRE_0 }} DE2
quietly virtual function -install /test_top/dut/reg_file -env /test_top/dut/reg_file/b2v_latch_sp_lo { &{/test_top/dut/reg_file/b2v_latch_sp_hi/SYNTHESIZED_WIRE_0, /test_top/dut/reg_file/b2v_latch_sp_lo/SYNTHESIZED_WIRE_0 }} SP
quietly virtual function -install /test_top/dut/reg_file -env /test_top/dut/reg_file/b2v_latch_pc_lo { &{/test_top/dut/reg_file/b2v_latch_pc_hi/SYNTHESIZED_WIRE_0, /test_top/dut/reg_file/b2v_latch_pc_lo/SYNTHESIZED_WIRE_0 }} PC
quietly virtual function -install /test_top/dut/reg_file -env /test_top/dut/reg_file/b2v_latch_wz_lo { &{/test_top/dut/reg_file/b2v_latch_wz_hi/SYNTHESIZED_WIRE_0, /test_top/dut/reg_file/b2v_latch_wz_lo/SYNTHESIZED_WIRE_0 }} WZ
quietly virtual function -install /test_top/dut/interrupts -env /test_top { &{/test_top/dut/interrupts/im2, /test_top/dut/interrupts/im1 }} IM
quietly virtual function -install /test_top/dut/reg_file -env /test_top/dut/reg_file/b2v_latch_ir_lo { &{/test_top/dut/reg_file/b2v_latch_ir_hi/SYNTHESIZED_WIRE_0, /test_top/dut/reg_file/b2v_latch_ir_lo/SYNTHESIZED_WIRE_0 }} IR
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Pins /test_top/z80/CLK
add wave -noupdate -expand -group Pins /test_top/z80/nM1
add wave -noupdate -expand -group Pins /test_top/z80/nMREQ
add wave -noupdate -expand -group Pins -color Pink /test_top/z80/nIORQ
add wave -noupdate -expand -group Pins /test_top/z80/nRD
add wave -noupdate -expand -group Pins /test_top/z80/nWR
add wave -noupdate -expand -group Pins /test_top/z80/nRFSH
add wave -noupdate -expand -group Pins /test_top/z80/nHALT
add wave -noupdate -expand -group Pins /test_top/z80/nBUSACK
add wave -noupdate -expand -group Pins /test_top/z80/nWAIT
add wave -noupdate -expand -group Pins -color Gold /test_top/z80/nINT
add wave -noupdate -expand -group Pins /test_top/dut/interrupts/int_armed
add wave -noupdate -expand -group Pins -color Gold /test_top/dut/interrupts/in_intr
add wave -noupdate -expand -group Pins -color Magenta /test_top/z80/nNMI
add wave -noupdate -expand -group Pins /test_top/dut/interrupts/nmi_armed
add wave -noupdate -expand -group Pins /test_top/dut/interrupts/test1
add wave -noupdate -expand -group Pins -color Pink /test_top/dut/interrupts/in_nmi
add wave -noupdate -expand -group Pins /test_top/dut/interrupts/ctl_no_ints
add wave -noupdate -expand -group Pins /test_top/z80/nRESET
add wave -noupdate -expand -group Pins /test_top/z80/nBUSRQ
add wave -noupdate -group reset /test_top/dut/reset_block/clk
add wave -noupdate -group reset /test_top/dut/reset_block/reset_in
add wave -noupdate -group reset /test_top/dut/reset_block/fpga_reset
add wave -noupdate -group reset /test_top/dut/reset_block/x1
add wave -noupdate -group reset /test_top/dut/reset_block/x2
add wave -noupdate -group reset /test_top/dut/reset_block/x3
add wave -noupdate -group reset /test_top/dut/reset_block/M1
add wave -noupdate -group reset /test_top/dut/reset_block/T2
add wave -noupdate -group reset /test_top/dut/reset_block/clrpc
add wave -noupdate -group reset /test_top/dut/reset_block/reset
add wave -noupdate -group reset /test_top/dut/reset_block/nreset
add wave -noupdate -radix hexadecimal -childformat {{{/test_top/z80/A[15]} -radix hexadecimal} {{/test_top/z80/A[14]} -radix hexadecimal} {{/test_top/z80/A[13]} -radix hexadecimal} {{/test_top/z80/A[12]} -radix hexadecimal} {{/test_top/z80/A[11]} -radix hexadecimal} {{/test_top/z80/A[10]} -radix hexadecimal} {{/test_top/z80/A[9]} -radix hexadecimal} {{/test_top/z80/A[8]} -radix hexadecimal} {{/test_top/z80/A[7]} -radix hexadecimal} {{/test_top/z80/A[6]} -radix hexadecimal} {{/test_top/z80/A[5]} -radix hexadecimal} {{/test_top/z80/A[4]} -radix hexadecimal} {{/test_top/z80/A[3]} -radix hexadecimal} {{/test_top/z80/A[2]} -radix hexadecimal} {{/test_top/z80/A[1]} -radix hexadecimal} {{/test_top/z80/A[0]} -radix hexadecimal}} -subitemconfig {{/test_top/z80/A[15]} {-height 15 -radix hexadecimal} {/test_top/z80/A[14]} {-height 15 -radix hexadecimal} {/test_top/z80/A[13]} {-height 15 -radix hexadecimal} {/test_top/z80/A[12]} {-height 15 -radix hexadecimal} {/test_top/z80/A[11]} {-height 15 -radix hexadecimal} {/test_top/z80/A[10]} {-height 15 -radix hexadecimal} {/test_top/z80/A[9]} {-height 15 -radix hexadecimal} {/test_top/z80/A[8]} {-height 15 -radix hexadecimal} {/test_top/z80/A[7]} {-height 15 -radix hexadecimal} {/test_top/z80/A[6]} {-height 15 -radix hexadecimal} {/test_top/z80/A[5]} {-height 15 -radix hexadecimal} {/test_top/z80/A[4]} {-height 15 -radix hexadecimal} {/test_top/z80/A[3]} {-height 15 -radix hexadecimal} {/test_top/z80/A[2]} {-height 15 -radix hexadecimal} {/test_top/z80/A[1]} {-height 15 -radix hexadecimal} {/test_top/z80/A[0]} {-height 15 -radix hexadecimal}} /test_top/z80/A
add wave -noupdate -radix hexadecimal /test_top/z80/D
add wave -noupdate -expand -group sequencer /test_top/dut/setM1
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer/M1
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer/M2
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer/M3
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer/M4
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer/M5
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer/T1
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer/T2
add wave -noupdate -expand -group sequencer /test_top/dut/pin_control/Tw1
add wave -noupdate -expand -group sequencer /test_top/dut/pin_control/Tw2
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer/T3
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer/T4
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer/T5
add wave -noupdate -group {data pins} /test_top/dut/data_pins/bus_db_pin_oe
add wave -noupdate -group {data pins} /test_top/dut/data_pins/bus_db_pin_re
add wave -noupdate -group {data pins} /test_top/dut/data_pins/bus_db_oe
add wave -noupdate -group {data pins} -label {DB Latch} -radix hexadecimal /test_top/dut/data_pins/SYNTHESIZED_WIRE_6
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch/ctl_bus_inc_oe
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch/ctl_inc_cy
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch/ctl_inc_dec
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch/ctl_inc_zero
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch/ctl_al_we
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch/ctl_ab_mux_inc
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch/ctl_inc_limit6
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch/address_is_1
add wave -noupdate -expand -group al -radix hexadecimal /test_top/dut/address_latch/abus
add wave -noupdate -expand -group al -radix hexadecimal -childformat {{{/test_top/dut/address_latch/address[15]} -radix hexadecimal} {{/test_top/dut/address_latch/address[14]} -radix hexadecimal} {{/test_top/dut/address_latch/address[13]} -radix hexadecimal} {{/test_top/dut/address_latch/address[12]} -radix hexadecimal} {{/test_top/dut/address_latch/address[11]} -radix hexadecimal} {{/test_top/dut/address_latch/address[10]} -radix hexadecimal} {{/test_top/dut/address_latch/address[9]} -radix hexadecimal} {{/test_top/dut/address_latch/address[8]} -radix hexadecimal} {{/test_top/dut/address_latch/address[7]} -radix hexadecimal} {{/test_top/dut/address_latch/address[6]} -radix hexadecimal} {{/test_top/dut/address_latch/address[5]} -radix hexadecimal} {{/test_top/dut/address_latch/address[4]} -radix hexadecimal} {{/test_top/dut/address_latch/address[3]} -radix hexadecimal} {{/test_top/dut/address_latch/address[2]} -radix hexadecimal} {{/test_top/dut/address_latch/address[1]} -radix hexadecimal} {{/test_top/dut/address_latch/address[0]} -radix hexadecimal}} -subitemconfig {{/test_top/dut/address_latch/address[15]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[14]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[13]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[12]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[11]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[10]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[9]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[8]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[7]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[6]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[5]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[4]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[3]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[2]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[1]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch/address[0]} {-height 15 -radix hexadecimal}} /test_top/dut/address_latch/address
add wave -noupdate -group IR /test_top/dut/instruction_reg/ctl_ir_we
add wave -noupdate -group IR -radix hexadecimal /test_top/dut/instruction_reg/db
add wave -noupdate -group IR -radix hexadecimal -childformat {{{/test_top/dut/instruction_reg/opcode[7]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[6]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[5]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[4]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[3]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[2]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[1]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[0]} -radix hexadecimal}} -subitemconfig {{/test_top/dut/instruction_reg/opcode[7]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[6]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[5]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[4]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[3]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[2]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[1]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[0]} {-height 15 -radix hexadecimal}} /test_top/dut/instruction_reg/opcode
add wave -noupdate -group IR -expand -group PLA /test_top/dut/pla_decode/prefix
add wave -noupdate -group IR -expand -group PLA -radix hexadecimal /test_top/dut/pla_decode/opcode
add wave -noupdate -group IR -expand -group PLA /test_top/dut/pla_decode/pla
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control/fFetch
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control/fMRead
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control/fMWrite
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control/fIORead
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control/fIOWrite
add wave -noupdate -group busses /test_top/dut/bus_control/ctl_bus_ff_oe
add wave -noupdate -group busses /test_top/dut/bus_control/ctl_bus_zero_oe
add wave -noupdate -group busses /test_top/dut/bus_control/ctl_bus_db_oe
add wave -noupdate -group busses -radix hexadecimal /test_top/dut/db0
add wave -noupdate -group busses -radix hexadecimal /test_top/dut/db1
add wave -noupdate -group busses -radix hexadecimal /test_top/dut/db2
add wave -noupdate -group busses -radix hexadecimal /test_top/dut/db_hi_as
add wave -noupdate -group busses -radix hexadecimal /test_top/dut/db_lo_as
add wave -noupdate -group busses -expand -group switches /test_top/dut/bus_switch/ctl_sw_1u
add wave -noupdate -group busses -expand -group switches /test_top/dut/bus_switch/ctl_sw_1d
add wave -noupdate -group busses -expand -group switches /test_top/dut/bus_switch/ctl_sw_2u
add wave -noupdate -group busses -expand -group switches /test_top/dut/bus_switch/ctl_sw_2d
add wave -noupdate -radix hexadecimal /test_top/dut/reg_file/HL2
add wave -noupdate -radix hexadecimal /test_top/dut/reg_file/DE2
add wave -noupdate -radix hexadecimal /test_top/dut/reg_file/SP
add wave -noupdate -radix hexadecimal /test_top/dut/reg_file/PC
add wave -noupdate -radix hexadecimal -childformat {{(15) -radix hexadecimal} {(14) -radix hexadecimal} {(13) -radix hexadecimal} {(12) -radix hexadecimal} {(11) -radix hexadecimal} {(10) -radix hexadecimal} {(9) -radix hexadecimal} {(8) -radix hexadecimal} {(7) -radix hexadecimal} {(6) -radix hexadecimal} {(5) -radix hexadecimal} {(4) -radix hexadecimal} {(3) -radix hexadecimal} {(2) -radix hexadecimal} {(1) -radix hexadecimal} {(0) -radix hexadecimal}} -subitemconfig {{/test_top/dut/reg_file/b2v_latch_wz_hi/SYNTHESIZED_WIRE_0[7]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_hi/SYNTHESIZED_WIRE_0[6]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_hi/SYNTHESIZED_WIRE_0[5]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_hi/SYNTHESIZED_WIRE_0[4]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_hi/SYNTHESIZED_WIRE_0[3]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_hi/SYNTHESIZED_WIRE_0[2]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_hi/SYNTHESIZED_WIRE_0[1]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_hi/SYNTHESIZED_WIRE_0[0]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_lo/SYNTHESIZED_WIRE_0[7]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_lo/SYNTHESIZED_WIRE_0[6]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_lo/SYNTHESIZED_WIRE_0[5]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_lo/SYNTHESIZED_WIRE_0[4]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_lo/SYNTHESIZED_WIRE_0[3]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_lo/SYNTHESIZED_WIRE_0[2]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_lo/SYNTHESIZED_WIRE_0[1]} {-radix hexadecimal} {/test_top/dut/reg_file/b2v_latch_wz_lo/SYNTHESIZED_WIRE_0[0]} {-radix hexadecimal}} /test_top/dut/reg_file/WZ
add wave -noupdate /test_top/dut/reg_file/IR
add wave -noupdate -group {interrupt
} /test_top/dut/interrupts/IM
add wave -noupdate -group {interrupt
} /test_top/dut/ctl_iff1_iff2
add wave -noupdate -group {interrupt
} /test_top/dut/ctl_iffx_we
add wave -noupdate -group {interrupt
} /test_top/dut/ctl_iffx_bit
add wave -noupdate -group {interrupt
} /test_top/dut/ctl_im_we
add wave -noupdate -group {interrupt
} /test_top/dut/ctl_no_ints
add wave -noupdate -group {interrupt
} /test_top/dut/interrupts/iff1
add wave -noupdate -group {interrupt
} /test_top/dut/interrupts/iff2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100800 ns} 0} {{Cursor 2} {3765900 ns} 0}
quietly wave cursor active 2
configure wave -namecolwidth 203
configure wave -valuecolwidth 49
configure wave -justifyvalue right
configure wave -signalnamewidth 2
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits us
update
WaveRestoreZoom {3763500 ns} {3777100 ns}
