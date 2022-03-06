`timescale 1ns/10ps
module t_CLA_32bit();

reg [31:0] A, B;
reg ci;
wire [31:0] sum;
wire co;

CLA_32bit u1 (.A(A), .B(B), .ci(ci), .sum(sum), .co(co));

initial begin
    $dumpfile("CLA.vcd");
    $dumpvars(0, A, B, ci, sum, co);    //ref: http://www.referencedesigner.com/tutorials/verilog/verilog_62.php
    #0 ci = 1'b0;
    #0 A = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    #0 B = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    #20 A = 32'b0101_1010_1111_0010_0101_1010_0101_1110;
    #25 ci = 1'b1;
    #30 B = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
    #40 A = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
    #10 $finish;
end

endmodule
