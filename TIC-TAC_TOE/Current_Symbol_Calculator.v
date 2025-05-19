module current_symbol_cal(input [8:0] v,output cursym);  

    wire valid_xor; 
    xor (valid_xor,v[0],v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8]);
    not (cursym,valid_xor);

endmodule