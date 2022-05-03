module shift_multiplier( clk , rst_n , A , B , product );
    input clk ;
    input rst_n ; // if rst_n is 0，reset product
    input [3:0]A ; // multiplicand
    input [3:0]B; // multiplier
    output reg [7:0]product ; 
    // if you want to use any variable in always block,declare as output reg 

    reg [2:0] counter;
    always @(posedge clk) begin
        if (!rst_n)
            counter <= 0;
        else
            counter <= counter == 4 ? 4 : counter + 1;
    end

    always @(posedge clk) begin
        if (!rst_n)
            product <= {4'b0000, B};
        else if (counter == 4)
            product <= product;
        else begin
            product[7:3] <= product[7:4] + (product[0] ? A : 0); 
            product[2:0] <= product[3:1];
        end
    end
endmodule