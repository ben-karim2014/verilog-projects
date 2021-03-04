1-Introduction:
The main idea behind of this project is for us to learn about how to design and implement a
finite state machine that models a specified behavior and to use the Xilinx ISE software to
design and test these state machines. Finite State Machines (FSMs) are a powerful tool that
can be used to model many real-world systems, and are particularly useful for the behavioral
modelling of sequential circuits. An FSM has a finite number of ‘states’ and can be in any one of
these states at a given time. The machine transitions from one state to another based on the
inputs it receives and the state that it is currently in. There are two kinds of FSM machines:
Moore Machine and Mealy Machine. Moore machine is a FSM in which its output only depends
on which state it is in, but a Mealy machine its output depends on both the current state and
input.
2-Requirement:
For this assignment, we're tasked with designing a vending machine with the following
characteristics:
1. Vending machine has 20 different snacks for sale. Each snack has two-digit code (00 to 19).
2. Each snack is stored in separate slot. There can be up to 10 units of snack stored in 1 slot.
3. A buyer can purchase only 1 item at a time.
4. The machine only accepts payment by card.
5. ![alt text](https://github.com/ben-karim2014/verilog-projects/vending_machine/blob/vending1.jpg?raw=true)
