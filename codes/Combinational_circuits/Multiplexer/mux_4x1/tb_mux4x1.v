//`include "mux4x1_beh.v"
//`include "mux4x1_gate.v"
`include "mux4x1_data.v"

module tb_mux4x1;

reg i0,i1,i2,i3,s0,s1;
wire y;

//mux_beh mux(i0,i1,i2,i3,s0,s1,y);
//mux_gate mux(i0,i1,i2,i3,s0,s1,y);
mux_data mux(i0,i1,i2,i3,s0,s1,y);

initial begin
	repeat(20) begin
		i0 = $random;
		i1 = $random;
		i2 = $random;
		i3 = $random;
		s0 = $random;
		s1 = $random;
		#5;
	end
end
endmodule
