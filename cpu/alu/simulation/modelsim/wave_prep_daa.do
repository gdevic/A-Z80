onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_prep_daa/low_sig
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_prep_daa/high_sig
add wave -noupdate /test_prep_daa/low_gt_9_sig
add wave -noupdate /test_prep_daa/high_gt_9_sig
add wave -noupdate /test_prep_daa/high_eq_9_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1 ns}
