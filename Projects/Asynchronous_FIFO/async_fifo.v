module async_fifo(wr_clk_i,rd_clk_i,rst_i,wdata_i,rdata_o,wr_en_i,rd_en_i,full_o,empty_o,error_o);

parameter WIDTH =4;
parameter DEPTH = 16;
parameter ADDR_WIDTH = $clog2(DEPTH);

input wr_clk_i,rd_clk_i,rst_i;
input [WIDTH-1:0] wdata_i;
input wr_en_i,rd_en_i;
output reg [WIDTH-1:0] rdata_o;
output reg full_o,empty_o,error_o;

reg [ADDR_WIDTH-1:0] wr_ptr,rd_ptr;
reg wr_toggle,rd_toggle;
reg [WIDTH-1:0] mem [DEPTH-1:0];
integer i;
reg [ADDR_WIDTH-1:0] wr_ptr_rd_clk,rd_ptr_wr_clk;
reg wr_tog_rd_clk,rd_tog_wr_clk;
reg[ADDR_WIDTH-1:0] wr_ptr_gray,rd_ptr_gray;

//binary to grey conversion
function reg[3:0] bin_gr(input reg [3:0] bin);
begin
	bin_gr[3] = bin[3];
	bin_gr[2] = bin[3]^bin[2];
	bin_gr[1] = bin[2]^bin[1];
	bin_gr[0] = bin[1]^bin[0];
end
endfunction

//synchronization of wr_clk and rd_clk 
always@(posedge wr_clk_i) begin
	rd_ptr_wr_clk <= wr_ptr_gray;
	rd_tog_wr_clk <= wr_toggle;
end

always@(posedge rd_clk_i) begin
	wr_ptr_rd_clk <= rd_ptr_gray;
	wr_tog_rd_clk <= rd_toggle;
end
always@(posedge wr_clk_i) begin
	if(rst_i == 1) begin
		rdata_o = 0;
		full_o = 0;
		empty_o = 0;
		error_o = 0;
		wr_ptr = 0;
		wr_ptr_rd_clk = 0;
		wr_ptr_gray = 0;
		rd_ptr = 0;
		rd_ptr_gray = 0;
		rd_ptr_wr_clk = 0;
		wr_toggle = 0;
		rd_toggle = 0;
		wr_tog_rd_clk = 0;
		rd_tog_wr_clk = 0;
		for(i=0;i<DEPTH;i=i+1) begin
			mem[i] = 0;
		end	
	end
	else begin
	//write
		if(wr_en_i == 1) begin
			if(full_o == 0) begin //fifo is not full
				error_o = 0; 
				mem[wr_ptr] = wdata_i;
				if(wr_ptr == DEPTH-1) begin
					wr_ptr = 0;
					wr_toggle = ~wr_toggle;
				end
				else begin
					wr_ptr = wr_ptr+1;
				end
				wr_ptr_gray = bin_gr(wr_ptr);
			end	
			else begin
				error_o =1;
			end	
		end	
	end
end

always@(posedge rd_clk_i) begin
	//read
	if(rst_i == 0) begin
		if(rd_en_i == 1) begin
			if(empty_o == 0) begin //fifo is not empty 
				error_o = 0; 
				rdata_o = mem[rd_ptr];
				rd_ptr = rd_ptr+1;
				if(wr_ptr == DEPTH-1) begin	
					rd_toggle = ~rd_toggle;
				end
				rd_ptr_gray = bin_gr(rd_ptr);
			end	
			else begin
				error_o =1;
			end	
		end	
	end	
end

always@(wr_ptr_gray or rd_ptr_gray) begin
	empty_o = 0;
	full_o = 0;
	if(wr_ptr_rd_clk == rd_ptr_gray && wr_tog_rd_clk != rd_toggle) begin
		empty_o =1;
	end	
	if(wr_ptr_gray == rd_ptr_wr_clk && wr_toggle == rd_tog_wr_clk) begin
		full_o = 1;
	end
end
endmodule 
	
