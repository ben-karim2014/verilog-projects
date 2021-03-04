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