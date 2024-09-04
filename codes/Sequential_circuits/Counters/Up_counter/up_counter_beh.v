module up_counter(clk_i,rst_i,counter_o);
input clk_i,rst_i;
output reg [2:0] counter_o;

always@(posedge clk_i) begin
	if(rst_i == 0) begin
		counter_o <= 0;
	end
	else begin
		counter_o <= counter_o + 1;
	end
end	
endmodule 
