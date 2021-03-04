All data is just a stream of bits as 1’s and 0’s. There are many different representations
of data including unsigned integers, one’s complement, two’s complement, and floatingpoint
representation. In this lab, the goal was to design and test a combinational circuit
that convert a two’s complement representation of a number to a simple floating-point
representation.
To build this combinational circuit, I used the Xilinx ISE software to design and simulate
the circuit that converted a 13-bit two’s complement signed integer to its counterpart in
9-bit floating point. The floating-point representation consists of a 1-bit sign
representation, a 3-bit exponent, and a 5-bit significand, shown below:

<img src="https://raw.githubusercontent.com/ben-karim2014/verilog-projects/main/SharedScreenshot.jpg" width="600">

There are three main modules to our converter in my design. 

The first block converts the 13-bit two’s-complement input to
sign-magnitude representation. Nonnegative numbers (sign bit 0) are unchanged, while
negative numbers are replaced by their absolute value. This module basically extracts
and check the sign bit, and output the corresponding magnitude. Checking if the sign bit
is 0 so the 13-bit would be outputted as magnitude without any change, and the module
would also extract the sign bit. If the sign bit is 1, the module will extract the sign bit,
and complement the 13bits (getting the absolute value).

The second block performs the basic linear to Floating Point conversion. The Exponent
output encodes the number of leading zeroes of the linear encoding, as shown in table
A in the lab manual. The module Count_extract would count the leading zeros of the
magnitude and output the corresponding exponent and significant and the sixth bit
(which will be used for rounding). The exponent would be straight forward
correspondence from the table in the manual. As for the significant would be the five
bits that follow the leading zeros and sixth bit would be the bit after the five bits of the
significant.

The third block, the rounding module, performs rounding of the Floating-Point
Representation. If the 6th bit following the last leading 0 of the intermediate Floating-
Point Representation is 1, the Significand is incremented by 1. If the Significand
overflows, then we shift the Significand right one bit and increase the Exponent by 1.
