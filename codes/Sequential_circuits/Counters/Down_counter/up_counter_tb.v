`include "up_counter_beh.v"

module tb;

reg clk_i;
reg rst_i;
wire [2:0] counter_o;

up_counter dut(clk_i,rst_i,counter_o);

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
endmodule
	
