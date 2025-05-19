module demux_1x4(output [3:0] out, input in, input [1:0] sel);
   
    wire [1:0]selc;  // complement of select line
    not(selc[0],sel[0]);
    not(selc[1],sel[1]);
    and(out[0],selc[0],selc[1],in);
    and(out[2],selc[0],sel[1],in);
    and(out[1],sel[0],selc[1],in);
    and(out[3],sel[0],sel[1],in);

endmodule

module mux_2x1(output out,input a,input b,input sel );
    wire selc;  // complement of select
    not (selc,sel);
    and (f1,selc,a);
    and (f2,sel,b);
    or  (out,f1,f2);

endmodule
