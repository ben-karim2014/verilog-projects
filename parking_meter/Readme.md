# Introduction

The aim of this lab is to learn how to design finite state machine that performs a specified
behavior and to use the Xilinx ISE software to build and test a finite state machine. Finite State
Machines (FSMs) are a powerful tool that can be used to model many real- world systems and
are particularly useful for the behavioral modeling of sequential circuits. An FSM has a finite
number of ‘states’ and can be in any one of these states at a given time. There are two kinds of
FSM machines: Moore Machine and Mealy Machine. Moore machine is a FSM in which its
output only depends on which state it is in, but a Mealy machine its output depends on both the
current state and input.
# Requirement:

For this lab, we are required to design an FSM to model a parking meter which simulates coins
being added and displays the appropriate time remaining. The time remaining will be displayed
on a four-digit common anode seven-segment LED display on a Nexys3 board. Each of the four
digits is composed of seven segments arranged in a pattern.

vending Machine is designed to have the following inputs and outputs:
<img src="https://raw.githubusercontent.com/ben-karim2014/verilog-projects/main/basicio-img2.png" width="600">

Our FSM Machine should have the following specification:
- The input buttons represent different coin denominations and the seven-segment LED
display will display the time remaining before the meter expires in seconds:

inputs:
* add1: add 60 seconds
* add2: add 120 seconds
* add3: add 180 seconds
* add4: add 300seconds
* rsrt1 : reset time to 16 seconds
* rst2 : reset time to 150 seconds
* clk : frequency 100HZ
* rst : reset to initial state
Outputs: 
* led_seg(7-bit vector): displays the actual value fed to the 4 segments
corresponding to the digits being displayed.
* a1,a2,a3,a4 : represents the anodes of the seven-segment display. (1 bit
each)
* (val1, val2, val3, val4): display the actual digit in BCD (binary coded
decimal) corresponding to each of the segments.
