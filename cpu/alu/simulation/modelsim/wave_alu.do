onerror {resume}
quietly virtual signal -install /test_alu { (context /test_alu )&{test_db_low ,test_db_high }} test_bus
quietly virtual signal -install /test_alu { (context /test_alu )&{test_db_high ,test_db_low }} test_bus001
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_alu/db_w
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_alu/db
add wave -noupdate -color {Medium Orchid} -itemcolor Gold -label test_bus -radix hexadecimal -childformat {{{/test_alu/test_bus001[7]} -radix hexadecimal} {{/test_alu/test_bus001[6]} -radix hexadecimal} {{/test_alu/test_bus001[5]} -radix hexadecimal} {{/test_alu/test_bus001[4]} -radix hexadecimal} {{/test_alu/test_bus001[3]} -radix hexadecimal} {{/test_alu/test_bus001[2]} -radix hexadecimal} {{/test_alu/test_bus001[1]} -radix hexadecimal} {{/test_alu/test_bus001[0]} -radix hexadecimal}} -subitemconfig {{/test_alu/test_db_high[3]} {-color {Medium Orchid} -itemcolor Gold -radix hexadecimal} {/test_alu/test_db_high[2]} {-color {Medium Orchid} -itemcolor Gold -radix hexadecimal} {/test_alu/test_db_high[1]} {-color {Medium Orchid} -itemcolor Gold -radix hexadecimal} {/test_alu/test_db_high[0]} {-color {Medium Orchid} -itemcolor Gold -radix hexadecimal} {/test_alu/test_db_low[3]} {-color {Medium Orchid} -itemcolor Gold -radix hexadecimal} {/test_alu/test_db_low[2]} {-color {Medium Orchid} -itemcolor Gold -radix hexadecimal} {/test_alu/test_db_low[1]} {-color {Medium Orchid} -itemcolor Gold -radix hexadecimal} {/test_alu/test_db_low[0]} {-color {Medium Orchid} -itemcolor Gold -radix hexadecimal}} /test_alu/test_bus001
add wave -noupdate -expand -group {Bus control} /test_alu/alu_oe
add wave -noupdate -expand -group {Bus control} /test_alu/alu_op1_oe
add wave -noupdate -expand -group {Bus control} /test_alu/alu_op2_oe
add wave -noupdate -expand -group {Bus control} /test_alu/alu_res_oe
add wave -noupdate -expand -group {Bus control} /test_alu/alu_shift_oe
add wave -noupdate -expand -group {Bus control} /test_alu/alu_bs_oe
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_db0
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_db7
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_in
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_right
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_left
add wave -noupdate /test_alu/bsel
add wave -noupdate -expand -group {Operand selectors} /test_alu/alu_op1_sel_bus
add wave -noupdate -expand -group {Operand selectors} /test_alu/alu_op1_sel_low
add wave -noupdate -expand -group {Operand selectors} /test_alu/alu_op1_sel_zero
add wave -noupdate -expand -group {Operand selectors} /test_alu/alu_op2_sel_bus
add wave -noupdate -expand -group {Operand selectors} /test_alu/alu_op2_sel_lq
add wave -noupdate -expand -group {Operand selectors} /test_alu/alu_op2_sel_zero
add wave -noupdate -expand -group {ALU core} /test_alu/alu_core_R
add wave -noupdate -expand -group {ALU core} /test_alu/alu_core_S
add wave -noupdate -expand -group {ALU core} /test_alu/alu_core_V
add wave -noupdate -expand -group {ALU core} /test_alu/alu_sel_op2_neg
add wave -noupdate -expand -group {ALU core} /test_alu/alu_sel_op2_high
add wave -noupdate -expand -group {ALU core} /test_alu/alu_op_low
add wave -noupdate -expand -group Flags /test_alu/alu_core_cf_in
add wave -noupdate -expand -group Flags /test_alu/alu_core_cf_out
add wave -noupdate -expand -group Flags /test_alu/alu_core_vf_out
add wave -noupdate -expand -group Flags /test_alu/alu_parity_in
add wave -noupdate -expand -group Flags /test_alu/alu_parity_out
add wave -noupdate -expand -group Flags /test_alu/alu_zero
add wave -noupdate -expand -group Flags /test_alu/alu_low_gt_9
add wave -noupdate -expand -group Flags /test_alu/alu_high_gt_9
add wave -noupdate -expand -group Flags /test_alu/alu_high_eq_9
add wave -noupdate /test_alu/cf
add wave -noupdate /test_alu/pf
add wave -noupdate /test_alu/hf
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {900 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
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
WaveRestoreZoom {0 ps} {1200 ps}
