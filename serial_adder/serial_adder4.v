module serial_adder4(clk, rst, a, b, c, d, sum);
    input clk, rst;
    input a, b, c, d;
    output reg sum;
    reg [1:0]buffer;

    always @(posedge clk) begin
        if (rst) begin
            sum <= 0;
            buffer <= 0;
        end
        else begin
            {buffer, sum} <= a + b + c + d + buffer;
        end
    end
endmodule