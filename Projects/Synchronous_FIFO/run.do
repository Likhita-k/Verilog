vlog tb_task.v
vsim tb_task +test_name=full_case
add wave -position insertpoint sim:/tb_task/dut/*
#do wave.do
run -all

#vlog tb_sync_fifo.v
#vsim tb
#add wave -position insertpoint sim:/tb/dut/*
#run -all
