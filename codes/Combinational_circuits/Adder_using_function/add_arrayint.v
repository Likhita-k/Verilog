module tb;

integer a[9:0],b [9:0];
integer c[9:0];
integer i,f;

function integer add(input integer a,b);
begin
		add = a+b;
end
endfunction

initial begin 
		for(i=0; i<10;i=i+1) begin
			a[i]=$urandom_range(100,200);
			b[i]=$urandom_range(100,200);	
			c[i] = add(a[i],b[i]);
			$display("a[%0d]= %0d, b[%0d] = %0d \n addition result is c[%0d]= %0d",i,a[i],i,b[i],i,c[i]);
			$display("=====================================");
		end
end
endmodule

		
