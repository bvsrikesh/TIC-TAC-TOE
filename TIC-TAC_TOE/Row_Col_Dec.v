module row_col_decoder(input [1:0] r,input [1:0] c,input s,output [8:0] mrc);

    wire [3:0] v;
    wire m1,m2,m3;

    demux_1x4 dm1 (v,s,r);
    demux_1x4 dm2 ({mrc[2:0],m1},v[1],c);
    demux_1x4 dm3 ({mrc[5:3],m2},v[2],c);
    demux_1x4 dm4 ({mrc[8:6],m3},v[3],c);

endmodule