module up_down_counter(clk_i,rst_i,mode_i,count_o);

input clk_i,rst_i,mode_i;
output reg [2:0] count_o;

always@(posedge clk_i) begin 
	if(mode_i==1) begin
		if(rst_i == 0) 
			count_o = 0;
		else 	
			count_o = count_o + 1;
	end
	else 
		if(rst_i == 0) 
			count_o = 0;
		else 	
			count_o = count_o - 1;
	end
endmodule 	

