module top_tb();

    reg clk=0, rst;
    
    always begin
        clk = ~clk;
        #50;
    end

    initial begin
        rst <= 1'b0;
        #200;
        rst <= 1'b1;
        #1000;
        $finish;    
    end

    top_module u_top_module (
    .clk    (clk),
    .rst    (rst)
    );

endmodule