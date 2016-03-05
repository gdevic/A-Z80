onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_bench_host/reset
add wave -noupdate /test_bench_host/uart_tx
add wave -noupdate /test_bench_host/clk
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nM1
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nMREQ
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nIORQ
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nRD
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nWR
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nRFSH
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nHALT
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nBUSACK
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nWAIT
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nINT
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nNMI
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nRESET
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/nBUSRQ
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/CLK
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/A
add wave -noupdate -expand -group {CPU
} /test_bench_host/host_/z80_/D
add wave -noupdate -expand -group {host
} /test_bench_host/host_/A
add wave -noupdate -expand -group {host
} /test_bench_host/host_/D
add wave -noupdate -expand -group {host
} /test_bench_host/host_/RamData
add wave -noupdate -group {RAM
} /test_bench_host/host_/ram_/address
add wave -noupdate -group {RAM
} /test_bench_host/host_/ram_/clock
add wave -noupdate -group {RAM
} /test_bench_host/host_/ram_/data
add wave -noupdate -group {RAM
} /test_bench_host/host_/ram_/wren
add wave -noupdate -group {RAM
} /test_bench_host/host_/ram_/q
add wave -noupdate -group UART /test_bench_host/host_/uart_/BAUD
add wave -noupdate -group UART /test_bench_host/host_/uart_/IN_CLOCK
add wave -noupdate -group UART /test_bench_host/host_/uart_/busy
add wave -noupdate -group UART /test_bench_host/host_/uart_/uart_tx
add wave -noupdate -group UART /test_bench_host/host_/uart_/wr
add wave -noupdate -group UART /test_bench_host/host_/uart_/data
add wave -noupdate -group UART /test_bench_host/host_/uart_/clk
add wave -noupdate -group UART /test_bench_host/host_/uart_/reset
add wave -noupdate -group UART /test_bench_host/host_/uart_/bitcount
add wave -noupdate -group UART /test_bench_host/host_/uart_/shifter
add wave -noupdate -group UART /test_bench_host/host_/uart_/sending
add wave -noupdate -group UART -radix hexadecimal /test_bench_host/host_/uart_/d
add wave -noupdate -group UART -radix hexadecimal /test_bench_host/host_/uart_/inc
add wave -noupdate -group UART -radix hexadecimal /test_bench_host/host_/uart_/delta
add wave -noupdate -group UART -radix hexadecimal /test_bench_host/host_/uart_/ser_clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {Cursor {168431 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 184
configure wave -valuecolwidth 60
configure wave -justifyvalue right
configure wave -signalnamewidth 2
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {2036140 ps}
