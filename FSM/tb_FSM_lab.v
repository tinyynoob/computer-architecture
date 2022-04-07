`timescale 1ns/10ps
// `parameter CASENUM = 20;
module tb_FSM_lab();
    reg [19:0]data;
    reg clk, rst, in;
    integer i;
    wire in_FSM, out_FSM;
    assign in_FSM = in;

    FSM_lab m1 (.clk(clk), .rst(rst), .in(in_FSM), .out(out_FSM));

    always begin
        #1 clk = ~clk;
    end
    initial begin
        $dumpfile("FSM_lab.vcd");
        $dumpvars(0, clk, rst, in, out_FSM);    //ref: http://www.referencedesigner.com/tutorials/verilog/verilog_62.php
        #0 rst = 1;
        #0 clk = 0;
        #0 i = 0;
        #0 in = 0;
        #0 data = 20'b0101_1110_0110_0111_1111;
        #1 rst = 0;
        #40;
        #10 $finish;
    end
    always @(posedge clk) begin
        in = data[20-i-1];
        i = i + 1;
    end
endmodule

