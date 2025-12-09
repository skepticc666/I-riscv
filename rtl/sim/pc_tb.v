module pc_tb;

    reg clk;
    reg rst;
    reg [31:0] PC_Next;
    wire [31:0] PC;

    // DUT instantiation
    PC_Module u_PC_Module (
        .clk(clk),
        .rst(rst),
        .PC(PC),
        .PC_Next(PC_Next)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // toggle every 5 time units
    end

    // Stimulus
    initial begin
        rst = 0;
        PC_Next = 32'h00000000;

        #12;
        rst = 1;          // release reset

        PC_Next = 32'h5;
        #10;

        PC_Next = 32'h98;
        #10;

        $finish;
    end

endmodule
