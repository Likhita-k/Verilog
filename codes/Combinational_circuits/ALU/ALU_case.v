module alu(a,b,sel,y);

parameter ADD = 3'b000;
parameter SUB = 3'b001;
parameter MUL = 3'b010;
parameter DIV = 3'b011;
//parameter MOD = 3'b100;
//parameter PWR = 3'b101;
//parameter LSFT = 3'b110;
//parameter RSFT = 3'b111;

input [7:0] a,b;
input [2:0] sel;
output reg [31:0]y;

function reg [31:0] alu_func(input [7:0] a,b, input [2:0] sel);
begin
	case(sel)
		ADD:begin
			alu_func = a+b;
		end
		SUB:begin
			alu_func = a-b;
		end
		MUL:begin
			alu_func = a*b;
		end
		DIV:begin
			alu_func = a/b;
		end
		default:begin
			alu_func = 0'bx;
		end	
	endcase
end
endfunction

always@(a or b or sel) begin
	y = alu_func(a,b,sel);
end
endmodule

