module mux_data(i0,i1,sel,y);

input i0,i1,sel,y;
output y;

assign y = (~sel & i0) | (sel & i1);

endmodule
