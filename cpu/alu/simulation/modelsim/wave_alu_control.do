onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Shifter -color Gold -itemcolor Gold /test_alu_control/shift_cf_out
add wave -noupdate -expand -group Shifter -color Gold -itemcolor Gold /test_alu_control/alu_shift_left
add wave -noupdate -expand -group Shifter -color Gold -itemcolor Gold /test_alu_control/alu_shift_right
add wave -noupdate -expand -group Shifter -color Gold -itemcolor Gold /test_alu_control/alu_shift_in
add wave -noupdate -expand -group Shifter /test_alu_control/alu_shift_db7
add wave -noupdate -expand -group Shifter /test_alu_control/alu_shift_db0
add wave -noupdate -expand -group Shifter /test_alu_control/ctl_shift_en
add wave -noupdate -expand -group Shifter /test_alu_control/op543
add wave -noupdate -expand -group Shifter /test_alu_control/shift_cf_in
add wave -noupdate -expand -group DAA -color Gold -itemcolor Gold -radix hexadecimal /test_alu_control/db
add wave -noupdate -expand -group DAA /test_alu_control/ctl_daa_oe
add wave -noupdate -expand -group DAA /test_alu_control/ctl_daa_66
add wave -noupdate -expand -group DAA /test_alu_control/alu_low_gt_9
add wave -noupdate -expand -group DAA /test_alu_control/alu_high_eq_9
add wave -noupdate -expand -group DAA /test_alu_control/alu_high_gt_9
add wave -noupdate -expand -group DAA /test_alu_control/flags_hf
add wave -noupdate -expand -group DAA /test_alu_control/flags_cf
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
WaveRestoreZoom {0 ps} {900 ps}
