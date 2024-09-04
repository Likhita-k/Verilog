`include "mux8x1.v"
`include "mux4x1_data.v"

module tb_8x1;

reg i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
wire y;

mux8x1 mux(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);

initial begin 
	repeat(20) begin	
		i0= $random;
		i1= $random;
		i2= $random;
		i3= $random;
		i4= $random;
		i5= $random;
		i6= $random;
		i7= $random;
		s0= $random;
		s1= $random;
		s2= $random;
		#5;
	end
end
endmodule 
