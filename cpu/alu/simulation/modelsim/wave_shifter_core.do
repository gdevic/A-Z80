onerror {resume}
quietly virtual signal -install /test_shifter_core { (context /test_shifter_core )&{out_high ,out_low }} db_out
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary -childformat {{{/test_shifter_core/db[7]} -radix binary} {{/test_shifter_core/db[6]} -radix binary} {{/test_shifter_core/db[5]} -radix binary} {{/test_shifter_core/db[4]} -radix binary} {{/test_shifter_core/db[3]} -radix binary} {{/test_shifter_core/db[2]} -radix binary} {{/test_shifter_core/db[1]} -radix binary} {{/test_shifter_core/db[0]} -radix binary}} -subitemconfig {{/test_shifter_core/db[7]} {-radix binary} {/test_shifter_core/db[6]} {-radix binary} {/test_shifter_core/db[5]} {-radix binary} {/test_shifter_core/db[4]} {-radix binary} {/test_shifter_core/db[3]} {-radix binary} {/test_shifter_core/db[2]} {-radix binary} {/test_shifter_core/db[1]} {-radix binary} {/test_shifter_core/db[0]} {-radix binary}} /test_shifter_core/db
add wave -noupdate -color Gold -itemcolor Gold -subitemconfig {{/test_shifter_core/out_high[3]} {-color Gold -itemcolor Gold} {/test_shifter_core/out_high[2]} {-color Gold -itemcolor Gold} {/test_shifter_core/out_high[1]} {-color Gold -itemcolor Gold} {/test_shifter_core/out_high[0]} {-color Gold -itemcolor Gold} {/test_shifter_core/out_low[3]} {-color Gold -itemcolor Gold} {/test_shifter_core/out_low[2]} {-color Gold -itemcolor Gold} {/test_shifter_core/out_low[1]} {-color Gold -itemcolor Gold} {/test_shifter_core/out_low[0]} {-color Gold -itemcolor Gold}} /test_shifter_core/db_out
add wave -noupdate -color {Medium Aquamarine} -itemcolor {Medium Aquamarine} /test_shifter_core/shift_db0
add wave -noupdate -color Cyan -itemcolor Cyan /test_shifter_core/shift_db7
add wave -noupdate /test_shifter_core/shift_in
add wave -noupdate /test_shifter_core/shift_left
add wave -noupdate /test_shifter_core/shift_right
add wave -noupdate /test_shifter_core/out_high
add wave -noupdate /test_shifter_core/out_low
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {300 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 223
configure wave -valuecolwidth 54
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
WaveRestoreZoom {4200 ps} {5100 ps}
