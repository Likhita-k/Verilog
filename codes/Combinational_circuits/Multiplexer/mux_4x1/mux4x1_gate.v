module mux_gate(i0,i1,i2,i3,s0,s1,y);

input i0,i1,i2,i3, s0, s1;
output y;
wire s0bar,s1bar,n1,n2,n3,n4;

not g1(s0bar, s0);
not g2(s1bar, s1);
and g3(n1, i0, s0bar);
and g4(n2, i1, s0bar, s1);
and g5(n3, i2, s0, s1bar); 
and g6(n4, i3,n3, s1);
or g7(y,n1,n2,n3,n4);

endmodule
