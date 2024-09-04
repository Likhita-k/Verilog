module ha(a,b,sum,carry);

input a,b;
output reg sum,carry;

always@(a or b) begin
	if (a == 1'b0 && b == 1'b0) begin
		sum=0;
		carry=0;
	end

	else if (a == 1'b0 && b == 1'b1) begin
		sum=1;
		carry=0;
	end

	else if (a == 1'b1 && b == 1'b0) begin
		sum=1;
		carry=0;
	end

	else if (a == 1'b1 && b == 1'b1) begin
		sum=0;
		carry=1;
	end
end

endmodule 
