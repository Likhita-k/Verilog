`include "mux.v"

module tb;

reg i0,i1,sel;
wire y;

mux mux1(i0,i1,sel,y);

initial begin
	i0 = 1'b0; i1 = 1'b1; sel = 1'b0;
	#5;
	i0 = 1'b1; i1 = 1'b1; sel = 1'b1;
	#10;

end

endmodule

