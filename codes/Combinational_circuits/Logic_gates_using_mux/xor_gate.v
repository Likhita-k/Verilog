module xor_gate(a,b,y);

input a,b;
output y;

wire abar;

mux2x1_data mux1(a,abar,b,y);
not g1(abar,a);

endmodule
