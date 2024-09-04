`include "sync_fifo_try.v"

module tb_task;
parameter WIDTH =4;
parameter DEPTH = 16;
parameter ADDR_WIDTH = $clog2(DEPTH);
reg clk_i,rst_i;
reg [WIDTH-1:0] wdata_i;
reg wr_en_i,rd_en_i;
wire [WIDTH-1:0] rdata_o;
wire full_o,empty_o,error_o;

integer i;
reg [8*40:1] test_name;
integer wr_delay,rd_delay;

sync_fifo dut(clk_i,rst_i,wr_en_i,rd_en_i,wdata_i,rdata_o,empty_o,full_o,error_o);
//sync_fifo dut(clk_i,rst_i,wdata_i,rdata_o,wr_en_i,rd_en_i,full_o,empty_o,error_o);
task reset();
begin
	wdata_i = 0;
	wr_en_i = 0;
	rd_en_i = 0;
end
endtask

task write(input reg [ADDR_WIDTH:0] start_addr, input reg [ADDR_WIDTH:0] loc);
begin
	for(i= start_addr;i< start_addr+loc;i=i+1) begin
		@(posedge clk_i)
		wdata_i = $random;
		wr_en_i = 1;
	end
		@(posedge clk_i)
		wdata_i = 0;
		wr_en_i = 0;
end
endtask

task read(input reg [ADDR_WIDTH:0] start_addr, input reg [ADDR_WIDTH:0] loc);
begin
	for(i= start_addr;i< start_addr+loc-1;i=i+1) begin
		@(posedge clk_i)
		rd_en_i = 1;
	end
		@(posedge clk_i)
		rd_en_i = 0;
end
endtask

initial begin 
	clk_i = 0;
	forever #5 clk_i = ~clk_i;
end

initial begin 
	$value$plusargs("test_name=%s",test_name);
	rst_i = 1;
	reset();
	repeat(2)@(posedge clk_i);
	rst_i = 0;
	case(test_name)
		"full_case": begin
			write(0,DEPTH);
		end

		"empty_case": begin
			write(0,DEPTH-1);
			read(0,DEPTH-1);
		end

		"full_error": begin
			write(0,DEPTH+1);
		end

		"empty_error": begin
			read(0,DEPTH+1);
		end

		"concurrent_write_read": begin
			fork
				begin 
					for(i=0;i<DEPTH;i=i+1) begin
						write(0,1);
				//		wr_delay= 5;
						wr_delay = $urandom_range(1,10);
						repeat(wr_delay)@(posedge clk_i);
					end	
				end
				begin
					for(i=0;i<DEPTH;i=i+1) begin
						read(0,1);
					//	rd_delay = 5;
						rd_delay = $urandom_range(1,10);
						repeat(rd_delay)@(posedge clk_i);
					end
				end
			join
		end
		default: begin
			$display("invalid test case");
		end	
	endcase
end	

initial begin 
	#1000;
	$finish;
end
endmodule 
