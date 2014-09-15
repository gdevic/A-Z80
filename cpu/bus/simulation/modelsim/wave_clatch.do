onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_clatch/clk
add wave -noupdate -color Magenta /test_clatch/nclk
add wave -noupdate /test_clatch/D
add wave -noupdate -color Red /test_clatch/ena
add wave -noupdate -divider clatch16
add wave -noupdate /test_clatch/clatch16_/clk
add wave -noupdate -color Gold /test_clatch/clatch16_/Q
add wave -noupdate /test_clatch/clatch16_/sel1
add wave -noupdate /test_clatch/clatch16_/nena
add wave -noupdate /test_clatch/clatch16_/sel1
add wave -noupdate /test_clatch/clatch16_/sel2
add wave -noupdate /test_clatch/clatch16_/DFFE_mem
add wave -noupdate -divider clatch1
add wave -noupdate /test_clatch/clatch1_/clk
add wave -noupdate -color Gold /test_clatch/clatch1_/Q
add wave -noupdate /test_clatch/clatch1_/ena
add wave -noupdate /test_clatch/clatch1_/D
add wave -noupdate /test_clatch/clatch1_/nena
add wave -noupdate /test_clatch/clatch1_/DFFE_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4900 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 146
configure wave -valuecolwidth 53
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ns} {28700 ns}
