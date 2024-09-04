module gray_counter_basic(clk_i,rst_i,gray_o);
parameter N=3;
input clk_i,rst_i;
output reg [N-1:0] gray_o;
reg [N-1:0] d_o = 0;
genvar i;
  
always @ (posedge clk_i) begin  
	if (rst_i) begin  
        d_o <= 0;  
        gray_o <= 0;  
      end 
	else begin  
        d_o <= d_o + 1;  
	end
end	


for(i=0;i<3;i=i+1)begin
	assign gray_o[2] = d_o[2];
	assign gray_o[i] = d_o[i+1]^d_o[i];
end

/*
assign gray_o[2] = d_o[2];
assign gray_o[1] = d_o[2] ^ d_o[1];
assign gray_o[0] = d_o[1]^ d_o[0];
*/

endmodule       	
