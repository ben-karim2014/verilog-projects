`timescale 1ns / 1ps
`define tracker 
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:32:00 11/28/2020
// Design Name:   parking_meter
// Module Name:   
// Project Name:  parking_meter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: parking_meter
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
	reg clk;
	reg rst;
	reg rst1;
	reg rst2;
	reg add1;
	reg add2;
	reg add3;
	reg add4;

	// Outputs
	wire [6:0] led_seg;
	wire a1;
	wire a2;
	wire a3;
	wire a4;
	wire [3:0] val1;
	wire [3:0] val2;
	wire [3:0] val3;
	wire [3:0] val4;
	
	// Instantiate the Unit Under Test (UUT)
	parking_meter uut (
		.clk(clk), 
		.rst(rst), 
		.rst1(rst1), 
		.rst2(rst2), 
		.add1(add1), 
		.add2(add2), 
		.add3(add3), 
		.add4(add4), 
		.led_seg(led_seg), 
		.a1(a1), 
		.a2(a2), 
		.a3(a3), 
		.a4(a4), 
		.val1(val1), 
		.val2(val2), 
		.val3(val3), 
		.val4(val4)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		rst1 = 0;
		rst2 = 0;
		add1 = 0;
		add2 = 0;
		add3 = 0;
		add4 = 0;

	// Perform the hard reset to 0
		clk = ~clk;
		#5000000
		clk = ~clk;
		rst = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		rst = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		rst = 0;	
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		
		
		
	
		
		// Add 60 seconds
		clk = ~clk;
		#5000000
		clk = ~clk;
		add1 = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		add1 = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		
		while(val3 >4) begin
			#5000000
		   clk = ~clk;
		end
		
		// Add 120 seconds
		#5000000
		clk = ~clk;
		add2 = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		add2 = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		
		
		
		while(val3 != 4) begin
			#5000000
		   clk = ~clk;
		end
	   /// add 180 seconds
		
		#5000000
		clk = ~clk;
		add3 = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		add3 = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		add2 = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		
		while(val3 != 4) begin
			#5000000
		   clk = ~clk;
		end
		
		// Add 300 seconds
		#5000000
		clk = ~clk;
		add4 = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		add4 = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		
		while(val3 > 2) begin
			#5000000
		   clk = ~clk;
			end
			
		// testing the first rest to 16 seconds
		#5000000
		clk = ~clk;
		rst1 = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		rst1 = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		
		while(val3 != 0) begin
			#5000000
		   clk = ~clk;
			end
		// adding 60 seconds after the first reset

		#5000000
		clk = ~clk;
		add1 = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		add1 = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		while(val3 != 3) begin
			#5000000
		   clk = ~clk;
			end
		// testing rest2 to 150 seconds
		
		#5000000
		clk = ~clk;
		rst2 = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		rst2 = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		while(val3 != 4) begin
			#5000000
		   clk = ~clk;
			end
		
		// adding 60 seconds after the the second reset
		
		#5000000
		clk = ~clk;
		add1 = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		add1 = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		while(val3 != 8) begin
			#5000000
		   clk = ~clk;
			end
			
		////Testing the 9999 limit time
       	while(val1 != 9) begin
			#5000000
		   clk = ~clk;
			add4=1;
			end
			while(val2 != 9) begin
			#5000000
		   clk = ~clk;
			add4=1;
			end
			#5000000
		   clk = ~clk;
			add4=0;
			#5000000
		   clk = ~clk;
			add4=1;
			#5000000
		   clk = ~clk;
			add4=0;
			#5000000
		   clk = ~clk;
			add4=1;
			#5000000
		   clk = ~clk;
			add4=0;
			#5000000
		   clk = ~clk;
			add4=1;
			#5000000
		   clk = ~clk;
			add4=0;
			/// reset to zero
		clk = ~clk;
		#5000000
		clk = ~clk;
		rst = 1;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		rst = 0;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
		#5000000
		clk = ~clk;
			
			
	end
      
endmodule

