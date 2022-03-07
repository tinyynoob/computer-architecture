
module multiplier_6bit (A, B, ans);
	input [5:0]A, B;
	output [11:0]ans;
	wire [5:0]prod[5:0];

	assign prod[0][5:0] = A[5:0] * B[0];
	assign prod[1][5:0] = A[5:0] * B[1];
	assign prod[2][5:0] = A[5:0] * B[2];
	assign prod[3][5:0] = A[5:0] * B[3];
	assign prod[4][5:0] = A[5:0] * B[4];
	assign prod[5][5:0] = A[5:0] * B[5];

	wire [23:0]sum;
	wire [11:0]carry;
	CLA_4bit a1 (.A(prod[0][3:0]), .B({prod[1][2:0],1'b0}), .ci(1'b0), .sum(sum[3:0]), .co(carry[0]));
	CLA_3bit a2 (.A({1'b0,prod[0][5:4]}), .B({prod[1][5:3]}), .ci(carry[0]), .sum(sum[6:4]), .co(sum[7]));
	CLA_4bit a3 (.A(prod[2][3:0]), .B({prod[3][2:0],1'b0}), .ci(1'b0), .sum(sum[11:8]), .co(carry[1]));
	CLA_3bit a4 (.A({1'b0,prod[2][5:4]}), .B({prod[3][5:3]}), .ci(carry[1]), .sum(sum[14:12]), .co(sum[15]));
	CLA_4bit a5 (.A(prod[4][3:0]), .B({prod[5][2:0],1'b0}), .ci(1'b0), .sum(sum[19:16]), .co(carry[2]));
	CLA_3bit a6 (.A({1'b0,prod[4][5:4]}), .B({prod[5][5:3]}), .ci(carry[2]), .sum(sum[22:20]), .co(sum[23]));
	
	/* we are going to do:
	 *                  oooooooo
	 *                oooooooo
	 *            + oooooooo
	 */
	wire [10:0]tmp;
	assign ans[1:0] = sum[1:0];
	ripple_adder ra1 (.a(sum[2]), .b(sum[8]), .ci(1'b0), .sum(ans[2]), .co(carry[3]));
	ripple_adder ra2 (.a(sum[3]), .b(sum[9]), .ci(carry[3]), .sum(ans[3]), .co(carry[4]));
	CLA_4bit a7 (.A(sum[7:4]), .B(sum[13:10]), .ci(carry[4]), .co(carry[5]), .sum(tmp[3:0]));
	CLA_4bit a8 (.A(tmp[3:0]), .B(sum[19:16]), .ci(1'b0), .co(carry[6]), .sum(ans[7:4]));
	ripple_adder ra3 (.a(carry[5]), .b(sum[14]), .ci(carry[6]), .sum(tmp[4]), .co(carry[7]));
	ripple_adder ra4 (.a(tmp[4]), .b(sum[20]), .ci(1'b0), .sum(ans[8]), .co(carry[8]));
	ripple_adder ra5 (.a(carry[7]), .b(sum[15]), .ci(carry[8]), .sum(tmp[5]), .co(carry[9]));
	ripple_adder ra6 (.a(tmp[5]), .b(sum[21]), .ci(1'b0), .sum(ans[9]), .co(carry[10]));
	ripple_adder ra7 (.a(carry[9]), .b(sum[22]), .ci(carry[10]), .sum(ans[10]), .co(carry[11]));
	ripple_adder ra8 (.a(carry[11]), .b(sum[23]), .ci(1'b0), .sum(ans[11]), .co());
	/* The reason of no last carry out :
	 * sum[23]=1 implies sum[22]=0
	 * sum[15]=1 implies sum[14]=0
	 * Suppose sum[15] is 1.
	 * Then sum[14] is 0 and c[7], c[8] can't be both 1. (c denotes carry)
	 * And then c[9], c[10] can't be both 1.
	 * Thus in case sum[23]=1, c[11] must be 0.
	 */
endmodule

module ripple_adder(a, b, ci, sum, co);
	input a, b, ci;
	output co, sum;

	assign sum = a ^ b ^ ci;
	assign co = (a & b) | (a & ci) | (b & ci);
endmodule

module CLA_4bit(A, B, ci, sum, co);
	input [3:0]A, B;
	input ci;
	output [3:0]sum;
	output co;
	wire [3:0]c, p, g;
	
	assign p[3:0] = A[3:0] ^ B[3:0];
	assign g[3:0] = A[3:0] & B[3:0];

	assign c[0] = ci;
	assign c[1] = g[0] | (p[0]&ci);
	assign c[2] = g[1] | (p[1]&g[0]) | (p[1]&p[0]&ci);
	assign c[3] = g[2] | (p[2]&g[1]) | (p[2]&p[1]&g[0]) | (p[2]&p[1]&p[0]&ci);
	assign co = g[3] | (p[3]&g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]) | (p[3]&p[2]&p[1]&p[0]&ci);
	assign sum[3:0] = p[3:0] ^ c[3:0];
endmodule

module CLA_3bit(A, B, ci, sum, co);
	input [2:0]A, B;
	input ci;
	output [2:0]sum;
	output co;
	wire [2:0]c, p, g;
	
	assign p[2:0] = A[2:0] ^ B[2:0];
	assign g[2:0] = A[2:0] & B[2:0];

	assign c[0] = ci;
	assign c[1] = g[0] | (p[0]&ci);
	assign c[2] = g[1] | (p[1]&g[0]) | (p[1]&p[0]&ci);
	assign co = g[2] | (p[2]&g[1]) | (p[2]&p[1]&g[0]) | (p[2]&p[1]&p[0]&ci);
	assign sum[2:0] = p[2:0] ^ c[2:0];
endmodule
