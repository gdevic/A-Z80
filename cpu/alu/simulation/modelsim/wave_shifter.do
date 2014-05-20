onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group db -radix binary -childformat {{{/test_shifter/db_sig[7]} -radix hexadecimal} {{/test_shifter/db_sig[6]} -radix hexadecimal} {{/test_shifter/db_sig[5]} -radix hexadecimal} {{/test_shifter/db_sig[4]} -radix hexadecimal} {{/test_shifter/db_sig[3]} -radix hexadecimal} {{/test_shifter/db_sig[2]} -radix hexadecimal} {{/test_shifter/db_sig[1]} -radix hexadecimal} {{/test_shifter/db_sig[0]} -radix hexadecimal}} -subitemconfig {{/test_shifter/db_sig[7]} {-height 14 -radix hexadecimal} {/test_shifter/db_sig[6]} {-height 14 -radix hexadecimal} {/test_shifter/db_sig[5]} {-height 14 -radix hexadecimal} {/test_shifter/db_sig[4]} {-height 14 -radix hexadecimal} {/test_shifter/db_sig[3]} {-height 14 -radix hexadecimal} {/test_shifter/db_sig[2]} {-height 14 -radix hexadecimal} {/test_shifter/db_sig[1]} {-height 14 -radix hexadecimal} {/test_shifter/db_sig[0]} {-height 14 -radix hexadecimal}} /test_shifter/db_sig
add wave -noupdate -expand -group {ALU db} -color Gold -itemcolor Gold -radix hexadecimal /test_shifter/db_in_low_sig
add wave -noupdate -expand -group {ALU db} -color Gold -itemcolor Gold -radix hexadecimal /test_shifter/db_in_high_sig
add wave -noupdate /test_shifter/op543_sig
add wave -noupdate /test_shifter/cf_in_sig
add wave -noupdate /test_shifter/cf_out_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 193
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
WaveRestoreZoom {3300 ps} {5100 ps}
