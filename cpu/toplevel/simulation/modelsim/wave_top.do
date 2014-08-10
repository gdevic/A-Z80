onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_top/z80/CLK
add wave -noupdate /test_top/z80/nM1
add wave -noupdate /test_top/z80/nMREQ
add wave -noupdate /test_top/z80/nIORQ
add wave -noupdate /test_top/z80/nRD
add wave -noupdate /test_top/z80/nWR
add wave -noupdate /test_top/z80/nRFSH
add wave -noupdate /test_top/z80/nHALT
add wave -noupdate /test_top/z80/nBUSACK
add wave -noupdate /test_top/z80/nWAIT
add wave -noupdate /test_top/z80/nINT
add wave -noupdate /test_top/z80/nNMI
add wave -noupdate /test_top/z80/nRESET
add wave -noupdate /test_top/z80/nBUSRQ
add wave -noupdate -radix hexadecimal /test_top/z80/A
add wave -noupdate -radix hexadecimal /test_top/z80/D
add wave -noupdate -group sequencer /test_top/dut/sequencer/clk
add wave -noupdate -group sequencer /test_top/dut/sequencer/nextM
add wave -noupdate -group sequencer /test_top/dut/sequencer/setM1
add wave -noupdate -group sequencer /test_top/dut/sequencer/hold_clk
add wave -noupdate -group sequencer /test_top/dut/sequencer/reset
add wave -noupdate -group sequencer /test_top/dut/sequencer/T2_en
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
add wave -noupdate -expand -group IR /test_top/dut/instruction_reg/ctl_ir_we
add wave -noupdate -expand -group IR -radix hexadecimal /test_top/dut/instruction_reg/db
add wave -noupdate -expand -group IR -radix hexadecimal -childformat {{{/test_top/dut/instruction_reg/opcode[7]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[6]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[5]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[4]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[3]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[2]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[1]} -radix hexadecimal} {{/test_top/dut/instruction_reg/opcode[0]} -radix hexadecimal}} -subitemconfig {{/test_top/dut/instruction_reg/opcode[7]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[6]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[5]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[4]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[3]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[2]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[1]} {-height 15 -radix hexadecimal} {/test_top/dut/instruction_reg/opcode[0]} {-height 15 -radix hexadecimal}} /test_top/dut/instruction_reg/opcode
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db0
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db1
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db2
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db_hi_as
add wave -noupdate -expand -group busses -radix hexadecimal /test_top/dut/db_lo_as
add wave -noupdate -expand -group switches /test_top/dut/bus_switch/ctl_sw_1u
add wave -noupdate -expand -group switches /test_top/dut/bus_switch/ctl_sw_1d
add wave -noupdate -expand -group switches /test_top/dut/bus_switch/ctl_sw_2u
add wave -noupdate -expand -group switches /test_top/dut/bus_switch/ctl_sw_2d
add wave -noupdate -expand -group switches /test_top/dut/bus_switch/bus_sw_1u
add wave -noupdate -expand -group switches /test_top/dut/bus_switch/bus_sw_1d
add wave -noupdate -expand -group switches /test_top/dut/bus_switch/bus_sw_2u
add wave -noupdate -expand -group switches /test_top/dut/bus_switch/bus_sw_2d
add wave -noupdate -expand -group PLA /test_top/dut/pla_decode/prefix
add wave -noupdate -expand -group PLA /test_top/dut/pla_decode/opcode
add wave -noupdate -expand -group PLA /test_top/dut/pla_decode/pla
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {900 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {400 ps} {2100 ps}
