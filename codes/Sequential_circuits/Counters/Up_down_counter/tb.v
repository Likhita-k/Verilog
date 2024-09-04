`include "up_down_counter.v"

module tb;

reg clk_i;
reg rst_i,mode_i;
wire [2:0] counter_o;

up_down_counter dut(clk_i,rst_i,mode_i,counter_o);

always begin
	clk_i = 0;
	#5;
	clk_i =1;
	#5;
end

initial begin	
	rst_i = 0;
	repeat(2) @(posedge clk_i);
	rst_i = 1;
	#500;
	$finish;
end

always begin
	mode_i = 1;
	repeat(10) @(posedge clk_i);
	mode_i = 0;
	repeat(10) @(posedge clk_i);
end
endmodule
	
