onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_top/clk
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/CPUCLK
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nM1
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nMREQ
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nIORQ
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nRD
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nWR
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nRFSH
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nHALT
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nWAIT
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nBUSACK
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nINT
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nNMI
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nRESET
add wave -noupdate -color Gold -itemcolor Gold /test_top/bus_if/nBUSRQ
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal -childformat {{{/test_top/bus_if/A[15]} -radix hexadecimal} {{/test_top/bus_if/A[14]} -radix hexadecimal} {{/test_top/bus_if/A[13]} -radix hexadecimal} {{/test_top/bus_if/A[12]} -radix hexadecimal} {{/test_top/bus_if/A[11]} -radix hexadecimal} {{/test_top/bus_if/A[10]} -radix hexadecimal} {{/test_top/bus_if/A[9]} -radix hexadecimal} {{/test_top/bus_if/A[8]} -radix hexadecimal} {{/test_top/bus_if/A[7]} -radix hexadecimal} {{/test_top/bus_if/A[6]} -radix hexadecimal} {{/test_top/bus_if/A[5]} -radix hexadecimal} {{/test_top/bus_if/A[4]} -radix hexadecimal} {{/test_top/bus_if/A[3]} -radix hexadecimal} {{/test_top/bus_if/A[2]} -radix hexadecimal} {{/test_top/bus_if/A[1]} -radix hexadecimal} {{/test_top/bus_if/A[0]} -radix hexadecimal}} -subitemconfig {{/test_top/bus_if/A[15]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[14]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[13]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[12]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[11]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[10]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[9]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[8]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[7]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[6]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[5]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[4]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[3]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[2]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[1]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/A[0]} {-color Gold -itemcolor Gold -radix hexadecimal}} /test_top/bus_if/A
add wave -noupdate -color Gold -itemcolor Gold -radix hexadecimal -childformat {{{/test_top/bus_if/D[7]} -radix hexadecimal} {{/test_top/bus_if/D[6]} -radix hexadecimal} {{/test_top/bus_if/D[5]} -radix hexadecimal} {{/test_top/bus_if/D[4]} -radix hexadecimal} {{/test_top/bus_if/D[3]} -radix hexadecimal} {{/test_top/bus_if/D[2]} -radix hexadecimal} {{/test_top/bus_if/D[1]} -radix hexadecimal} {{/test_top/bus_if/D[0]} -radix hexadecimal}} -subitemconfig {{/test_top/bus_if/D[7]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/D[6]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/D[5]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/D[4]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/D[3]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/D[2]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/D[1]} {-color Gold -itemcolor Gold -radix hexadecimal} {/test_top/bus_if/D[0]} {-color Gold -itemcolor Gold -radix hexadecimal}} /test_top/bus_if/D
add wave -noupdate /test_top/d/M1
add wave -noupdate /test_top/d/M2
add wave -noupdate /test_top/d/M3
add wave -noupdate /test_top/d/M4
add wave -noupdate /test_top/d/M5
add wave -noupdate /test_top/d/M6
add wave -noupdate /test_top/d/T1
add wave -noupdate /test_top/d/T2
add wave -noupdate /test_top/d/T3
add wave -noupdate /test_top/d/T4
add wave -noupdate /test_top/d/T5
add wave -noupdate /test_top/d/T6
add wave -noupdate /test_top/d/fFetch
add wave -noupdate /test_top/d/fMRead
add wave -noupdate /test_top/d/fMWrite
add wave -noupdate /test_top/d/fIORead
add wave -noupdate /test_top/d/fIOWrite
add wave -noupdate /test_top/d/fIntr
add wave -noupdate /test_top/d/nextM
add wave -noupdate /test_top/d/setM1
add wave -noupdate /test_top/d/hold_clk
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
