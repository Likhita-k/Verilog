vlog tb_down.v
vsim tb
add wave -position insertpoint sim:/tb/*
run -all
