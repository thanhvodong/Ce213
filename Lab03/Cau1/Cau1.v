module Cau1(
	input x, clk, reset,
	output reg out
);
reg [3:0]state, next_state;
parameter 	s0 = 4'b0000, 
				s1 = 4'b0001,
				s2 = 4'b0011,
				s3 = 4'b0010,
				s4 = 4'b0110, 
				s5 = 4'b0111,
				s6 = 4'b0101,
				s7 = 4'b0100,
				s8 = 4'b1100;
	always @(state or x)
		case (state)
		s0:
		begin
			out = 0;
			if (x == 1'b0) 
				next_state = s1;
			else 
				next_state = s5;
		end
		s1:
		begin
			out = 0;
			if (x == 1'b0) 
				next_state = s2;
			else 
				next_state = s5;
		end
		
		s2:
		begin
			out = 0;
			if (x == 1'b0) 
				next_state = s3;
			else 
				next_state = s5;
		end		
				
		s3:
		begin
			out = 0;
			if (x == 1'b0) 
				next_state = s4;
			else 
				next_state = s5;
		end
		
		s4:
		begin
			out = 1;
			if (x == 1'b0) 
				next_state = s4;
			else 
				next_state = s5; 
		end
		
		s5:
		begin
			out = 0;
			if (x == 1'b1) 
				next_state = s6;
			else 
				next_state = s1; 
		end
		
		s6:
		begin
			out = 0;
			if (x == 1'b1) 
				next_state = s7;
			else 
				next_state = s1;
		end
		
		s7:
		begin
			out = 0;
			if (x == 1'b1) 
				next_state = s8;
			else 
				next_state = s1;
		end
		
		s8:
		begin
			out = 1;
			if (x == 1'b1) 
				next_state = s8;
			else 
				next_state = s1;
		end		
				
		endcase
		
	always @(posedge clk or posedge reset)
		begin
			if (reset == 1'b1)
				state <= s0;
			else 
				state <= next_state;
		end
		
endmodule