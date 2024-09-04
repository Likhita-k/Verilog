`include "sync_fifo.v"

module tb;
parameter WIDTH =4;
parameter DEPTH = 16;
parameter ADDR_WIDTH = $clog2(DEPTH);
reg clk_i,rst_i;
reg [WIDTH-1:0] wdata_i;
reg wr_en_i,rd_en_i;
wire [WIDTH-1:0] rdata_o;
wire full_o,empty_o,error_o;

integer i;

sync_fifo dut(clk_i,rst_i,wdata_i,rdata_o,wr_en_i,rd_en_i,full_o,empty_o,error_o);

initial begin 
	clk_i = 0;
	forever #5 clk_i = ~clk_i;
end

initial begin 
	rst_i = 1;
	wdata_i = 0;
	wr_en_i = 0;
	rd_en_i = 0;
	repeat(2)@(posedge clk_i);
	rst_i = 0;
	for(i=0;i<DEPTH;i=i+1) begin
		@(posedge clk_i)
		wdata_i = $random;
		wr_en_i = 1;
	end
		@(posedge clk_i)
		wdata_i = 0;
		wr_en_i = 0;
	for(i=0;i<DEPTH;i=i+1) begin
		@(posedge clk_i)
		rd_en_i = 1;
	end
		@(posedge clk_i)
		rd_en_i = 0;
end

initial begin 
	#500;
	$finish;
end
endmodule 
