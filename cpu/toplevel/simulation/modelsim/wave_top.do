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
add wave -noupdate -expand -group al /test_top/dut/address_latch/ctl_bus_inc_we
add wave -noupdate -expand -group al /test_top/dut/address_latch/ctl_inc_cy
add wave -noupdate -expand -group al /test_top/dut/address_latch/ctl_inc_dec
add wave -noupdate -expand -group al /test_top/dut/address_latch/ctl_inc_zero
add wave -noupdate -expand -group al /test_top/dut/address_latch/ctl_al_we
add wave -noupdate -expand -group al /test_top/dut/address_latch/ctl_ab_mux_inc
add wave -noupdate -expand -group al /test_top/dut/address_latch/ctl_inc_limit6
add wave -noupdate -expand -group al /test_top/dut/address_latch/address_is_1
add wave -noupdate -expand -group al -radix hexadecimal /test_top/dut/address_latch/abus
add wave -noupdate -expand -group al -radix hexadecimal /test_top/dut/address_latch/address
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {300 ps} 0}
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
WaveRestoreZoom {0 ps} {2100 ps}
