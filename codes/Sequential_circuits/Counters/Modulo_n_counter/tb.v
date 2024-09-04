`include "mod_n_counter.v"

module tb;

parameter WIDTH = 7;
parameter N = WIDTH+1;
reg clk_i,rst_i;
wire [WIDTH-1:0] count_o;

mod_n_counter #(.N(N),.WIDTH(WIDTH)) dut(clk_i,rst_i,count_o);

always begin 
	clk_i=0;
	forever #5 clk_i=~clk_i;
end	

initial begin 
	rst_i=1;
	repeat(2)@(posedge clk_i);
	rst_i=0;

	#500;
	$finish;
end
endmodule 
