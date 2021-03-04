`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:33:03 10/27/2020
// Design Name:   FPCVT
// Module Name:   
// Project Name:  FPCVT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPCVT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_105179657;

	// Inputs
	reg [12:0] D;

	// Outputs
	wire S;
	wire [2:0] E;
	wire [4:0] F;

	// Instantiate the Unit Under Test (UUT)
	FPCVT uut (
		.D(D), 
		.S(S), 
		.E(E), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		D=13'b0000000000000;
		#100;
		D=13'b1111111111111;
		#100;
		D=13'b1000000000000; // using the largest negative. We take the sign bit and for the absolut value we cannot represent 4096 in 13bits, so I took the number closest to it 4095.
		#100;
		D=13'b0111111111111; // using the largest positive number for rounding ==> we used the largest possible Floating Point Representation. 
		#100;
		D=13'b1111001011010; // Extracting the Exponent and the Significant
		#100;
		D=13'b0000001101100; // Rounding down
		#100;
		D=13'b0000001101110; // Rounding up
		#100;
		D=13'b0000001101111; // Rounding up
		#100;
		D=13'b0000011111101; // Significant Overflow 1
		#100;
		D=13'b0001111111101; // Significant Overflow 2
		#100;
		D=13'b0111111111101; // Exponent and seginificant Overflow 
		#100;
	end
      
endmodule

