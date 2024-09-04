vlog tb_encoder.v
vsim tb_encoder
add wave -position insertpoint sim:/tb_encoder/*
run -all
