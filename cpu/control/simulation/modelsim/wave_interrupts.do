onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -itemcolor Gold /test_interrupts/iff1
add wave -noupdate -color Gold -itemcolor Gold /test_interrupts/iff2
add wave -noupdate /test_interrupts/ctl_iffx_set
add wave -noupdate /test_interrupts/ctl_iffx_clr
add wave -noupdate /test_interrupts/ctl_iff1_iff2
add wave -noupdate /test_interrupts/ctl_iff1_clr
add wave -noupdate -color Gold -itemcolor Gold /test_interrupts/im1
add wave -noupdate -color Gold -itemcolor Gold /test_interrupts/im2
add wave -noupdate /test_interrupts/ctl_im_sel3
add wave -noupdate /test_interrupts/ctl_im_sel4
add wave -noupdate /test_interrupts/ctl_im_set
add wave -noupdate /test_interrupts/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 202
configure wave -valuecolwidth 66
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
WaveRestoreZoom {0 ps} {2800 ps}
