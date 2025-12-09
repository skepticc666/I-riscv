module fetch_tb();

    reg clk , rst , PCSrcE;
    reg [31:0] PCTargetE ;
    wire [31:0] InstrD , PCD , PCPlus4D;

    fetch_cycle u_fetch_cycle (
    .clk          (clk),
    .rst          (rst),
    .PCSrcE       (PCSrcE),
    .PCTargetE    (PCTargetE),
    .InstrD       (InstrD),
    .PCD          (PCD),
    .PCPlus4D     (PCPlus4D)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 0;
        PCSrcE = 1;
        PCTargetE = 32'h16;
        #10;
        rst = 1;
        #10
        PCSrcE = 0;
        #50;
        $finish;


    end

endmodule