onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_task/dut/clk_i
add wave -noupdate /tb_task/dut/rst_i
add wave -noupdate /tb_task/dut/wdata_i
add wave -noupdate /tb_task/dut/wr_en_i
add wave -noupdate /tb_task/wr_delay
add wave -noupdate /tb_task/dut/rd_en_i
add wave -noupdate /tb_task/rd_delay
add wave -noupdate /tb_task/dut/rdata_o
add wave -noupdate /tb_task/dut/full_o
add wave -noupdate /tb_task/dut/empty_o
add wave -noupdate /tb_task/dut/error_o
add wave -noupdate /tb_task/dut/wr_ptr
add wave -noupdate /tb_task/dut/rd_ptr
add wave -noupdate /tb_task/dut/wr_toggle
add wave -noupdate /tb_task/dut/rd_toggle
add wave -noupdate /tb_task/dut/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 91
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1052 ps}
