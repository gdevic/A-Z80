onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /test_mux_3z/a_sig
add wave -noupdate -radix hexadecimal /test_mux_3z/b_sig
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_mux_3z/Q_sig
add wave -noupdate /test_mux_3z/sel_a_sig
add wave -noupdate /test_mux_3z/sel_b_sig
add wave -noupdate /test_mux_3z/sel_zero_sig
add wave -noupdate /test_mux_3z/ena_out_sig
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
