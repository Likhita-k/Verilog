module hs_data(a,b,diff,brw);

input a,b;
output diff,brw;

assign diff = (~a & b) | (a & ~b);
assign brw = ~a&b;

endmodule

