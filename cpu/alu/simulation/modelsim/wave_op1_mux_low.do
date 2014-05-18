onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_op1_mux_low/ll_sig
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_op1_mux_low/jj_sig
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_op1_mux_low/Q_sig
add wave -noupdate /test_op1_mux_low/sel_kk_sig
add wave -noupdate /test_op1_mux_low/sel_ll_sig
add wave -noupdate /test_op1_mux_low/sel_jj_sig
add wave -noupdate /test_op1_mux_low/ena_out_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 192
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
