`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12/12/2020
// Design Name:   vending_machine
// Module Name:   
// Project Name:  
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vending_machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_705120273;

	// Inputs
	reg CARD_IN;
	reg VALID_TRAN;
	reg [3:0]ITEM_CODE;
	reg KEY_PRESS;
	reg DOOR_OPEN;
	reg RELOAD;
	reg CLK;
	reg RESET;

	// Outputs
	wire VEND;
	wire INVALID_SEL;
	wire FAILED_TRAN;
	wire [2:0] COST;
//	wire [3:0] current_state;

//	wire [3:0] slotOutput;
//	wire [3:0] slotOutputsm;

	// Instantiate the Unit Under Test (UUT)
	vending_machine uut (
		.CARD_IN(CARD_IN), 
		.VALID_TRAN(VALID_TRAN), 
		.ITEM_CODE(ITEM_CODE), 
		.KEY_PRESS(KEY_PRESS), 
		.DOOR_OPEN(DOOR_OPEN), 
		.RELOAD(RELOAD), 
		.CLK(CLK), 
		.RESET(RESET), 
		.VEND(VEND), 
		.INVALID_SEL(INVALID_SEL), 
		.FAILED_TRAN(FAILED_TRAN), 
		.COST(COST)
//		.current_state(current_state)
		//.slotOutput(slotOutput),
		//.slotOutputsm(slotOutputsm)
	);
	always #10 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		CARD_IN = 0;
		VALID_TRAN = 0;
		ITEM_CODE = 0;
		KEY_PRESS = 0;
		DOOR_OPEN = 0;
		RELOAD = 0;
		CLK = 0;
		RESET = 0;
		
		// SUCCESSFUL OPERATION: first we will try a succesfull transaction with no issues with item that with code less than 10
		#10;
      CLK = 0;
		RESET = 0;
		#10
		
		RESET = 1; // initialization 
		#20
		
		RESET = 0;
		#30
		
		RELOAD = 1; // reloading
		#20
		
		RELOAD = 0; // stop reloading
		#20
		
		CARD_IN = 1; // set card_in to 1
		#20
		
		KEY_PRESS = 1; // Enter the first code digit
		ITEM_CODE = 0;
		#20
		
		KEY_PRESS = 0; 
		#20 
		
		KEY_PRESS = 1; // Enter second code digit
		ITEM_CODE = 8;
		#20
		
		KEY_PRESS = 0;
		#20
		
		VALID_TRAN = 1; // send transaction signal to 1
		#20
		
		VALID_TRAN = 0;
		DOOR_OPEN = 1; // Open the door
		#20
		
		DOOR_OPEN = 0; // close the door
		#20
		
		CARD_IN = 0; // set card_in to 0 to finish the operation
		#40
		
		
		// SUCCESSFUL OPERATION: second we will try a succesfull transaction with no issues with item that with code more than 10
		
		CARD_IN = 1; // set card_in to 1
		#20
		
		KEY_PRESS = 1; // Enter the first code digit
		ITEM_CODE = 1;
		#20
		
		KEY_PRESS = 0; 
		#20 
		
		KEY_PRESS = 1; // Enter second code digit
		ITEM_CODE = 8;
		#20
		
		KEY_PRESS = 0;
		#20
		
		VALID_TRAN = 1; // send transaction signal to 1
		#20
		
		VALID_TRAN = 0;
		DOOR_OPEN = 1; // Open the door
		#20
		
		DOOR_OPEN = 0; // close the door
		#20
		
		CARD_IN = 0; // set card_in to 0 to finish the operation
		#40
		
		/////////////////////////////////////////////////////
		
		
		// FAILED OPERATION: Card inserted but no digit inserted
		CARD_IN = 1; 
		#80
		CARD_IN = 0;
		#170
		////////////////////////////////////////////////////
		
		
		// FAILED OPERATION: card inserted but only first digit
		#10
		CARD_IN = 1; // Set card_in to 1
		#40
	
		KEY_PRESS = 1; // Enter the first digit
		ITEM_CODE = 0;
		#20
		
		KEY_PRESS = 0;
		#120    // Wait for a while to see the machine's ouput
	
		CARD_IN = 0;
		#20
		//////////////////////////////////////////////////////////
		
		
		// FAILED OPERATION: Entering Invalid digits
		
		CARD_IN = 1;
		#20
		
		KEY_PRESS = 1;
		ITEM_CODE = 4;
		#20
		
		KEY_PRESS = 0;
		#20
		
		KEY_PRESS = 1;
		ITEM_CODE = 2;
		#20
		
		KEY_PRESS = 0;
		#40
		
		CARD_IN = 0;
		#20
	
		// FAILED OPERATION: card_in inserted, valid numbers entered, but valid_tran never set to 1
		CARD_IN = 1;
		#20
		
		KEY_PRESS = 1;
		ITEM_CODE = 0;
		#20
		
		KEY_PRESS = 0;
		#20
		
		KEY_PRESS = 1;
		ITEM_CODE = 3;
		#20
		
		KEY_PRESS = 0;
		#80
	
		CARD_IN = 0;
		#80
	
		// FAILED OPERATION: purchasing an item after reset (no item in stock)
		#20
		
		RESET = 1; //return idle state
		#20
		
		RESET = 0; //return idle state
		#20
		
		CARD_IN = 1;
		#20
		
		KEY_PRESS = 1;
		ITEM_CODE = 1;
		#20
		
		KEY_PRESS = 0;
		#20
		
		KEY_PRESS = 1;
		ITEM_CODE = 5;
		#20
		
		
		KEY_PRESS =0;
		#40
		CARD_IN = 0;
		#40
	
		
		
		///////////////////////////////////////
		// FAILED OPERATION: make a transaction durin reloading
		
		 RELOAD=1;
		 #20
		 
		CARD_IN = 1;
		#20
		
		KEY_PRESS = 1;
		ITEM_CODE = 0;
		#20
		
		KEY_PRESS = 0;
		#20
		
		KEY_PRESS = 1;
		ITEM_CODE = 5;
		#20
		
		KEY_PRESS = 0;
		#20
		
		VALID_TRAN = 1; // set transaction signal to 1
		#20
		
		VALID_TRAN = 0;
		#20
		
		CARD_IN = 0; // set card_in to 0 to finish the operation
		#40
		
		RELOAD=0;
		 #20
		 
		RESET=0;
		
		
		// FAILED OPERATION: Enter valid digits without inserting the card, the machine should not go to vend state
		
		
		KEY_PRESS = 1; // Enter the first code digit
		ITEM_CODE = 1;
		#20
		
		KEY_PRESS = 0; 
		#20 
		
		KEY_PRESS = 1; // Enter second code digit
		ITEM_CODE = 3;
		#20
		
		KEY_PRESS = 0;
		#20
		
		VALID_TRAN = 1; // send transaction signal to 1
		#20
		
		VALID_TRAN = 0;
		#20
		
		
		
		CARD_IN = 1;
		#20
		
		KEY_PRESS = 1;
		ITEM_CODE = 0;
		#20
		
		KEY_PRESS = 0;
		#20
		
		RELOAD=1;
		#20
		RELOAD=0;
		#20
		KEY_PRESS = 1;
		ITEM_CODE = 3;
		#20
		
		KEY_PRESS = 0;
		#20
	
		VALID_TRAN = 1; // send transaction signal to 1
		#20
		
		VALID_TRAN = 0;
		DOOR_OPEN = 1; // Open the door
		#20
		
		DOOR_OPEN = 0; // close the door
		#20
		CARD_IN = 0;
		#20
	
		RESET = 0;
	end
endmodule

