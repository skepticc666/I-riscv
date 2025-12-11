module writeback_tb();
    reg clk, rst ;
    reg [1:0] ResultSrcW;
    reg [31:0] PCPlus4W , ALU_ResultW , ReadDataW;
    wire [31:0] ResultW;

    writeback_cycle u_writeback_cycle (
    .clk            (clk),
    .rst            (rst),
    .ResultSrcW     (ResultSrcW),
    .PCPlus4W       (PCPlus4W),
    .ALU_ResultW    (ALU_ResultW),
    .ReadDataW      (ReadDataW),
    .ResultW        (ResultW)
    );

    initial begin
        clk = 0 ; 
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1'b1;
        #10;
        rst = 1'b0;
        ResultSrcW = 2'b01;
        PCPlus4W = 32'h2;
        ALU_ResultW = 32'h3;
        ReadDataW = 32'h4;
        #50;
        $finish;

    end
    
endmodule