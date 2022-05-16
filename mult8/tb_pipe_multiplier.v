`include "pipe_multiplier.v"
`timescale 100ps/10ps

module tb_pipe_multiplier();
    integer i;
    reg clk, rst_n;
    reg [7:0] a, b;
    wire [15:0] product;

    pipe_multiplier m1(.clk(clk), .rst_n(rst_n), .A(a), .B(b), .product(product));

    always begin
        #1;
        clk <= ~clk;
    end

    initial begin
        $dumpfile("tb_pipe_multiplier.vcd");
        $dumpvars;
        clk = 0;
        rst_n = 0;
        a = $random;
        b = 115;
        #2 rst_n = 1;
        $display("a = %d, b = %d", a, b);
        for (i = 0; i < 16; i = i + 1) begin
            #2;
            $display("%t: product = %d", $time, product);
        end
        $finish;
    end
endmodule