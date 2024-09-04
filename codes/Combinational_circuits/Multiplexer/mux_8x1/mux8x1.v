module mux8x1(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);

input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
output y;

wire m1,m2;

mux_data mux1(i0,i1,i2,i3,s0,s1,m1);
mux_data mux2(i4,i5,i6,i7,s0,s1,m2);
mux_data mux3(m1,m2,1'b0,1'b0,1'b0,s2,y);

endmodule
