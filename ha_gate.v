module ha_gate(a,b,sum,carry); 
input a,b;
output sum, carry;

wire n1,n2,n3,n4;

not g1(n1,a);
and g2(n2,n1,b);
not g5(n3,b);
and g4(n4,a,n3);
or g3(sum,n2,n4);
and g6(carry,a,b);


//xor g1(sum,a,b);
//and g2(carry,a,b);

endmodule

