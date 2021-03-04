`timescale 1ns / 1ps
`define MAX 14'b10011100001111	// # 9999
`define MIN 14'b00000000000000	// # 0
`define COUNTER_PULSE 100
`define FLASING_PULSE 49
`define INPUT_STATE1 14'd16
`define INPUT_STATE2 14'd150
`define INPUT_STATE3 14'd180
`define INPUT_STATE4 14'd120
`define INPUT_STATE5 14'd300
`define INPUT_STATE6 14'd60
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:23 11/28/2020 
// Design Name: 
// Module Name:    parking_meter 
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
module parking_meter(clk, rst, rst1, rst2, add1, add2, add3, add4, led_seg, a1, a2, a3, a4, val1, val2, val3, val4
    );

	input add1;
    input add2;
    input add3;
    input add4;
    input rst1;
    input rst2;
    input clk;
    input rst;

    output wire [6:0] led_seg;
    output wire a1;
    output wire a2;
    output wire a3;
    output wire a4;
	 output [3:0] val1;
	 output [3:0] val2;
	 output [3:0] val3;
	 output [3:0] val4;
	 
	reg[3:0] current_state;
	 wire[3:0] next_state;
	 wire[13:0] seconds;
	 wire flash_clk;
	 
	 wire [6:0] counter;

	counter c1(clk, rst, current_state, counter);
	
	 always@(posedge clk)
	 begin
		if(rst)
			current_state <= 4'b0000;
		else if(rst1)
			current_state <= 4'b0001;
		else if(rst2)
			current_state <= 4'b0010;
		else
			current_state <= next_state;
	 end
	 
	fsm_controller c2(clk,  add1, add2, add3, add4, current_state, next_state, seconds, counter);
	
	counter_flash_clock c4(clk, rst, current_state, flash_clk);
	
   //converts binary number seconds to 4 seperate digits
	convertBinary f1(seconds, val1, val2, val3, val4);
	
	
	display_sevenSegment c5(clk, rst, seconds, a1, a2, a3, a4, led_seg, flash_clk);

endmodule

module fsm_controller(clk, add1, add2, add3, add4, current_state, next_state, seconds, counter);
input clk;
input add1;
input add2;
input add3;
input add4;
input wire[6:0] counter;
input  wire [3:0] current_state;
output  reg [3:0] next_state;
output wire[13:0] seconds;


always@(*) begin
if (current_state ==  4'b0000) begin
		if(add1)
					next_state = 4'b0011;
				else if(add2)
					next_state = 4'b0100;
				else if(add3)
					next_state = 4'b0101;
				else if(add4)
					next_state = 4'b0110;
				else
					next_state = 4'b0000;
	end 
else if (current_state ==  4'b0001 ||  current_state ==  4'b0010) begin
				if(add1)
					next_state = 4'b0011;
				else if(add2)
					next_state = 4'b0100;
				else if(add3)
					next_state = 4'b0101;
				else if(add4)
					next_state = 4'b0110;
				else
					next_state = 4'b1000;
				end
else if (current_state ==  4'b0011 ||  current_state ==  4'b0100 ||
          current_state ==  4'b0101 ||  current_state ==  4'b0110 ) 
		begin
		next_state = 4'b1000;
		end
else if (current_state ==  4'b1000) 
	begin
				if(add1)
					next_state = 4'b0011;
				else if(add2)
					next_state = 4'b0100;
				else if(add3)
					next_state = 4'b0101;
				else if(add4)
					next_state = 4'b0110;
				else if(seconds < `INPUT_STATE3)
					next_state = 4'b0111;
				else
					next_state = 4'b1000;
				end
