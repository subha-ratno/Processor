module ALU_tb;
	parameter N=10;
	reg [N-1:0] A, B;
	reg [4:0] func;
	reg clk;
	wire [N*N-1:0] F;
	
	ALU #(.N(10)) m1(.A(A), .B(B), .func(func), .F(F), .clk(clk));
	
	initial clk = 1'b0;
	
	always #10 clk = ~clk;
	
	initial begin
		#5 A=23; B=13; func=2;
		#20 A=14; B=1; func=7;
		#20 A=22; B=7; func=15;
		#20 A=11; B=9; func=9;
	end
	
	initial begin
		$dumpfile("ALU.vcd");
		$dumpvars(0, ALU_tb);
		$monitor("Time=%d: A=%d, B=%d, func=%b, F=%d", $time, A, B, func, F);
		#300 $finish;
	end
endmodule
