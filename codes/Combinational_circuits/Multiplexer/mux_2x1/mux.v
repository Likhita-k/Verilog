module mux(i0,i1,sel,y);

input i0,i1,sel;
output reg y;

always@(i0 or i1 or sel) begin
	if(sel == 0) begin
		y = i0;
	end
	if(sel == 1) begin
		y = i1;
	end
end

endmodule 
			
