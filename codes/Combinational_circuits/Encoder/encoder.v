module encoder(d0,d1,d2,d3,y0,y1);

input d0,d1,d2,d3;
output y0,y1;

assign y1 = (d3^d2) & (~d1&~d0);

assign y0 = (d3^d1) & (~d2&~d0);

endmodule
