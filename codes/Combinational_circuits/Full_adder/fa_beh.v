module fa(a,b,cin,sum,cout);

input a,b,cin;
output reg sum,cout;

always@(a or b or cin) begin
	if (a == 1'b0 && b == 1'b0 && cin == 1'b0) begin
		sum=0;
		cout=0;
	end

	if (a == 1'b0 && b == 1'b0 && cin == 1'b1) begin
		sum=1;
		cout=0;
	end

	if (a == 1'b0 && b == 1'b1 && cin == 1'b0) begin
		sum=1;
		cout=0;
	end

	if (a == 1'b0 && b == 1'b1 && cin == 1'b1) begin
		sum=0;
		cout=1;
	end

	if (a == 1'b1 && b == 1'b0 && cin == 1'b0) begin
		sum=1;
		cout=0;
	end

	if (a == 1'b1 && b == 1'b0 && cin == 1'b1) begin
		sum=0;
		cout=1;
	end	

	if (a == 1'b1 && b == 1'b1 && cin == 1'b0) begin
		sum=0;
		cout=1;
	end	

	if (a == 1'b1 && b == 1'b1 && cin == 1'b1) begin
		sum=1;
		cout=1;
	end	


end

endmodule 
