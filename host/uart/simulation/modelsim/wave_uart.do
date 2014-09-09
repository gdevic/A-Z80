onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group uart /test_uart/uart_io/uart/uart_tx
add wave -noupdate -expand -group uart /test_uart/uart_io/uart/busy_tx
add wave -noupdate -expand -group uart /test_uart/uart_io/uart/clk
add wave -noupdate -expand -group uart /test_uart/uart_io/uart/reset
add wave -noupdate -expand -group uart -radix hexadecimal /test_uart/uart_io/uart/data_in
add wave -noupdate -expand -group uart /test_uart/uart_io/uart/data_in_wr
add wave -noupdate -expand -group uart /test_uart/uart_io/uart/baud_count
add wave -noupdate -expand -group uart -radix hexadecimal /test_uart/uart_io/uart/data
add wave -noupdate -expand -group uart /test_uart/uart_io/uart/state
add wave -noupdate -expand -group uart /test_uart/uart_io/uart/next_state
add wave -noupdate -expand -group uart_io /test_uart/uart_io/reset
add wave -noupdate -expand -group uart_io /test_uart/uart_io/clk
add wave -noupdate -expand -group uart_io -radix hexadecimal /test_uart/uart_io/Address
add wave -noupdate -expand -group uart_io -radix hexadecimal /test_uart/uart_io/Data
add wave -noupdate -expand -group uart_io /test_uart/uart_io/IORQ
add wave -noupdate -expand -group uart_io /test_uart/uart_io/RD
add wave -noupdate -expand -group uart_io /test_uart/uart_io/WR
add wave -noupdate -expand -group uart_io /test_uart/uart_io/uart_tx
add wave -noupdate -expand -group uart_io /test_uart/uart_io/data_in_wr
add wave -noupdate -expand -group {test uart} /test_uart/clk
add wave -noupdate -expand -group {test uart} /test_uart/reset
add wave -noupdate -expand -group {test uart} -radix hexadecimal /test_uart/Address
add wave -noupdate -expand -group {test uart} /test_uart/Data_wr
add wave -noupdate -expand -group {test uart} /test_uart/Data_rd
add wave -noupdate -expand -group {test uart} /test_uart/IORQ
add wave -noupdate -expand -group {test uart} /test_uart/RD
add wave -noupdate -expand -group {test uart} /test_uart/WR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {900 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 164
configure wave -valuecolwidth 100
configure wave -justifyvalue right
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {10400 ns}
