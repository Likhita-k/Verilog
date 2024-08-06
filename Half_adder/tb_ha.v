//`include "ha.v"
//`include "ha_data.v"
`include "ha_gate.v"

module tb_ha;

reg a,b;
wire sum,carry;

//ha ha_beh(a,b,sum,carry);
//ha ha_data(a,b,sum,carry);
ha ha_gate(a,b,sum,carry);

initial begin
	a = 1'b0; b = 1'b0;
	#5;
	a = 1'b0; b = 1'b1;
	#10;
	a = 1'b1; b = 1'b0;
	#5;
	a = 1'b1; b = 1'b1;
	#10;
end

endmodule
