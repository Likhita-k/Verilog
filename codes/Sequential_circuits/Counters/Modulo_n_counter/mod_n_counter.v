module mod_n_counter(clk_i,rst_i,count_o);

parameter WIDTH = 6;
parameter N = WIDTH+1;
input clk_i,rst_i;
output reg [WIDTH-1:0] count_o;

always@(posedge clk_i) begin
	if(rst_i)
		count_o <=0;
	else begin
		if(count_o != N-1)
			count_o <= count_o+1;
		else 
			count_o <= 0;
	end
end
endmodule 
