module alu_tb;
reg [7:0] a,b;
reg [2:0] sel;

wire [31:0] y;

integer i;

alu fun(a,b,sel,y);

initial begin 
	for(i = 0; i <8; i = i+1) begin
		a= $urandom_range(20,30);
		b = $urandom_range(10,20);
		sel = i;
		#5;
		$display("a=%0d,b=%0d,sel=%0s,y=%0d",a,b,(sel==0? "ADD":sel==1? "SUB":sel==2? "MUL":sel == 3? "DIV":"no operation"),y);
	end
end
endmodule

