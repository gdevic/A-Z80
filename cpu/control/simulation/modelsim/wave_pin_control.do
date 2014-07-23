onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_pin_control/clk
add wave -noupdate /test_pin_control/mwait
add wave -noupdate /test_pin_control/busrq
add wave -noupdate /test_pin_control/intr
add wave -noupdate /test_pin_control/nmi
add wave -noupdate /test_pin_control/reset
add wave -noupdate /test_pin_control/m1
add wave -noupdate /test_pin_control/mreq
add wave -noupdate /test_pin_control/iorq
add wave -noupdate /test_pin_control/rd
add wave -noupdate /test_pin_control/wr
add wave -noupdate /test_pin_control/rfsh
add wave -noupdate /test_pin_control/busack
add wave -noupdate /test_pin_control/T1
add wave -noupdate /test_pin_control/T2
add wave -noupdate /test_pin_control/Tw1
add wave -noupdate /test_pin_control/Tw2
add wave -noupdate /test_pin_control/T3
add wave -noupdate /test_pin_control/T4
add wave -noupdate /test_pin_control/T5
add wave -noupdate /test_pin_control/T6
add wave -noupdate /test_pin_control/fFetch
add wave -noupdate /test_pin_control/fMRead
add wave -noupdate /test_pin_control/fMWrite
add wave -noupdate /test_pin_control/fIORead
add wave -noupdate /test_pin_control/fIOWrite
add wave -noupdate /test_pin_control/fIntr
add wave -noupdate /test_pin_control/hold_clk_timing
add wave -noupdate /test_pin_control/hold_clk_delay
add wave -noupdate /test_pin_control/hold_clk
add wave -noupdate /test_pin_control/T2_en
add wave -noupdate /test_pin_control/ctl_bus_pin_oe
add wave -noupdate /test_pin_control/ctl_ab_pin_oe
add wave -noupdate /test_pin_control/ctl_ab_we
add wave -noupdate /test_pin_control/ctl_db_pin_oe
add wave -noupdate /test_pin_control/ctl_db_pin_re
add wave -noupdate /test_pin_control/ctl_db_we
add wave -noupdate /test_pin_control/ctl_db_oe
add wave -noupdate /test_pin_control/M1
add wave -noupdate /test_pin_control/M2
add wave -noupdate /test_pin_control/M3
add wave -noupdate /test_pin_control/M4
add wave -noupdate /test_pin_control/M5
add wave -noupdate /test_pin_control/M6
add wave -noupdate /test_pin_control/nextM
add wave -noupdate /test_pin_control/setM1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {500 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 199
configure wave -valuecolwidth 64
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
WaveRestoreZoom {0 ps} {3200 ps}
