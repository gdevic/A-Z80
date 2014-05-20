onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_alu/db
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal /test_alu/db_sig
add wave -noupdate -color Salmon -itemcolor Salmon -radix hexadecimal /test_alu/test_db_low_sig
add wave -noupdate -color Salmon -itemcolor Salmon -radix hexadecimal /test_alu/test_db_high_sig
add wave -noupdate -expand -group {Bus control} /test_alu/alu_oe_sig
add wave -noupdate -expand -group {Bus control} /test_alu/alu_shift_oe_sig
add wave -noupdate -expand -group {Bus control} /test_alu/alu_op1_oe_sig
add wave -noupdate -expand -group {Bus control} /test_alu/alu_op2_oe_sig
add wave -noupdate -expand -group {Bus control} /test_alu/alu_res_oe_sig
add wave -noupdate -expand -group {Bus control} /test_alu/alu_bs_oe_sig
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_enable_sig
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_in_sig
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_right_sig
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_sra_sig
add wave -noupdate -expand -group {Input shifter} /test_alu/alu_shift_out_sig
add wave -noupdate /test_alu/bsel_sig
add wave -noupdate -expand -group {OP Sel/Mux} /test_alu/alu_op1_sel_bus_sig
add wave -noupdate -expand -group {OP Sel/Mux} /test_alu/alu_op1_sel_low_sig
add wave -noupdate -expand -group {OP Sel/Mux} /test_alu/alu_op1_sel_zero_sig
add wave -noupdate -expand -group {OP Sel/Mux} /test_alu/alu_op2_sel_bus_sig
add wave -noupdate -expand -group {OP Sel/Mux} /test_alu/alu_op2_sel_lq_sig
add wave -noupdate -expand -group {OP Sel/Mux} /test_alu/alu_op2_sel_zero_sig
add wave -noupdate -expand -group {OP Sel/Mux} /test_alu/alu_sel_op2_pos_sig
add wave -noupdate -expand -group {OP Sel/Mux} /test_alu/alu_sel_op2_low_sig
add wave -noupdate -expand -group {ALU core} /test_alu/alu_core_cf_in_sig
add wave -noupdate -expand -group {ALU core} /test_alu/alu_core_R_sig
add wave -noupdate -expand -group {ALU core} /test_alu/alu_core_S_sig
add wave -noupdate -expand -group {ALU core} /test_alu/alu_core_V_sig
add wave -noupdate -expand -group {ALU core} /test_alu/alu_op_low_sig
add wave -noupdate -expand -group {ALU core} /test_alu/alu_core_cf_out_sig
add wave -noupdate -expand -group Flags /test_alu/alu_parity_in_sig
add wave -noupdate -expand -group Flags /test_alu/alu_parity_out_sig
add wave -noupdate -expand -group Flags /test_alu/alu_zero_sig
add wave -noupdate -expand -group Flags /test_alu/alu_low_gt_9_sig
add wave -noupdate -expand -group Flags /test_alu/alu_high_gt_9_sig
add wave -noupdate -expand -group Flags /test_alu/alu_high_eq_9_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1500 ps} 0}
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
WaveRestoreZoom {800 ps} {1700 ps}
