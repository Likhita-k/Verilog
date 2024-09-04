module or_gate(a,b,y);

input a,b;
output y;

mux2x1_data mux1(a,1,b,y);

endmodule

