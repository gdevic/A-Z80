onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /test_bus/db
add wave -noupdate -radix hexadecimal /test_bus/db_sig
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_bus/address_sig
add wave -noupdate /test_bus/ctl_ab_mux_inc_sig
add wave -noupdate /test_bus/ctl_al_we_sig
add wave -noupdate /test_bus/ctl_bus_inc_oe_sig
add wave -noupdate /test_bus/ctl_inc_dec_sig
add wave -noupdate /test_bus/ctl_inc_limit6_sig
add wave -noupdate /test_bus/ctl_inc_cy_sig
add wave -noupdate /test_bus/ctl_inc_zero_sig
add wave -noupdate /test_bus/address_is_1_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {400 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 189
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
