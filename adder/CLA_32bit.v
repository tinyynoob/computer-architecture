module CLA_32bit(A, B, ci, sum, co);
	input [31:0]A, B;
	input ci;
	output co;
	output [31:0]sum;
	
	wire [7:1]c;
	
	CLA(A[3:0], B[3:0], ci, sum[3:0], c[1]);
	CLA(A[7:4], B[7:4], c[1], sum[7:4], c[2]);
	CLA(A[11:8], B[11:8], c[2], sum[11:8], c[3]);
	CLA(A[15:12], B[15:12], c[3], sum[15:12], c[4]);
	CLA(A[19:16], B[19:16], c[4], sum[19:16], c[5]);
	CLA(A[23:20], B[23:20], c[5], sum[23:20], c[6]);
	CLA(A[27:24], B[27:24], c[6], sum[27:24], c[7]);
	CLA(A[31:28], B[31:28], c[7], sum[31:28], co);

endmodule



