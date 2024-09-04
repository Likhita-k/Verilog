`include "mux_data.v"
`include "not_gate.v"

module tb_not;

reg a;
wire y;

not_gate dut(a,y);

initial begin
	repeat(10) begin
		a = $random;
		#5;
		$display("inputs are a = %b and output y = %b", a,y);
	end
end
endmodule
