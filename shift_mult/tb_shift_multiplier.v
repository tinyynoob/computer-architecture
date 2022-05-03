`timescale 1ns/100ps

`include "shift_multiplier.v"

module tb_shift_multiplier();
    reg CLK, rst_n;
    integer seed = 23910;
    reg [3:0] A, B;
    wire [7:0] product;

    shift_multiplier m1 (.clk(CLK), .rst_n(rst_n), .A(A), .B(B), .product(product));

    always begin
        #1;
        CLK = ~CLK;
    end

    always @(round) begin
        A <= $random(seed);
        B <= $random(seed);
    end

    integer round;
    initial begin
        $dumpfile("sm.vcd");
        $dumpvars;
        CLK = 0;
        rst_n = 1;
        for (round = 0; round < 100; round = round + 1) begin
            #1 rst_n = 0;
            #2 rst_n = 1;
            #10;
            $display("%d * %d = %d", A, B, product);
            if (A * B != product)
                $display("ERROR!!!");
        end
        $finish;
    end
endmodule