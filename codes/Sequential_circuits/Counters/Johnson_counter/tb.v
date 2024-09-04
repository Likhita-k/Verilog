`include "jc.v"

module tb;

reg clk_i,rst_i;
wire [3:0] q_o;

jc dut(clk_i,rst_i,q_o);

always begin 
	clk_i=0;
	forever #5 clk_i=~clk_i;
end

initial begin 
	rst_i = 1;
	repeat(2) @(posedge clk_i);
	rst_i=0;

	#100;
	$finish;
end
endmodule 
