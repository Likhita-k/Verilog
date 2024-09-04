module down_counter(clk_i,rst_i,count_o);

input clk_i,rst_i;
output reg [2:0] count_o;


always@(posedge clk_i) begin
	if(rst_i == 0) begin
		count_o <= 0;
	end
	else begin
		count_o <= count_o - 1;
	end
end
endmodule
