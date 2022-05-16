module pipe_multiplier( clk , rst_n , A , B , product );
input clk ;
input rst_n ; // if rst_n is 0，reset product
input [7:0]A ; // multiplicand
input [7:0]B; // multiplier
output reg [15:0]product ;

    reg [2:0] counter;
    always @(posedge clk) begin
        if (!rst_n)
            counter <= 0;
        else
            counter <= counter == 7 ? 7 : counter + 1;
    end

    reg term;
    always @(posedge clk) begin
        if (!rst_n)
            term <= 0;
        else if (counter == 7)
            term <= 1;
    end

    always @(posedge clk) begin
        if (!rst_n)
            product <= 0;
        else if (!term)
            product <= product + ((A[7:0] & {8{B[counter]}}) << counter);
    end

endmodule