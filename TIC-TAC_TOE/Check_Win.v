module check_win(input [8:0]val,input [8:0] sym,output [1:0]gs);       // gs -> game state
  
    wire and1,and2,and3,and4,and5,and6,and7,and8,or1,or2,or3,or4,or5,or6,or7,or8;
    wire vr1,vr2,vr3,vc1,vc2,vc3,vd1,vd2;   // vr - > valid row , vc -> valid column , vd -> valid diagonal
    
    and (vr1,val[0],val[1],val[2]);
    and (and1,vr1,sym[0],sym[1],sym[2]);
    or  (or1,~vr1,sym[0],sym[1],sym[2]);

    and (vr2,val[3],val[4],val[5]);
    and (and2,vr2,sym[3],sym[4],sym[5]);
    or  (or2,~vr2,sym[3],sym[4],sym[5]);

    and (vr3,val[6],val[7],val[8]);
    and (and3,vr3,sym[6],sym[7],sym[8]);
    or  (or3,~vr3,sym[6],sym[7],sym[8]);

    and (vc1,val[0],val[3],val[6]);
    and (and4,vc1,sym[0],sym[3],sym[6]);
    or  (or4,~vc1,sym[0],sym[3],sym[6]);

    and (vc2,val[1],val[4],val[7]);
    and (and5,vc2,sym[1],sym[4],sym[7]);
    or  (or5,~vc2,sym[1],sym[4],sym[7]);

    and (vc3,val[2],val[5],val[8]);
    and (and6,vc3,sym[2],sym[5],sym[8]);
    or (or6,~vc3,sym[2],sym[5],sym[8]);

    and (vd1,val[0],val[4],val[8]);
    and (and7,vd1,sym[0],sym[4],sym[8]);
    or  (or7,~vd1,sym[0],sym[4],sym[8]);

    and (vd2,val[2],val[4],val[6]);
    and (and8,vd2,sym[2],sym[4],sym[6]);
    or  (or8,~vd2,sym[2],sym[4],sym[6]);

    or (gs[0],and1,and2,and3,and4,and5,and6,and7,and8);
    or (gs[1],~or1,~or2,~or3,~or4,~or5,~or6,~or7,~or8);

endmodule