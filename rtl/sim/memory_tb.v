module memory_tb();

    reg clk,rst,RegWriteM,MemWriteM;
    reg [1:0] ResultSrcM;
    reg [31:0] ALU_ResultM,WriteDataM,PCPlus4M;
    reg [4:0] RD_M;

    wire RegWriteW;
    wire [1:0] ResultSrcW;
    wire [31:0] ALU_ResultW,ReadDataW,PCPlus4W;
    wire [4:0] RD_W;


    memory_cycle u_memory_cycle (
        .clk            (clk),
        .rst            (rst),
        .RegWriteM      (RegWriteM),
        .MemWriteM      (MemWriteM),
        .ResultSrcM     (ResultSrcM),
        .RD_M           (RD_M),
        .PCPlus4M       (PCPlus4M),
        .WriteDataM     (WriteDataM),
        .ALU_ResultM    (ALU_ResultM),
        .RegWriteW      (RegWriteW),
        .ResultSrcW     (ResultSrcW),
        .RD_W           (RD_W),
        .PCPlus4W       (PCPlus4W),
        .ALU_ResultW    (ALU_ResultW),
        .ReadDataW      (ReadDataW)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 0;
        #7;
        rst = 1;
        RegWriteM = 1'b1;
        MemWriteM = 1'b1;
        ResultSrcM = 2'b00;
        ALU_ResultM = 32'h66;
        WriteDataM = 32'h67;
        PCPlus4M = 32'h68;
        RD_M = 4'h5;
        #20;
        MemWriteM = 1'b0;
        #20;
        $finish;

    end
    
endmodule