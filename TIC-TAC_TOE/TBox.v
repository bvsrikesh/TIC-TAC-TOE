`include "TCell.v"
`include "Check_Win.v"
`include "Row_Col_Dec.v"
`include "Mux_Demux.v"
`include "Current_Symbol_Calculator.v"

module TBox(input clk,input set,input reset, input [1:0] row, input [1:0] col,output [8:0] valid, output [8:0] symbol, output [1:0] game_state);

    wire cur_symbol,s,set_gameon,va;  // va -> valids and operation
    wire [1:0] cw;    // check_win output
    wire [8:0] rc;   // row column decoded output

    and (set_gameon,set,~game_state[0],~game_state[1]);     // set_gameon enables only when game isn't over
    row_col_decoder rc_dec (row,col,set_gameon,rc);

    current_symbol_cal cur_sym (valid,cur_symbol);

    TCell TC1 (clk,rc[0],reset,cur_symbol,valid[0],symbol[0]);
    TCell TC2 (clk,rc[1],reset,cur_symbol,valid[1],symbol[1]);
    TCell TC3 (clk,rc[2],reset,cur_symbol,valid[2],symbol[2]);
    TCell TC4 (clk,rc[3],reset,cur_symbol,valid[3],symbol[3]);
    TCell TC5 (clk,rc[4],reset,cur_symbol,valid[4],symbol[4]);
    TCell TC6 (clk,rc[5],reset,cur_symbol,valid[5],symbol[5]);
    TCell TC7 (clk,rc[6],reset,cur_symbol,valid[6],symbol[6]);
    TCell TC8 (clk,rc[7],reset,cur_symbol,valid[7],symbol[7]);
    TCell TC9 (clk,rc[8],reset,cur_symbol,valid[8],symbol[8]);

    //game state output
    check_win chewin (valid,symbol,cw);  
    and (va,valid[0],valid[1],valid[2],valid[3],valid[4],valid[5],valid[6],valid[7],valid[8]);
    and (s,~cw[0],~cw[1],va);
    mux_2x1 m01 (game_state[0],cw[0],1'b1,s);
    mux_2x1 m02 (game_state[1],cw[1],1'b1,s);

endmodule