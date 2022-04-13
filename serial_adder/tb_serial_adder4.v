`timescale 1ns/10ps
`include "serial_adder4.v"

module tb_serial_adder();
    reg clk, rst, a, b, c, d;
    wire sum;
    serial_adder4 m1 (.clk(clk), .rst(rst), .a(a), .b(b), .c(c), .d(d), .sum(sum));

    always begin
        #1 clk = ~clk;
    end

    integer seed = 432;
 
    initial begin
        $dumpfile("serial_adder4.vcd");
        $dumpvars;
        #0 clk = 0;
        #0 rst = 1;
        #0 a = 0;
        #0 b = 0;
        #0 c = 0;
        #0 d = 0;
        #2 rst = 0;
        repeat(10) begin
            a = $random(seed);
            b = $random(seed);
            c = $random(seed);
            d = $random(seed);
            #2;
        end
       #10 $finish;
    end

endmodule
