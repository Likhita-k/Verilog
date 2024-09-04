module prime_while;

integer prime_num;
integer i,j;
reg flag;

initial begin 
	i=2;
	while(i<=100) begin
		flag = 1;
		j=2;
		while(j<=i**0.5) begin
			if(i%j ==0) begin
				flag =0 ;
			end	
			j = j+1;
		end	
		if(flag == 1) begin
			$display("%0d",i);
		end
		i = i+1;
	end	
end
endmodule 
