module D_flipflop_3bit(
	input D_3b, Clock_3bit,
	output Qa_3b,Qa_not_3b,Qb_3b,Qb_not_3b,Qc_3b,Qc_not_3b
);
	not(nClk_3bit,Clock_3bit);
	D_latch Latch(
		.d(D_3b),.clk(Clock_3bit),
		.Qa(Qa_3b),.Qb(Qa_not_3b)
	);
	D_flipflop FF1(
		.D(D_3b),.Clock(Clock_3bit),
		.Q(Qb_3b),.Qnot(Qb_not_3b)
	);
	D_flipflop FF2(
		.D(D_3b),.Clock(nClk_3bit),
		.Q(Qc_3b),.Qnot(Qc_not_3b)
	);
endmodule