module instrmem_tb();

    reg rst;
    reg [31:0] A;
    wire [31:0] RD;


    Instruction_Memory u_Instruction_Memory (
    .rst    (rst),
    .A      (A),
    .RD     (RD)
    );

    initial begin
        // reset
        rst = 1'b0;
        A   = 0;
        #10;
        
        // release reset
        rst = 1'b1;
        // Read instruction 0
        A = 32'h0;
        #10;
        // Read instruction 1
        A = 32'h4;
        #10;
        // Read instruction 2
        A = 32'h8;
        #10;
        // Read instruction 4 (your old A=0x12)
        A = 32'h10;
        #10;
        $finish;
    end

endmodule