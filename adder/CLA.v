module CLA(A, B, ci, sum, co);
	input [3:0]A, B;
	input ci;
	output [3:0]sum;
	output co;

	wire [3:0]c, p, g;
	
	assign p[3:0] = A[3:0] ^ B[3:0];
	assign g[3:0] = A[3:0] & B[3:0];

	assign c[0] = ci;
	assign c[1] = g[0] + (p[0]&ci);
	assign c[2] = g[1] + (p[1]&g[0]) + (p[1]&p[0]&ci);
	assign c[3] = g[2] + (p[2]&g[1]) + (p[2]&p[1]&g[0]) + (p[2]&p[1]&p[0]&ci);
	assign co = g[3] + (p[3]&g[2]) + (p[3]&p[2]&g[1]) + (p[3]&p[2]&p[1]&g[0]) + (p[3]&p[2]&p[1]&p[0]&ci);

	assign sum[3:0] = p[3:0] ^ c[3:0];

endmodule
