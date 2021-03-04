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
<img src="https://raw.githubusercontent.com/ben-karim2014/verilog-projects/main/basicio-img2.jpg" width="600">
