onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group db -radix hexadecimal /test_shifter/db
add wave -noupdate -expand -group db -radix hexadecimal /test_shifter/db_sig
add wave -noupdate -color Gold -itemcolor Gold /test_shifter/alu_oe_sig
add wave -noupdate -expand -group {ALU db} -radix hexadecimal /test_shifter/db_high
add wave -noupdate -expand -group {ALU db} -radix hexadecimal -childformat {{{/test_shifter/db_high_sig[3]} -radix hexadecimal} {{/test_shifter/db_high_sig[2]} -radix hexadecimal} {{/test_shifter/db_high_sig[1]} -radix hexadecimal} {{/test_shifter/db_high_sig[0]} -radix hexadecimal}} -subitemconfig {{/test_shifter/db_high_sig[3]} {-radix hexadecimal} {/test_shifter/db_high_sig[2]} {-radix hexadecimal} {/test_shifter/db_high_sig[1]} {-radix hexadecimal} {/test_shifter/db_high_sig[0]} {-radix hexadecimal}} /test_shifter/db_high_sig
add wave -noupdate -expand -group {ALU db} -radix hexadecimal /test_shifter/db_low
add wave -noupdate -expand -group {ALU db} -radix hexadecimal -childformat {{{/test_shifter/db_low_sig[3]} -radix hexadecimal} {{/test_shifter/db_low_sig[2]} -radix hexadecimal} {{/test_shifter/db_low_sig[1]} -radix hexadecimal} {{/test_shifter/db_low_sig[0]} -radix hexadecimal}} -subitemconfig {{/test_shifter/db_low_sig[3]} {-radix hexadecimal} {/test_shifter/db_low_sig[2]} {-radix hexadecimal} {/test_shifter/db_low_sig[1]} {-radix hexadecimal} {/test_shifter/db_low_sig[0]} {-radix hexadecimal}} /test_shifter/db_low_sig
add wave -noupdate -color Gold -itemcolor Gold /test_shifter/alu_shift_oe_sig
add wave -noupdate /test_shifter/op543_sig
add wave -noupdate /test_shifter/alu_shift_enable_sig
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
WaveRestoreZoom {0 ps} {900 ps}
