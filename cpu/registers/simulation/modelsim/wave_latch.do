onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_latch/db
add wave -noupdate /test_latch/db_sig
add wave -noupdate /test_latch/oe_sig
add wave -noupdate /test_latch/we_sig
TreeUpdate [SetDefaultTree]
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
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1800 ps}
