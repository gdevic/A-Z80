onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_reset/reset_in
add wave -noupdate /test_reset/fpga_reset
add wave -noupdate /test_reset/M1
add wave -noupdate /test_reset/T2
add wave -noupdate -color Gold /test_reset/clrpc
add wave -noupdate -color Red /test_reset/reset
add wave -noupdate /test_reset/nreset
add wave -noupdate /test_reset/clk
add wave -noupdate -color {Cadet Blue} /test_reset/reset_block/x1
add wave -noupdate -color {Cadet Blue} /test_reset/reset_block/x2
add wave -noupdate -color {Cadet Blue} /test_reset/reset_block/x3
TreeUpdate [SetDefaultTree]
configure wave -namecolwidth 150
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {4 ns}
