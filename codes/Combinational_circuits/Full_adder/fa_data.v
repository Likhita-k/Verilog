module fa_data(a,b,cin,sum,cout);

input a,b,cin;
output sum,cout;

assign sum = (((~a & b) | (a & ~b)) & ~cin) |((~(~a & b) | (a & ~b)) & cin);
assign carry = (a&b) | (((a&b) & ~cin) | (~(a&b) & cin));


endmodule


