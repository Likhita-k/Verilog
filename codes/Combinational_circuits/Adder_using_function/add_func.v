module tb;

integer a,b;
integer c;

function integer  add(input integer a,b);
begin
	add = a+b;
end
endfunction

initial begin 
	repeat(10) begin
		a=$urandom_range(10,20);
		b=$urandom_range(10,20);
		c = add(a,b);
		$display("a= %0d, b = %0d \n addition result is c= %0d", a,b,c);
		
	end
end
endmodule
