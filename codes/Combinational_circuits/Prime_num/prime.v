module prime;

integer prime_num;
integer i,j;
reg flag;

initial begin 
//	$value$plusargs("enter a number = %d",a);
	for(i = 2; i<=100; ) begin
//		num = $urandom_range(2,100);
		flag = 1;
		for(j = 2; j<=i**0.5; j = j+1) begin
			if(i%j ==0) begin
				flag =0 ;
				//j = i;
			end
		end	
		if(flag == 1) begin
			//prime_num = i;
			$display("%0d",i);
//			i=i+1;
		end
		i = i+1;
	end	
end
endmodule 
