//`include "pat_det_mealy_overlapping.v"
`include "pat_det_moore_overlapping.v"
module tb_pt_det;

reg clk_i,rst_i,d_i,valid_i;
wire pattern_detected_o;

integer count=0;

//pt_dt_me_ol dut(.clk_i(clk_i),.rst_i(rst_i),.d_i(d_i),.valid_i(valid_i),.pattern_detected_o(pattern_detected_o));
pt_dt_moore_ol dut(.clk_i(clk_i),.rst_i(rst_i),.d_i(d_i),.valid_i(valid_i),.pattern_detected_o(pattern_detected_o));

initial begin 
	clk_i = 0;
	forever #5 clk_i = ~clk_i;
end

initial begin
	rst_i = 1;
	valid_i = 0;
	d_i = 0;
	repeat(2) @(posedge clk_i);
	rst_i = 0;

	valid_i = 1;
	repeat (500) @ (posedge clk_i) begin
		d_i = $random;
	end
	#500;
	$display("Total number of patterns detected is = %0d",count);
	$finish;
end
always@(posedge pattern_detected_o)
	count=count+1;
endmodule



		






