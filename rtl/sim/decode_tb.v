module decode_tb();

    reg clk,rst,RegWriteW;
    reg [31:0] InstrD,PCD,PCPlus4D,ResultW;
    reg [4:0] RDW;

    wire RegWriteE,MemWriteE,BranchE,ALUSrc;
    wire [1:0] ResultSrc;
    wire [2:0] ALUControlE;
    wire [4:0] RS1_E,RS2_E,RD_E;
    wire [31:0] Imm_Ext_E,RD1_E,RD2_E,PCE,PCPlus4E;

    decode_cycle u_decode_cycle (
    .clk            (clk),
    .rst            (rst),
    .InstrD         (InstrD),
    .PCD            (PCD),
    .PCPlus4D       (PCPlus4D),
    .RegWriteW      (RegWriteW),
    .RDW            (RDW),
    .ResultW        (ResultW),
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
    .RS1_E          (RS1_E),
    .RS2_E          (RS2_E)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1'b0;
        #5;
        rst = 1'b1;
        InstrD = 32'h12345678;
        RegWriteW = 1'b0;
        PCD = 32'h51;
        PCPlus4D = 32'h52;
        ResultW = 32'h53;
        RDW = 5'h15;
        $finish;



    end

endmodule