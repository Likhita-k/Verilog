module mux_beh(i0,i1,i2,i3,s0,s1,y);

input i0,i1,i2,i3, s0, s1;
output reg y;

always @ (i0 or i1 or i2 or i3 or s0, s1) begin
	if (s0 == 1'b0 && s1 == 1'b0) begin
		y = i0;
	end	

	if (s0 == 1'b0 && s1 == 1'b1) begin
		y = i1;
	end

	if (s0 == 1'b1 && s1 == 1'b0) begin
		y = i2;
	end

	if (s0 == 1'b0 && s1 == 1'b0) begin
		y = i3;
	end
end

endmodule
