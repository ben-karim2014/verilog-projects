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
# Descriptions of states and transitions of parking meter FSM:

Initially, the machine would begin at the initial state (state 4'b0000) in which the output will be
flashing 0000 at 1HZ with 50% duty cycle. If the machine receives any coins, the corresponding
time is added accordingly.

If either rst1 or rst2 are set to 1, The machine will be set to the two other states (states 4'b0001
and 4'b0010) in which in one sate the remaining will be set to 16 seconds and the other would
be set to 150 seconds respectively. By counting the time down, the remaining time would be
flashed at 0.5HZ since the time not equal to zero and it is less than 180 seconds.

If one of the inputs add1, add2, add3, add4 is set to 1, The machine would move to the next
state in which the corresponding time is added to the parking meter and continue decrementing
the parking time by 1 (states 4'b0011, 4'b0100, 4'b0101, and 4'b0110). The display of the time
would also be displayed in the same manner we displayed it earlier.

If no coins are added. The machine would be in a state (state 4'b1000) in which the time is
decremented by one, and the machine would check if the remaining time is equal to zero or less
than 180 to display the remaining time with the correct frequency.

When the time is below 180, the machine would transition to a state (state 4'b0111) in which the
remaining time is decremented and flashed at 0.5HZ with 50% duty cycle. If any coin added, the
state would move to the next state modeling the state of the corresponding add, and the display
would be flashed accordingly. If the remaining time became 0 the machine would move to the
initial state and the display would be flashed accordingly.
