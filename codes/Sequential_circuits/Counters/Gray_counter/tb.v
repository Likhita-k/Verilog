`include "gray_counter_basic.v"

module tb;
parameter N=3;
reg clk_i;
reg rst_i;
wire [N-1:0] gray_o;

gray_counter_basic dut(clk_i,rst_i,gray_o);

always begin
	clk_i = 0;
	#5;
	clk_i =1;
	#5;
end

initial begin 
	rst_i = 1;
	repeat(2) @(posedge clk_i);
	rst_i = 0;
	#500;
	$finish;
end
endmodule
	
