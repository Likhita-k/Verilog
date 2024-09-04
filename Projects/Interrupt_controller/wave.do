onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/dut/pclk_i
add wave -noupdate /tb/dut/prst_i
add wave -noupdate -expand -group APB -radix decimal /tb/dut/paddr_i
add wave -noupdate -expand -group APB -radix decimal /tb/dut/pwdata_i
add wave -noupdate -expand -group APB /tb/dut/pwrite_i
add wave -noupdate -expand -group APB /tb/dut/penable_i
add wave -noupdate -expand -group APB /tb/dut/pready_o
add wave -noupdate -expand -group APB /tb/dut/prdata_o
add wave -noupdate -expand -group INTR -radix hexadecimal /tb/dut/int_active_i
add wave -noupdate -expand -group INTR /tb/dut/intr_valid_o
add wave -noupdate -expand -group INTR /tb/dut/intr_to_service_o
add wave -noupdate -expand -group INTR /tb/dut/intr_serviced_i
add wave -noupdate -expand -group INTR /tb/dut/highest_pri_val
add wave -noupdate -expand -group INTR /tb/dut/pri_reg
add wave -noupdate -expand -group INTR /tb/dut/periph_num
add wave -noupdate -expand -group INTR /tb/dut/flag
add wave -noupdate -expand -group INTR /tb/dut/state
add wave -noupdate -expand -group INTR /tb/dut/next_state
add wave -noupdate -expand -group INTR /tb/dut/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 197
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
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {380 ps}
