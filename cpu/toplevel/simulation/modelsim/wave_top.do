onerror {resume}
quietly virtual function -install /test_top/dut/interrupts_ -env /test_top { &{/test_top/dut/interrupts_/im2, /test_top/dut/interrupts_/im1 }} IM
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
add wave -noupdate -expand -group Pins /test_top/dut/interrupts_/int_armed
add wave -noupdate -expand -group Pins -color Gold /test_top/dut/interrupts_/in_intr
add wave -noupdate -expand -group Pins -color Magenta /test_top/z80/nNMI
add wave -noupdate -expand -group Pins /test_top/dut/interrupts_/nmi_armed
add wave -noupdate -expand -group Pins /test_top/dut/interrupts_/test1
add wave -noupdate -expand -group Pins -color Pink /test_top/dut/interrupts_/in_nmi
add wave -noupdate -expand -group Pins /test_top/dut/interrupts_/ctl_no_ints
add wave -noupdate -expand -group Pins /test_top/z80/nRESET
add wave -noupdate -expand -group Pins /test_top/z80/nBUSRQ
add wave -noupdate -group reset /test_top/dut/reset_block_/clk
add wave -noupdate -group reset /test_top/dut/reset_block_/reset_in
add wave -noupdate -group reset /test_top/dut/reset_block_/fpga_reset
add wave -noupdate -group reset /test_top/dut/reset_block_/x1
add wave -noupdate -group reset /test_top/dut/reset_block_/x2
add wave -noupdate -group reset /test_top/dut/reset_block_/x3
add wave -noupdate -group reset /test_top/dut/reset_block_/M1
add wave -noupdate -group reset /test_top/dut/reset_block_/T2
add wave -noupdate -group reset /test_top/dut/reset_block_/clrpc
add wave -noupdate -group reset /test_top/dut/reset_block_/reset
add wave -noupdate -group reset /test_top/dut/reset_block_/nreset
add wave -noupdate -radix hexadecimal -childformat {{{/test_top/z80/A[15]} -radix hexadecimal} {{/test_top/z80/A[14]} -radix hexadecimal} {{/test_top/z80/A[13]} -radix hexadecimal} {{/test_top/z80/A[12]} -radix hexadecimal} {{/test_top/z80/A[11]} -radix hexadecimal} {{/test_top/z80/A[10]} -radix hexadecimal} {{/test_top/z80/A[9]} -radix hexadecimal} {{/test_top/z80/A[8]} -radix hexadecimal} {{/test_top/z80/A[7]} -radix hexadecimal} {{/test_top/z80/A[6]} -radix hexadecimal} {{/test_top/z80/A[5]} -radix hexadecimal} {{/test_top/z80/A[4]} -radix hexadecimal} {{/test_top/z80/A[3]} -radix hexadecimal} {{/test_top/z80/A[2]} -radix hexadecimal} {{/test_top/z80/A[1]} -radix hexadecimal} {{/test_top/z80/A[0]} -radix hexadecimal}} -subitemconfig {{/test_top/z80/A[15]} {-height 15 -radix hexadecimal} {/test_top/z80/A[14]} {-height 15 -radix hexadecimal} {/test_top/z80/A[13]} {-height 15 -radix hexadecimal} {/test_top/z80/A[12]} {-height 15 -radix hexadecimal} {/test_top/z80/A[11]} {-height 15 -radix hexadecimal} {/test_top/z80/A[10]} {-height 15 -radix hexadecimal} {/test_top/z80/A[9]} {-height 15 -radix hexadecimal} {/test_top/z80/A[8]} {-height 15 -radix hexadecimal} {/test_top/z80/A[7]} {-height 15 -radix hexadecimal} {/test_top/z80/A[6]} {-height 15 -radix hexadecimal} {/test_top/z80/A[5]} {-height 15 -radix hexadecimal} {/test_top/z80/A[4]} {-height 15 -radix hexadecimal} {/test_top/z80/A[3]} {-height 15 -radix hexadecimal} {/test_top/z80/A[2]} {-height 15 -radix hexadecimal} {/test_top/z80/A[1]} {-height 15 -radix hexadecimal} {/test_top/z80/A[0]} {-height 15 -radix hexadecimal}} /test_top/z80/A
add wave -noupdate -radix hexadecimal -childformat {{{/test_top/z80/D[7]} -radix hexadecimal} {{/test_top/z80/D[6]} -radix hexadecimal} {{/test_top/z80/D[5]} -radix hexadecimal} {{/test_top/z80/D[4]} -radix hexadecimal} {{/test_top/z80/D[3]} -radix hexadecimal} {{/test_top/z80/D[2]} -radix hexadecimal} {{/test_top/z80/D[1]} -radix hexadecimal} {{/test_top/z80/D[0]} -radix hexadecimal}} -subitemconfig {{/test_top/z80/D[7]} {-height 15 -radix hexadecimal} {/test_top/z80/D[6]} {-height 15 -radix hexadecimal} {/test_top/z80/D[5]} {-height 15 -radix hexadecimal} {/test_top/z80/D[4]} {-height 15 -radix hexadecimal} {/test_top/z80/D[3]} {-height 15 -radix hexadecimal} {/test_top/z80/D[2]} {-height 15 -radix hexadecimal} {/test_top/z80/D[1]} {-height 15 -radix hexadecimal} {/test_top/z80/D[0]} {-height 15 -radix hexadecimal}} /test_top/z80/D
add wave -noupdate -expand -group sequencer /test_top/dut/setM1
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer_/M1
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer_/M2
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer_/M3
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer_/M4
add wave -noupdate -expand -group sequencer /test_top/dut/sequencer_/M5
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer_/T1
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer_/T2
add wave -noupdate -expand -group sequencer /test_top/dut/pin_control_/Tw1
add wave -noupdate -expand -group sequencer /test_top/dut/pin_control_/Tw2
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer_/T3
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer_/T4
add wave -noupdate -expand -group sequencer -color {Lime Green} /test_top/dut/sequencer_/T5
add wave -noupdate -group {data pins} /test_top/dut/data_pins_/bus_db_pin_oe
add wave -noupdate -group {data pins} /test_top/dut/data_pins_/bus_db_pin_re
add wave -noupdate -group {data pins} /test_top/dut/data_pins_/bus_db_oe
add wave -noupdate -group {data pins} -label {DB Latch} -radix hexadecimal /test_top/dut/data_pins_/SYNTHESIZED_WIRE_6
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch_/ctl_bus_inc_oe
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch_/ctl_inc_cy
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch_/ctl_inc_dec
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch_/ctl_inc_zero
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch_/ctl_al_we
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch_/ctl_inc_limit6
add wave -noupdate -expand -group al -expand -group al -group {ctl
} /test_top/dut/address_latch_/address_is_1
add wave -noupdate -expand -group al -radix hexadecimal /test_top/dut/address_latch_/abus
add wave -noupdate -expand -group al -radix hexadecimal -childformat {{{/test_top/dut/address_latch_/address[15]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[14]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[13]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[12]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[11]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[10]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[9]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[8]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[7]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[6]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[5]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[4]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[3]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[2]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[1]} -radix hexadecimal} {{/test_top/dut/address_latch_/address[0]} -radix hexadecimal}} -subitemconfig {{/test_top/dut/address_latch_/address[15]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[14]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[13]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[12]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[11]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[10]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[9]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[8]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[7]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[6]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[5]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[4]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[3]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[2]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[1]} {-height 15 -radix hexadecimal} {/test_top/dut/address_latch_/address[0]} {-height 15 -radix hexadecimal}} /test_top/dut/address_latch_/address
add wave -noupdate -group IR /test_top/dut/instruction_reg_/ctl_ir_we
add wave -noupdate -group IR -radix hexadecimal /test_top/dut/instruction_reg_/db
add wave -noupdate -group IR -radix hexadecimal -childformat {{{/test_top/dut/instruction_reg_/opcode[7]} -radix hexadecimal} {{/test_top/dut/instruction_reg_/opcode[6]} -radix hexadecimal} {{/test_top/dut/instruction_reg_/opcode[5]} -radix hexadecimal} {{/test_top/dut/instruction_reg_/opcode[4]} -radix hexadecimal} {{/test_top/dut/instruction_reg_/opcode[3]} -radix hexadecimal} {{/test_top/dut/instruction_reg_/opcode[2]} -radix hexadecimal} {{/test_top/dut/instruction_reg_/opcode[1]} -radix hexadecimal} {{/test_top/dut/instruction_reg_/opcode[0]} -radix hexadecimal}} -subitemconfig {{/test_top/dut/instruction_reg_/opcode[7]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg_/opcode[6]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg_/opcode[5]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg_/opcode[4]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg_/opcode[3]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg_/opcode[2]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg_/opcode[1]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg_/opcode[0]} {-height 15 -radix hexadecimal}} /test_top/dut/instruction_reg_/opcode
add wave -noupdate -group IR -expand -group PLA /test_top/dut/pla_decode_/prefix
add wave -noupdate -group IR -expand -group PLA -radix hexadecimal /test_top/dut/pla_decode_/opcode
add wave -noupdate -group IR -expand -group PLA /test_top/dut/pla_decode_/pla
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control_/fFetch
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control_/fMRead
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control_/fMWrite
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control_/fIORead
add wave -noupdate -group IR -expand -group function /test_top/dut/pin_control_/fIOWrite
add wave -noupdate -expand -group busses /test_top/dut/bus_control_/ctl_bus_ff_oe
add wave -noupdate -expand -group busses /test_top/dut/bus_control_/ctl_bus_zero_oe
add wave -noupdate -expand -group busses /test_top/dut/bus_control_/ctl_bus_db_oe
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db0
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db1
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db2
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db_hi_as
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db_lo_as
add wave -noupdate -expand -group busses -expand -group switches /test_top/dut/bus_switch_/ctl_sw_1u
add wave -noupdate -expand -group busses -expand -group switches /test_top/dut/bus_switch_/ctl_sw_1d
add wave -noupdate -expand -group busses -expand -group switches /test_top/dut/bus_switch_/ctl_sw_2u
add wave -noupdate -expand -group busses -expand -group switches /test_top/dut/bus_switch_/ctl_sw_2d
add wave -noupdate -group {interrupt
} /test_top/dut/interrupts_/IM
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
} /test_top/dut/interrupts_/iff1
add wave -noupdate -group {interrupt
} /test_top/dut/interrupts_/iff2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {105900 ns} 0} {{Cursor 2} {3765900 ns} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {1956900 ns} {1970500 ns}
