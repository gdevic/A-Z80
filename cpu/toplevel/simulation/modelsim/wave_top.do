onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Pins /test_top/z80/CLK
add wave -noupdate -expand -group Pins /test_top/z80/nM1
add wave -noupdate -expand -group Pins /test_top/z80/nMREQ
add wave -noupdate -expand -group Pins /test_top/z80/nIORQ
add wave -noupdate -expand -group Pins /test_top/z80/nRD
add wave -noupdate -expand -group Pins /test_top/z80/nWR
add wave -noupdate -expand -group Pins /test_top/z80/nRFSH
add wave -noupdate -expand -group Pins /test_top/z80/nHALT
add wave -noupdate -expand -group Pins /test_top/z80/nBUSACK
add wave -noupdate -expand -group Pins /test_top/z80/nWAIT
add wave -noupdate -expand -group Pins /test_top/z80/nINT
add wave -noupdate -expand -group Pins /test_top/z80/nNMI
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
add wave -noupdate -group sequencer /test_top/dut/sequencer/clk
add wave -noupdate -group sequencer /test_top/dut/sequencer/nextM
add wave -noupdate -group sequencer /test_top/dut/sequencer/setM1
add wave -noupdate -group sequencer /test_top/dut/sequencer/reset
add wave -noupdate -group sequencer /test_top/dut/sequencer/T2_en
add wave -noupdate -group sequencer /test_top/dut/sequencer/hold_clk1
add wave -noupdate -group sequencer /test_top/dut/sequencer/hold_clk2
add wave -noupdate -group sequencer /test_top/dut/sequencer/M1
add wave -noupdate -group sequencer /test_top/dut/sequencer/M2
add wave -noupdate -group sequencer /test_top/dut/sequencer/M3
add wave -noupdate -group sequencer /test_top/dut/sequencer/M4
add wave -noupdate -group sequencer /test_top/dut/sequencer/M5
add wave -noupdate -group sequencer /test_top/dut/sequencer/M6
add wave -noupdate -group sequencer /test_top/dut/sequencer/T1
add wave -noupdate -group sequencer /test_top/dut/sequencer/T2
add wave -noupdate -group sequencer /test_top/dut/sequencer/T3
add wave -noupdate -group sequencer /test_top/dut/sequencer/T4
add wave -noupdate -group sequencer /test_top/dut/sequencer/T5
add wave -noupdate -group sequencer /test_top/dut/sequencer/T6
add wave -noupdate -group {data pins} /test_top/dut/data_pins/bus_db_pin_oe
add wave -noupdate -group {data pins} /test_top/dut/data_pins/bus_db_pin_re
add wave -noupdate -group {data pins} /test_top/dut/data_pins/bus_db_oe
add wave -noupdate -group {data pins} -label {DB Latch} -radix hexadecimal /test_top/dut/data_pins/SYNTHESIZED_WIRE_6
add wave -noupdate -group al /test_top/dut/address_latch/ctl_bus_inc_we
add wave -noupdate -group al /test_top/dut/address_latch/ctl_inc_cy
add wave -noupdate -group al /test_top/dut/address_latch/ctl_inc_dec
add wave -noupdate -group al /test_top/dut/address_latch/ctl_inc_zero
add wave -noupdate -group al /test_top/dut/address_latch/ctl_al_we
add wave -noupdate -group al /test_top/dut/address_latch/ctl_ab_mux_inc
add wave -noupdate -group al /test_top/dut/address_latch/ctl_inc_limit6
add wave -noupdate -group al /test_top/dut/address_latch/address_is_1
add wave -noupdate -group al -radix hexadecimal /test_top/dut/address_latch/abus
add wave -noupdate -group al -radix hexadecimal /test_top/dut/address_latch/address
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
add wave -noupdate -expand -group busses /test_top/dut/bus_control/ctl_bus_ff_oe
add wave -noupdate -expand -group busses /test_top/dut/bus_control/ctl_bus_zero_oe
add wave -noupdate -expand -group busses /test_top/dut/bus_control/ctl_bus_db_oe
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db0
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db1
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db2
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db_hi_as
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db_lo_as
add wave -noupdate -expand -group busses -group switches /test_top/dut/bus_switch/ctl_sw_1u
add wave -noupdate -expand -group busses -group switches /test_top/dut/bus_switch/ctl_sw_1d
add wave -noupdate -expand -group busses -group switches /test_top/dut/bus_switch/ctl_sw_2u
add wave -noupdate -expand -group busses -group switches /test_top/dut/bus_switch/ctl_sw_2d
add wave -noupdate -expand -group busses -group switches /test_top/dut/bus_switch/bus_sw_1u
add wave -noupdate -expand -group busses -group switches /test_top/dut/bus_switch/bus_sw_1d
add wave -noupdate -expand -group busses -group switches /test_top/dut/bus_switch/bus_sw_2u
add wave -noupdate -expand -group busses -group switches /test_top/dut/bus_switch/bus_sw_2d
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 321
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {5300 ps}
