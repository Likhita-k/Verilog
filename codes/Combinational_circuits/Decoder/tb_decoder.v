`include "decoder.v"

module tb_decoder;

reg a,b;
wire d0,d1,d2,d3;

decoder de(a,b,d0,d1,d2,d3);

initial begin
	a = 0; b = 0;
	#5;
	a = 0; b = 1;
	#5;
	a = 1; b = 0;
	#5;
	a = 1; b = 1;
	#5;
end
endmodule
