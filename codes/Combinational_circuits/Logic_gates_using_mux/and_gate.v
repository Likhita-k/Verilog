module and_gate(a,b,y);

input a,b;
output y;

mux2x1_data mux1(1'b0,a,b,y);

endmodule

