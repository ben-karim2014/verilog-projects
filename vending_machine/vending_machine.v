`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:25:46 12/12/2020 
// Design Name: 
// Module Name:    vending_machine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////



module vending_machine( CARD_IN,VALID_TRAN, ITEM_CODE,KEY_PRESS, DOOR_OPEN, RELOAD, CLK, RESET, VEND, INVALID_SEL, FAILED_TRAN, COST
	// slotOutput,
	// slotOutputsm
    );

	 input CARD_IN;
    input VALID_TRAN;
    input [3:0] ITEM_CODE;
    input KEY_PRESS;
    input DOOR_OPEN;
    input RELOAD;
    input CLK;
    input RESET;
	 
    output  VEND;
    output  INVALID_SEL;
    output  FAILED_TRAN;
    output  [2:0] COST;
	 
	 //output [3:0] slotOutput;
	 //output [3:0] slotOutputsm;
	 reg [3:0] current_state;
	 wire [3:0] next_state;
	 reg [3:0] array4[19:0];
	 integer i;
	 integer j;
	 
	 wire [2:0] counter;
	 wire start_counting;
	 wire [3:0] firstDigit;
	 wire [3:0] secondDigit;
	 reg [19:0] ItemsStock;
	 initial ItemsStock = 20'b00000000000000000000;
	 
	 always@(posedge CLK)
	 begin
		if(RESET)
			current_state <= 4'b0001;
		else
			current_state <= next_state;
	 end

	 // Module responsible in counting the five cycles requirement
	fsm_fivecounterer c1(CLK, current_state, start_countering, counter);
	
	//always block to set the items stokes based on the curren_state
	 always @ (posedge CLK)
	 begin
		if (current_state == 4'b0001) // reset state
		begin
			for(i = 0; i<20; i = i +1) begin
			array4[i] <= 0;
			end 
		end
		else if (current_state == 4'b1101) // reload state
		begin
			for(i = 0; i<20; i = i +1) begin
			array4[i] <= 10;
			end 
		end
		else if(current_state == 4'b0111) // Vend state
		begin
					if (firstDigit ==0)begin
					/**/
					for(i = 0; i < 10 ; i = i+1) begin
					if (secondDigit == i) array4[i] <= array4[i] - 1;
					end 
					end
					
					else if(firstDigit ==1)begin
					for(i = 10; i < 20 ; i = i+1) begin
					if (secondDigit == i%10) array4[i] <= array4[i] - 1;
					end
					end	
		end
	 end
	 
assign slotOutput = array4[08];
assign slotOutputsm = array4[18];


always @(*) begin
for(i = 0; i <20; i =i+1) begin
if(array4[i]> 0) ItemsStock[i] <= 1;
else ItemsStock[i] <= 0;
end
end


//fsm state controller module: Used to define the next state based on the current state
fsm_stateController c2(CLK, RELOAD,RESET, CARD_IN, KEY_PRESS, DOOR_OPEN, VALID_TRAN, ITEM_CODE, 
								current_state, next_state, firstDigit, secondDigit, ItemsStock, counter, start_countering);

//fsm output module: used to define the output of the vending machine based on the current state
fsm_ouput c3(current_state, firstDigit, secondDigit, RELOAD, VEND, INVALID_SEL, COST, FAILED_TRAN);
endmodule


//fsm output module: used to define the output of the vending machine based on the current state

module fsm_ouput (current_state, firstDigit, secondDigit, RELOAD, VEND, INVALID_SEL, COST, FAILED_TRAN);
input [3:0] current_state;
input [3:0] firstDigit;
input [3:0] secondDigit;
input RELOAD;
output wire VEND;
output  wire INVALID_SEL;
output  wire [2:0] COST;
output wire FAILED_TRAN;

reg vend;
reg invalid;
reg [2:0] cost;
reg failed_tran;

always @(*) begin

		if(current_state == 4'b0000 || current_state == 4'b0010 ||
		current_state == 4'b0011 || current_state == 4'b0100 ||
		current_state == 4'b1110 || current_state == 4'b0110)
				begin
					vend = 0;
					invalid = 0;
					cost = 3'b000;
					failed_tran = 0;
				end
		else if (current_state == 4'b0001)
					begin
					vend = 0;
					invalid = 0;
					cost = 3'b000;
					failed_tran = 0;
					end
		else if (RELOAD == 1)
					begin
					vend = 0;
					invalid = 0;
					cost = 3'b000;
					failed_tran = 0;
					end
		else if (current_state == 4'b1000)
				begin
					vend = 0;
					invalid = 1;
					cost = 3'b000;
					failed_tran = 0;
				end
		else if (current_state == 4'b0101)
			begin
					if (firstDigit ==0) begin
					 if(secondDigit ==0) cost = 1;
					 else if(secondDigit ==1) cost = 1;
					 else if(secondDigit ==2) cost = 1;
					 else if(secondDigit ==3) cost = 1;
					 else if(secondDigit ==4) cost = 2;
					 else if(secondDigit ==5) cost = 2;
					 else if(secondDigit ==6) cost = 2;
					 else if(secondDigit ==7) cost = 2;
					 else if(secondDigit ==8) cost = 3;
					 else if(secondDigit ==9) cost = 3;
					end
					else if (firstDigit ==1) begin
					 if(secondDigit ==0) cost = 3;
					 else if(secondDigit ==1) cost = 3;
					 else if(secondDigit ==2) cost = 4;
					 else if(secondDigit ==3) cost = 4;
					 else if(secondDigit ==4) cost = 4;
					 else if(secondDigit ==5) cost = 4;
					 else if(secondDigit ==6) cost = 5;
					 else if(secondDigit ==7) cost = 5;
					 else if(secondDigit ==8) cost = 6;
					 else if(secondDigit ==9) cost = 6;
					end
			end
		else if (current_state == 4'b1001) failed_tran = 1;
		else if (current_state == 4'b0111) vend = 1;
	end  

assign VEND = vend;
assign INVALID_SEL = invalid;
assign COST = cost;
assign FAILED_TRAN = failed_tran;


endmodule


//fsm state controller module: Used to define the next state based on the current state

module fsm_stateController (CLK, RELOAD, RESET, CARD_IN, KEY_PRESS, DOOR_OPEN, VALID_TRAN, ITEM_CODE, 
								current_state, next_state, firstDigit, secondDigit, ItemsStock, counter, start_countering);
input CLK;
input RELOAD;
input RESET;
input CARD_IN;
input KEY_PRESS;
input VALID_TRAN;
input DOOR_OPEN;
input [19:0] ItemsStock;
input [3:0] ITEM_CODE;
input [3:0] current_state;
input [2:0] counter;
output reg [3:0] next_state;
output reg [3:0] firstDigit;
output reg [3:0] secondDigit;
output reg start_countering;
reg firstDigitinputted;
initial firstDigitinputted =0;

 always @ (*) begin
	  if(current_state == 4'b0001) begin 
				if(RESET ==0) begin
				next_state <= 4'b0000;
				start_countering = 0;
				end
	  end
	  else if(current_state == 4'b0000)
		begin
					firstDigitinputted = 0;
					start_countering = 0;
					if(RELOAD == 1)
						next_state <= 4'b1101;
					else if(CARD_IN == 1)
						next_state <= 4'b0010;
					else
						next_state <= 4'b0000;
		end
		else if (current_state == 4'b1101)
				begin
					start_countering = 0;
					next_state <= 4'b0000;
				end
		else if (current_state ==4'b0010)
			begin
					if(KEY_PRESS == 0) begin
						next_state <= 4'b1110;
					start_countering = 1;
					end
					else begin 
					if(firstDigitinputted == 0) begin 
							firstDigit = ITEM_CODE;
							firstDigitinputted = 1;
							start_countering = 1;
							next_state <= 4'b0010;
							end 
						else if (firstDigitinputted == 1) begin
							secondDigit = ITEM_CODE;
							next_state <= 4'b0110;
							start_countering = 0;
							end
					end
				end	
			else if (current_state == 4'b1110)
				begin 
					if(counter == 2)
					begin
						next_state <= 4'b1000;
						start_countering = 0;
					end
					else if(KEY_PRESS == 1) begin
						if(firstDigitinputted == 0) begin 
							firstDigit = ITEM_CODE;
							next_state <= 4'b0010;
							firstDigitinputted = 1;
							start_countering = 0;
							end 
						else if (firstDigitinputted == 1) begin
							secondDigit = ITEM_CODE;
							next_state <= 4'b0110;
							start_countering = 0;
							end
					end
					else
					begin
						next_state <= 4'b1110;
						start_countering = 1;
					end
					
					
				end
	  else if (current_state == 4'b0110)
			begin // checking if the selection is valid and the stock of the chosen item is not empty. If all is good we can move to the next state
					start_countering = 0;
						if((firstDigit <=1 && firstDigit >=0) && ((secondDigit >= 0) && secondDigit <= 9) && 
						((ItemsStock[0]) || (ItemsStock[1]) ||(ItemsStock[2]) ||(ItemsStock[3]) ||(ItemsStock[4]) ||
						(ItemsStock[5]) ||(ItemsStock[6]) ||(ItemsStock[7]) ||(ItemsStock[8]) ||(ItemsStock[9])))
							next_state <= 4'b0101;
						else
							next_state <= 4'b1000;
				end
				
		else if (current_state == 4'b1000)
				begin
				next_state <= 4'b0000;
				start_countering = 0;	
			   end
	  
	  else if (current_state == 4'b0101)
				begin
					if(VALID_TRAN == 0)
					begin
						next_state <= 4'b1011;
						start_countering = 1;
					end
					else
					begin
						next_state <= 4'b0111;
						start_countering = 0;
					end		
				end
		else if (current_state == 4'b1011)
				begin
					if (counter != 2 && VALID_TRAN == 0)
							begin
							next_state <= 4'b1011;
							start_countering = 1;
							end
					else begin
					if(counter == 2)
					begin
						next_state <= 4'b1001;
						start_countering = 0;
					end
					
					else if(VALID_TRAN == 1)
					begin
						next_state <= 4'b0111;
						start_countering = 0;
					end
					end
				end
	  else if (current_state == 4'b1001)
			begin
				next_state <= 4'b0000;
				start_countering = 0;
			end
	  else if (current_state == 4'b0111)
				begin
					if(DOOR_OPEN == 0)
					begin
						next_state <= 4'b1100;
						start_countering = 1;
					end
					else
					begin
						 next_state <= 4'b1010;
						start_countering = 0;
					end					
				end
		else if (current_state == 4'b1100)
				begin
					if(counter != 2 && DOOR_OPEN ==0)begin
						next_state <= 4'b1100;
						start_countering = 1;
					end
					else begin 
					if(counter == 2)
					begin
						next_state <= 4'b0000;
						start_countering = 0;
					end
					else if(DOOR_OPEN == 1)
					begin
						next_state <= 4'b1010;
						start_countering = 0;
					end
					end
				end
				
		else if (current_state == 4'b1010)
				begin
					start_countering = 0;
					if(DOOR_OPEN == 1) next_state <= 4'b1010;
					else next_state <= 4'b0000;
				end
		else
			begin
				next_state <= 4'b0000;
				start_countering = 0;
			end
	  
	  end


endmodule

//Module for the cycles counting
module fsm_fivecounterer (CLK, current_state, start_countering, counter);
input CLK;
input [3:0] current_state;
input start_countering;
output reg [2:0] counter; 
reg Start_Pulse;


 always@(posedge CLK)
	 begin
		if(current_state == 4'b0010) 
			Start_Pulse <= 1;
		else if (current_state == 4'b0101) 
			Start_Pulse <= 1;
		else if (current_state == 4'b0111)
			Start_Pulse <= 1;
		else
			Start_Pulse <= 0;
	 end
	 
	 always @ (posedge CLK)
    begin
		if (Start_Pulse)
			counter <= 3'b000;
		else if(start_countering == 1)
			counter <= counter + 1'b1;
	 end
endmodule