else if (current_state ==  4'b0111) 
	begin
				if(add1)
					next_state = 4'b0011;
				else if(add2)
					next_state = 4'b0100;
				else if(add3)
					next_state = 4'b0101;
				else if(add4)
					next_state = 4'b0110;
				else if(seconds == `MIN)
				begin
					next_state = 4'b1001;
				end
				else
					next_state = 4'b0111;
				end
else if (current_state ==  4'b1001) begin
		if(add1)
					next_state = 4'b0011;
				else if(add2)
					next_state = 4'b0100;
				else if(add3)
					next_state = 4'b0101;
				else if(add4)
					next_state = 4'b0110;
				else
					next_state = 4'b0000;
				end
else
	next_state = current_state;
end	
	time_calculator c3(clk, counter, current_state, seconds);
	
endmodule



module time_calculator(clk, counter, current_state, seconds);
input wire clk;
input wire[6:0] counter;
output reg[13:0] seconds;
input  wire [3:0] current_state;

always@(posedge clk) begin

if(current_state == 4'b0000|| current_state == 4'b1001)
		seconds <= 0;
else begin
	if(counter != `COUNTER_PULSE)
		begin
		case(current_state)
			4'b0001:seconds <= `INPUT_STATE1;
			4'b0010:seconds <= `INPUT_STATE2;
			4'b0011:seconds <= ((seconds + `INPUT_STATE6) > `MAX)?`MAX:(seconds + `INPUT_STATE6);
			4'b0100:seconds <= ((seconds + `INPUT_STATE4) > `MAX)?`MAX:(seconds + `INPUT_STATE4);
			4'b0101:seconds <= ((seconds + `INPUT_STATE3) > `MAX)?`MAX:(seconds + `INPUT_STATE3);
			4'b0110:seconds <= ((seconds + `INPUT_STATE5) > `MAX)?`MAX:(seconds + `INPUT_STATE5);
			4'b1000,
			4'b0111:seconds <= seconds;
		endcase
	end
		
	else 
		begin
	case(current_state)
		   4'b0001:seconds <= `INPUT_STATE1 -1;
			4'b0010:seconds <= `INPUT_STATE2 -1;	
			4'b0011:seconds <= ((seconds + `INPUT_STATE6-1) > `MAX)?`MAX:{seconds + `INPUT_STATE6-1};
			4'b0100:seconds <= ((seconds + `INPUT_STATE4-1) > `MAX)?`MAX:(seconds + `INPUT_STATE4-1);
			4'b0101:seconds <= ((seconds + `INPUT_STATE3-1) > `MAX)?`MAX:(seconds + `INPUT_STATE3-1);	
			4'b0110:seconds <= ((seconds + `INPUT_STATE5-1) > `MAX)?`MAX:(seconds + `INPUT_STATE5-1);
			4'b1000,
			4'b0111:seconds <= seconds - 1;
		endcase

		end
	
	
	end
	
		
	end

endmodule


module counter(clk, rst, current_state, counter);
input clk;
input rst;
input  wire [3:0] current_state;
output reg[6:0] counter;


 always @ (posedge clk) 
		begin
		 if(rst || counter == `COUNTER_PULSE)
			counter <= 7'b0000001;
		 else 
		 case(current_state)
				4'b0001,
				4'b0010: counter <= 7'b0000001;
				4'b0000: counter <= 7'b0000000;
				default: counter <= counter + 1'b1;	
			endcase
		 
		end
endmodule


module counter_flash_clock(clk, rst, current_state, flash_clk);
input clk;
input rst;
output reg flash_clk;
input  wire [3:0] current_state;
 reg[5:0] flashing_counter;
 
 
 always@(posedge clk)
	 begin
		if(rst)
			flashing_counter <= 0;
		else if (current_state == 4'b1001)
			flashing_counter <= 0;
		else if(flashing_counter == `FLASING_PULSE)
			flashing_counter <= 0;
		else
			flashing_counter <= flashing_counter + 1'b1;
	 end

 always@(posedge clk)
	 begin
		if(rst)
			flash_clk <= 1'b1;
		else if(flashing_counter == `FLASING_PULSE)
			flash_clk <= ~(flash_clk);
		else
			flash_clk <= flash_clk;
	 end
	 
endmodule



module display_sevenSegment (clk, rst, seconds, a1, a2, a3, a4, led_seg, flash_clk);
input clk;
input rst;
input flash_clk;
input wire [13:0] seconds;
output reg [6:0] led_seg;
output wire a1;
output wire a2;
output wire a3;
output wire a4;
reg [13:0] time_temp;
	wire [6:0] led_seg0;
	wire [6:0] led_seg1;
	wire [6:0] led_seg2;
	wire [6:0] led_seg3;
	wire [13:0] timer1;
	wire [13:0] timer2;
	wire [13:0] timer3;
	wire [13:0] timer4;
	wire val0;
	wire val1;
	wire val2;
	wire val3;
	
	assign timer1 = (seconds%10);
	ledSegment l0(timer1, led_seg0);
	
   assign  timer2 = (((seconds%100)-timer1) / 10);
	ledSegment l1(timer2, led_seg1);
	
	assign timer3 = (((seconds%1000)-(timer2*10)-timer1) / 100);
   ledSegment l2(timer3, led_seg2);
	
	assign timer4 = ((seconds-(timer3*100)- (timer2*10)-timer1)/ 1000);
	ledSegment l3(timer4, led_seg3);

	

	reg [3:0] tracker;
	always@(posedge clk)
	begin
		if(rst)
			tracker <= 4'b0001;
		else
			tracker <= (tracker << 1) | (tracker >> 3);
	end
	
	assign val0 = tracker[0];
	assign val1 = tracker[1];
	assign val2 = tracker[2];
	assign val3 = tracker[3];
	
	reg [3:0] anodes;
	always@(posedge clk)
		begin
			if(seconds != 0)
				begin
					if(seconds <180)
							begin
								if((seconds % 2) == 0)
										begin
											if(val3)
												begin					
												anodes <= 4'b1110;
												led_seg <= led_seg0;
													end
											else if(val2)
												begin					
												anodes <= 4'b1101;
												led_seg <= led_seg1;
												end
											else if(val1)
												begin					
												anodes <= 4'b1011;
												led_seg <= led_seg2;
												end
											else if(val0)
												begin					
												anodes <= 4'b0111;
												led_seg <= led_seg3;
												end
										end
				            else
					            begin				
						         anodes <= 4'b1111;
					            end
				          end
			     else
				       begin
							if(val3)
									begin	
									anodes <= 4'b1110;
									led_seg <= led_seg0;
									end
							else if(val2)
									begin				
									anodes <= 4'b1101;
									led_seg <= led_seg1;
									end
							else if(val1)
									begin				
									anodes <= 4'b1011;
									led_seg <= led_seg2;
									end
							else if(val0)
									begin				
									anodes <= 4'b0111;
									led_seg <= led_seg3;
									end
					     end
			    end
			else
				begin
				 if(flash_clk != 1)
						begin				
						anodes <= 4'b1111;
						end
				 else
						begin
							if(val3)
								begin					
								anodes <= 4'b1110;
								led_seg <= led_seg0;
								end
							else if(val2)
								begin					
								anodes <= 4'b1101;
								led_seg <= led_seg1;
								end
							else if(val1)
								begin					
								anodes <= 4'b1011;
								led_seg <= led_seg2;
								end
							else if(val0)
								begin					
								anodes <= 4'b0111;
								led_seg <= led_seg3;
								end
						 end
				 end 
			end
		
assign a1 = anodes[3];
assign a2 = anodes[2];
assign a3 = anodes[1];
assign a4 = anodes[0];
endmodule

module ledSegment(timer, led_seg);
input  [13:0] timer;
output reg[6:0] led_seg;
always@(*) begin
 case(timer)
	0: led_seg = 7'b0000001;
	1: led_seg = 7'b1001111;
	2: led_seg = 7'b0010010;
	3: led_seg = 7'b0000110;
	4: led_seg = 7'b1001100;
	5: led_seg = 7'b0100100;
	6: led_seg = 7'b0100000;
	7: led_seg = 7'b0001111;
	8: led_seg = 7'b0000000;
	9: led_seg = 7'b0000100;
	default: led_seg = 7'b0000001;
	endcase
	end
	
endmodule

module convertBinary(seconds, val1, val2, val3, val4);
input [13:0] seconds;
output [3:0] val1;
output [3:0] val2;
output [3:0] val3;
output [3:0] val4;

assign val4 = seconds % 10;
assign val3 = ((seconds%100)-val4) /10;
assign val2 = ((seconds%1000)- (val3*10)-val4) / 100;
assign val1 = (seconds - (val2*100)- (val3*10)- val4) / 1000;

endmodule


