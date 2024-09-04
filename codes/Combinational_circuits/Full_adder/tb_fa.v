//`include "fa_beh.v"
//`include "fa_data.v"
`include "fa_gate.v"

module tb_fa;

reg a,b,cin;
wire sum,cout;

//fa fa_beh(a,b,cin,sum,cout);
//fa fa_data(a,b,sum,cin,cout);
fa fa_gate(a,b,cin,sum,cout);

initial begin
	a = 1'b0; b = 1'b0; cin = 1'b0;
	#5;
	a = 1'b0; b = 1'b0; cin = 1'b1;
	#5;
	a = 1'b0; b = 1'b1; cin = 1'b0;
	#5;
	a = 1'b0; b = 1'b1; cin = 1'b1;
	#5;
	a = 1'b1; b = 1'b0; cin = 1'b0;
	#5;
	a = 1'b1; b = 1'b0; cin = 1'b1;
	#5;
	a = 1'b1; b = 1'b1; cin = 1'b0;
	#5;
	a = 1'b1; b = 1'b1; cin = 1'b1;
	#5;
end

endmodule

