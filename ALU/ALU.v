module ALU #(parameter N=10) (
	input [N-1:0] A, B,
	input [4:0] func,
	input clk,
	output [N*N-1:0] F);
  
	reg [N*N-1:0] result;
	
	always@(posedge clk) begin
		case(func)		//add delays to the operations
			0: result <= A+B;
			1: result <= A-B;
			2: result <= A*B;
			3: result <= A;
			4: result <= B;
			5: result <= A&B;
			6: result <= A|B;
			7: result <= A^B;
			8: result <= ~(A|B);
			9: result <= ~(A&B);
			10: result <= ~A;
			11: result <= ~B;
			12: result <= A>>1;
			13: result <= A<<1;
			default: result <= 0;
		endcase
	end
	
	assign F = result;

endmodule
