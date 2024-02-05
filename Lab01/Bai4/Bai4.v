module Bai4(in,out1,out0);
	input[3:0]in;
	output[6:0]out1;
	output[6:0]out0;
	wire COMOut;
	wire[3:0]MUX;
	wire[2:0]AOut;
	comparator Compare(in,COMOut);
	CircuitB B(COMOut,out1);
	CircuitA A(in[2:0],AOut);
	
	mux2to1 Mux3(in[3],0,COMOut,MUX[3]);
	mux2to1 Mux2(in[2],AOut[2],COMOut,MUX[2]);
	mux2to1 Mux1(in[1],AOut[1],COMOut,MUX[1]);
	mux2to1 Mux0(in[0],AOut[0],COMOut,MUX[0]);
	
	
	DECODER de(MUX,out0);
	
endmodule