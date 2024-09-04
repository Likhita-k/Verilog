module pri_encoder(y0,y1,en,d);

input [3:0] d;
input en;
output y0,y1;

assign y1 = (d[3] + d[2]) & en;
assign y0 = (d[3] + ((~d[2])&d[1])) &en;

endmodule
