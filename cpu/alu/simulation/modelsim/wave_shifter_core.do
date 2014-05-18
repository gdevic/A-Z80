onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_shifter_core/db_sig
add wave -noupdate /test_shifter_core/shift_in_sig
add wave -noupdate /test_shifter_core/shift_enable_sig
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_shifter_core/out_sig
add wave -noupdate /test_shifter_core/oe_sig
add wave -noupdate /test_shifter_core/cy_out_sig
add wave -noupdate /test_shifter_core/shift_right_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 205
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
WaveRestoreZoom {200 ps} {1100 ps}
