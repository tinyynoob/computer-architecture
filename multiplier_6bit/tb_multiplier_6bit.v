`timescale 1ns/10ps
module tb_multiplier_6bit();

reg [5:0] A, B;
wire [12:0] prod;

multiplier_6bit u1 (.A(A), .B(B), .ans(prod));

initial begin
    $dumpfile("multiplier_6bit.vcd");
    $dumpvars(0, A, B, prod);
    #0 A = 6'b00_0000;
    #0 B = 6'b00_0000;
    #15 A = 6'b01_1011;
    #15 B = 6'b00_0010;
    #15 A = 6'b11_1111;
    #15 B = 6'b11_1111;
    #15 B = 6'b10_1010;
    #10 $finish;
end

endmodule