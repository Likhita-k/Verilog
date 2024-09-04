module mux_gate(i0,i1,sel,y); 
input i0,i1,sel;
output y;


wire n1,n2,selbar;

not g1(selbar,sel);
and g2(n1,sel,i1);
and g3(n2,selbar,i0);
or g4(y,n1,n2);

endmodule

