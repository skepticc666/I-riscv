module execute_tb();
    
    reg clk,rst,RegWriteE,ALUSrcE,MemWriteE,BranchE;
    reg [1:0] ResultSrcE;
    reg [2:0] ALUControlE;
    reg [4:0] RD_E;
    reg [31:0] RD1_E,RD2_E,Imm_Ext_E,PCE,PCPlus4E;

    wire PCSrcE,RegWriteM,MemWriteM;
    wire [31:0] PCTargetE,PCPlus4M,WriteDataM,ALU_ResultM;
    wire [1:0] ResultSrcM;
    wire [4:0] RD_M;

    
    execute_cycle u_execute_cycle (
    .clk            (clk),
    .rst            (rst),
    .RegWriteE      (RegWriteE),
    .ALUSrcE        (ALUSrcE),
    .MemWriteE      (MemWriteE),
    .ResultSrcE     (ResultSrcE),
    .BranchE        (BranchE),
    .ALUControlE    (ALUControlE),
    .RD1_E          (RD1_E),
    .RD2_E          (RD2_E),
    .Imm_Ext_E      (Imm_Ext_E),
    .RD_E           (RD_E),
    .PCE            (PCE),
    .PCPlus4E       (PCPlus4E),
    .PCSrcE         (PCSrcE),
    .PCTargetE      (PCTargetE),
    .RegWriteM      (RegWriteM),
    .MemWriteM      (MemWriteM),
    .ResultSrcM     (ResultSrcM),
    .RD_M           (RD_M),
    .PCPlus4M       (PCPlus4M),
    .WriteDataM     (WriteDataM),
    .ALU_ResultM    (ALU_ResultM)
    );

    initial begin
        clk = 0 ; 
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 0;
        #7;
        rst = 1;
        RegWriteE = 1'b1;
        ResultSrcE = 2'b00;
        MemWriteE = 1'b0;
        BranchE = 1'b0;
        ALUControlE = 3'b000;
        ALUSrcE = 1'b1;
        RD1_E = 32'h55;
        RD2_E = 32'h56;
        Imm_Ext_E = 32'h57;
        RD_E = 5'h5;
        PCE = 32'h58;
        PCPlus4E = 32'h59;
        #50;
        $finish;
    end


endmodule