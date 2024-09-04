module tb;
integer num;
integer fact;

function integer fact_func(input integer num);
begin
	//integer fact_fuuc(0) = 1;
	if(num>1) begin
		fact_func = num*fact_func(num-1);
	end
	else
		fact_func = 1;
end
endfunction

initial begin
	num = 5;
	fact = fact_func(num);
	$display("factorial ouput is = %d",fact);

end
endmodule
