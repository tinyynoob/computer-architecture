module booth(clk, rst_n, multiplicand, multiplier, out);
	input signed[7:0] multiplicand, multiplier;
	input clk, rst_n;
	output reg signed [15:0] out;

    reg [3:0] counter;
    always @(posedge clk) begin
        if (!rst_n)
            counter <= 0;
        else
            counter <= counter == 8 ? 8 : counter + 1;
    end

    wire [8:0] y = {multiplier, 1'b0};
    always @(posedge clk) begin
        if (!rst_n)
            out <= 0;
        else if (!counter[3]) begin
            case ({y[counter + 1], y[counter]})
                2'b01: 
                    out <= out + (multiplicand << counter);
                2'b10:
                    out <= out - (multiplicand << counter);
                default: 
                    ;
            endcase
        end
    end
endmodule