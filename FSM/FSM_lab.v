module FSM_lab(clk, rst, in, out);
    input clk;
    input rst;
    input in;
    output reg out;

    reg [2:0]buffer;

    always @(posedge clk) begin
        if (rst) begin
            buffer <= 0;
        end
        else begin
            // update buffer
            buffer <= buffer << 1;
            buffer[0] <= in;
            // generate out (simultaneously)
            if ((buffer == 3'b111 || buffer == 3'b100) && in)
                out <= 1;
            else
                out <= 0;
        end
    end
endmodule