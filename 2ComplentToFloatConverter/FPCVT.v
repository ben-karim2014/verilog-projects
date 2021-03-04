`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// School: UCLA 
// Student: Karim Benlghalia
// 
// Create Date:    18:41:24 10/23/2020 
// Design Name: 
// Module Name:    FPCVT 
// Project Name: CS M152A
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
module FPCVT(D, S, E, F);

input wire [12:0] D;
output wire S;
wire [12:0] out;

wire sixth_bit;

wire [2:0] temp_exponent;
wire [4:0] temp_significant;

output wire [2:0] E;
output wire [4:0] F;



get_sign_magnitude converter_block_1(
							.inBits(D), //input 
							.magnitude(out), //output
							.sign(S)); //ouput
							
							
Count_extract converter_bock_2(
										.In(out), //inputt is the ouput wire from get_sign_magnitude 
										.exponent(temp_exponent), 
										.significant(temp_significant), 
										.sixth_bit(sixth_bit)
);

rounding converter_block_3(
										.exponent_IN(temp_exponent), 
										.significant_IN(temp_significant), 
										.exponent_OUT(E), 
										.significant_OUT(F), 
										.sixth_bit(sixth_bit)

);

endmodule

//Get_sign_magnitude module//////////////////////////////
module get_sign_magnitude(inBits,magnitude, sign);

input [12:0] inBits;
output [12:0] magnitude;
reg [12:0] temp_magnitude;
output sign;

assign sign = inBits[12];

always @* begin
temp_magnitude = 13'b0000000000000;
if(sign == 0)
	temp_magnitude= inBits;
else if (sign == 1'b1)
	if (inBits == 13'b1000000000000) // handling the larger negative number. We take the sign bit and for the absolut value we cannot represent 4096 in 13bits, so I took the number closest to it.
		begin
		temp_magnitude = 13'b0111111111111;
		end
	else if (inBits != 13'b1000000000000)
		begin
		temp_magnitude = ~inBits + 1'b1;
		end
	//temp_magnitude = ~inBits + 1'b1;
end
assign magnitude = temp_magnitude;

endmodule

//Count and extract leading module ///////////////////////////
module Count_extract(In, exponent, significant, sixth_bit
    );
input wire [12:0] In;
output reg [2:0] exponent;
output reg [4:0] significant;
output reg sixth_bit;

always@(*) begin

	exponent = 3'b000;
	significant = In[4:0];
	sixth_bit = 1'b0;
	
if ((In[12:5] == 8'b00000000) || 
			 (In[12:4] == 9'b000000000) ||
			 (In[12:3] == 10'b0000000000) ||
			 (In[12:2] == 11'b00000000000) ||
			 (In[12:1] == 12'b000000000000) ||
			 (In[12:0] == 13'b0000000000000))
	begin
	exponent = 3'b000;
	significant = In[4:0];
	sixth_bit = 1'b0;
	end
else if (In[12:6] == 7'b0000000)
	begin
	exponent = 3'b001;
	significant = In[5:1];
	sixth_bit = In[0];
	end
else if (In[12:7] == 6'b000000)
	begin
	exponent = 3'b010;
	significant = In[6:2];
	sixth_bit = In[1];
	end
else if (In[12:8] == 5'b00000)
	begin
	exponent = 3'b011;
	significant = In[7:3];
	sixth_bit = In[2];
	end
else if (In[12:9] == 4'b0000)
	begin
	exponent = 3'b100;
	significant = In[8:4];
	sixth_bit = In[3];
	end
else if (In[12:10] == 3'b000)
	begin
	exponent = 3'b101;
	significant = In[9:5];
	sixth_bit = In[4];
	end
else if (In[12:11] == 2'b00)
	begin
	exponent = 3'b110;
	significant = In[10:6];
	sixth_bit = In[5];
	end
else if (In[12] == 1'b0)
	begin
	exponent = 3'b111;
	significant = In[11:7];
	sixth_bit = In[6];
	end
end
endmodule

//Rouding module//////////////////////////////////////////////////////////
module rounding(exponent_IN, significant_IN, 
						exponent_OUT, significant_OUT, sixth_bit
    );
input wire [2:0] exponent_IN;
input wire [4:0] significant_IN;
input wire sixth_bit;
reg [2:0] temp_exponent_OUT;
reg [4:0] temp_significant_OUT;
output wire [2:0] exponent_OUT;
output wire [4:0] significant_OUT;




always @(*) begin
temp_exponent_OUT = 3'b000;
temp_significant_OUT = 5'b00000;

if(sixth_bit == 1'b1)
	begin
	//significan not equal to 11111 no overflow
	if (significant_IN != 5'b11111)
		begin
		temp_significant_OUT = significant_IN +1;
		temp_exponent_OUT = exponent_IN;
		end
	//significan is equal to 11111  ==> overflow	
	else if(significant_IN == 5'b11111)
		begin
		if(exponent_IN != 3'b111)
			begin
			 //temp_segnigucant = significant_IN +1;
			 temp_significant_OUT = 5'b10000;
			 temp_exponent_OUT = exponent_IN+1;
			end
		else if(exponent_IN == 3'b111)
			begin
			temp_exponent_OUT = 3'b111;
			temp_significant_OUT =5'b11111;
			end
		end
	end
else if (sixth_bit == 1'b0)
	begin
	temp_exponent_OUT = exponent_IN;
	temp_significant_OUT = significant_IN;
	end
end
assign exponent_OUT = temp_exponent_OUT;
assign significant_OUT = temp_significant_OUT;
endmodule
