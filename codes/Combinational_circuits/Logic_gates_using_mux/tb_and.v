`include "mux_data.v"
`include "and_gate.v"

module tb_and;

reg a,b;
wire y;

and_gate dut(a,b,y);

initial begin
	repeat(10) begin
		a = $random;
		b = $random;
		#5;
		$display("inputs are a = %b b = %b and output y = %b", a,b,y);
	end
end
endmodule
