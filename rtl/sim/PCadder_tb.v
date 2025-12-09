module PCadder_tb();
    reg [31:0] a,b;
    
    wire [31:0] c;

    PC_Adder u_PC_Adder (
    .a    (a),
    .b    (b),
    .c    (c)
    );

    

    initial begin
        a = 32'h10;
        b = 32'h20;
        
    end
endmodule