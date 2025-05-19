`include "TCell.v"

module TCell_tb;
    wire valid, symbol;
    reg clk, set, reset, set_symbol;
    TCell c(clk, set, reset, set_symbol, valid, symbol);

    initial begin
        //$monitor("Time = %0d, set = %b, reset = %b, set_symbol = %b, valid = %b, symbol = %b", $time, set, reset, set_symbol, valid, symbol);
        clk <= 0;
        #2
        if(valid == 0) $display("Testcase 0 passed");
        else $display("Testcase failed: Valid should be unset initially");

        set_symbol <= 0; set <= 1;
        #20
        if(valid == 1 && symbol == 0) $display("Testcase 1 passed");
        else $display("Testcase failed: Symbol 0 is not set in the cell");

        set_symbol <= 1; set <= 1;
        #20
        if(valid == 1 && symbol == 0) $display("Testcase 2 passed");
        else $display("Testcase failed: Once set, the cell should not change value until reset");

        reset <= 1; set <= 0;
        #2
        if(valid == 1 && symbol == 0) $display("Testcase 3 passed");
        else $display("Testcase failed: Reset should be synchronous");

        #20
        if(valid == 0) $display("Testcase 4 passed");
        else $display("Testcase failed: Reset not working");

        reset <= 0; set_symbol <= 1; set <= 1;
        #20
        if(valid == 1 && symbol == 1) $display("Testcase 5 passed");
        else $display("Testcase failed: Symbol 1 is not set in the cell");

        reset <= 1; set_symbol <= 1; set <= 1;
        #20
        if(valid == 0) $display("Testcase 6 passed");
        else $display("Testcase failed: Reset should take precedence over Set");

        $finish;
    end

    always
    begin
        #5 clk <= ~clk;
    end
endmodule
