onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_bench_host/reset
add wave -noupdate /test_bench_host/uart_tx
add wave -noupdate /test_bench_host/clk
add wave -noupdate -expand -group {host} /test_bench_host/host_/clk
add wave -noupdate -expand -group {host} /test_bench_host/host_/reset
add wave -noupdate -expand -group {host} /test_bench_host/host_/uart_tx
add wave -noupdate -expand -group {host} /test_bench_host/host_/nM1
add wave -noupdate -expand -group {host} /test_bench_host/host_/nMREQ
add wave -noupdate -expand -group {host} /test_bench_host/host_/nIORQ
add wave -noupdate -expand -group {host} /test_bench_host/host_/nRD
add wave -noupdate -expand -group {host} /test_bench_host/host_/nWR
add wave -noupdate -expand -group {host} /test_bench_host/host_/nRFSH
add wave -noupdate -expand -group {host} /test_bench_host/host_/nHALT
add wave -noupdate -expand -group {host} /test_bench_host/host_/nBUSACK
add wave -noupdate -expand -group {host} /test_bench_host/host_/nWAIT
add wave -noupdate -expand -group {host} /test_bench_host/host_/nINT
add wave -noupdate -expand -group {host} /test_bench_host/host_/nNMI
add wave -noupdate -expand -group {host} /test_bench_host/host_/nBUSRQ
add wave -noupdate -expand -group {host} /test_bench_host/host_/nRESET
add wave -noupdate -expand -group {host} /test_bench_host/host_/A
add wave -noupdate -expand -group {host} /test_bench_host/host_/D
add wave -noupdate -expand -group {host} /test_bench_host/host_/CPUCLK
add wave -noupdate -expand -group {host} /test_bench_host/host_/RamData
add wave -noupdate -expand -group {host} /test_bench_host/host_/we
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1584604 ps} 0}
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
WaveRestoreZoom {0 ps} {21 us}
