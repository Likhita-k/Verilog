module jc(clk_i,rst_i,q_o);

input clk_i,rst_i;
output reg [3:0] q_o;

reg [3:0]q;

always@(posedge clk_i) begin
	if(rst_i)
		q <= 0;
	else begin
		q[3] <= q[2];
		q[2] <= q[1];
		q[1] <= q[0];
		q[0] <= ~q[3];
	end
end
assign q_o = q;
endmodule 
