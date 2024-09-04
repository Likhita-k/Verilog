module fa_ha(a,b,cin,sum,cout);

input a,b,cin;
output sum,cout;

wire n1,n2,n3;

ha_data ha1(a,b,n1,n2);
ha_data ha2(n1,cin,sum,n3);
or g1(cout,n2,n3);

endmodule
