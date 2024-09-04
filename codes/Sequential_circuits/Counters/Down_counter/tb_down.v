`include "down_counter.v"

module tb;

reg clk_i;
reg rst_i;
wire [2:0] count_o;

down_counter dut(clk_i,rst_i,count_o);

initial begin
	clk_i = 0;
	forever #5 clk_i = ~clk_i;
end

initial begin 
	rst_i = 0;
	repeat(2) @(posedge clk_i);
	rst_i = 1;
	#500;
	$finish;
end
endmodule
		
