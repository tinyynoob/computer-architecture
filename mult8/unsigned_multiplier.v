module unsigned_multiplier(
input[7:0] a,
input[7:0] b,
output[15:0] product
);
    wire [5:0] s [0:6];
    wire [6:0] co [0:6];
    assign product[0] = a[0] & b[0];
    fa7 r0 (.a({7{a[0]}} & b[7:1]), .b(7'd0), .c({7{a[1]}} & b[6:0]), .sum({s[0], product[1]}), .co(co[0]));
    fa7 r1 (.a({a[1] & b[7], s[0]}), .b(co[0]), .c({7{a[2]}} & b[6:0]), .sum({s[1], product[2]}), .co(co[1]));
    fa7 r2 (.a({a[2] & b[7], s[1]}), .b(co[1]), .c({7{a[3]}} & b[6:0]), .sum({s[2], product[3]}), .co(co[2]));
    fa7 r3 (.a({a[3] & b[7], s[2]}), .b(co[2]), .c({7{a[4]}} & b[6:0]), .sum({s[3], product[4]}), .co(co[3]));
    fa7 r4 (.a({a[4] & b[7], s[3]}), .b(co[3]), .c({7{a[5]}} & b[6:0]), .sum({s[4], product[5]}), .co(co[4]));
    fa7 r5 (.a({a[5] & b[7], s[4]}), .b(co[4]), .c({7{a[6]}} & b[6:0]), .sum({s[5], product[6]}), .co(co[5]));
    fa7 r6 (.a({a[6] & b[7], s[5]}), .b(co[5]), .c({7{a[7]}} & b[6:0]), .sum({s[6], product[7]}), .co(co[6]));
    wire [5:0] tmp;
    fa7 r7 (.a({a[7] & b[7], s[6]}), .b(co[6]), .c({tmp, 1'b0}), .sum(product[14:8]), .co({product[15], tmp}));

endmodule

module fa7(a, b, c, sum, co);
    input [6:0] a, b, c;   
    output [6:0] sum, co;
    assign {co[0], sum[0]} = a[0] + b[0] + c[0];
    assign {co[1], sum[1]} = a[1] + b[1] + c[1];
    assign {co[2], sum[2]} = a[2] + b[2] + c[2];
    assign {co[3], sum[3]} = a[3] + b[3] + c[3];
    assign {co[4], sum[4]} = a[4] + b[4] + c[4];
    assign {co[5], sum[5]} = a[5] + b[5] + c[5];
    assign {co[6], sum[6]} = a[6] + b[6] + c[6];
endmodule

module fa(a, b, c, sum, co);
    input a, b, c;
    output sum, co;
    assign {co, sum} = a + b + c;
endmodule
