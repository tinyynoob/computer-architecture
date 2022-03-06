module CLA_32bit(A, B, ci, sum, co);
	input [31:0]A, B;
	input ci;
	output co;
	output [31:0]sum;
	
	wire [7:1]c;

	CLA M1(A[3:0], B[3:0], ci, sum[3:0], c[1]);
	CLA M2(A[7:4], B[7:4], c[1], sum[7:4], c[2]);
	CLA M3(A[11:8], B[11:8], c[2], sum[11:8], c[3]);
	CLA M4(A[15:12], B[15:12], c[3], sum[15:12], c[4]);
	CLA M5(A[19:16], B[19:16], c[4], sum[19:16], c[5]);
	CLA M6(A[23:20], B[23:20], c[5], sum[23:20], c[6]);
	CLA M7(A[27:24], B[27:24], c[6], sum[27:24], c[7]);
	CLA M8(A[31:28], B[31:28], c[7], sum[31:28], co);

endmodule


