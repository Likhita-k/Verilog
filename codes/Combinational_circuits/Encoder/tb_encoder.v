`include "encoder.v"

module tb_encoder;

reg d0,d1,d2,d3;
wire y0,y1;

encoder en(d0,d1,d2,d3,y0,y1);

initial begin
		d0 = 1'b0; d1 = 1'b0; d2 = 1'b0; d3 =1'b1;			   		   #5;
		d0 = 1'b0; d1 = 1'b0; d2 = 1'b1; d3 =1'b0;             		   #5;
		d0 = 1'b0; d1 = 1'b1; d2 = 1'b0; d3 =1'b0;
		#5;
		d0 = 1'b1; d1 = 1'b0; d2 = 1'b0; d3 =1'b0;			   	       #5;
		$display("inputs are d0 = %b, d1 = %b , d2 = %b, d3 = %b and outputs are y0 = %b, y1 = %b", d0, d1,d2,d3,y0,y1);
	
end
endmodule
