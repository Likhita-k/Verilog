module fa_gate(a,b,sum,carry); 
input a,b;
output sum, carry;

wire n1,n2,n3;


xor g1(sum,a,b);
xor g2(carry,a,b);
and g3(n2,cin,n1);
and g4(n3,a,b);
or g5(cout,n2,n3);


endmodule

