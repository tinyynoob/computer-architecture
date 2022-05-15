`include "unsigned_multiplier.v"

module tb_unsigned_multiplier();
    integer i;
    reg clk;
    reg [7:0] a, b;
    wire [15:0] product;
    unsigned_multiplier m1(.a(a), .b(b), .product(product));

    always begin
        #1;
        clk <= ~clk;
    end

    initial begin
        clk = 0;
        for (i = 0; i < 15; i = i + 1) begin
            a = $random;
            b = $random;
            #2;
            $display("%d * %d = %d", a, b, product);
        end
        $finish;
    end
endmodule