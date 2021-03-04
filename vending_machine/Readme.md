# 1-Introduction:

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
# 2-Requirement:

For this assignment, we're tasked with designing a vending machine with the following
characteristics:
1. Vending machine has 20 different snacks for sale. Each snack has two-digit code (00 to 19).
2. Each snack is stored in separate slot. There can be up to 10 units of snack stored in 1 slot.
3. A buyer can purchase only 1 item at a time.
4. The machine only accepts payment by card.
<img src="https://raw.githubusercontent.com/ben-karim2014/verilog-projects/main/vending1.jpg" width="400">

# 3-Design Description:

For this assignment, I designed my FSM following to the guidance of the lab description. The
vending Machine is designed to have the following inputs and outputs:
<img src="https://raw.githubusercontent.com/ben-karim2014/verilog-projects/main/vending2.jpg" width="400">
# 4-State Diagram: 
(I used 11 states to manage all the vending machine operations)

<img src="https://raw.githubusercontent.com/ben-karim2014/verilog-projects/main/states.jpg" width="400">

# 5-Descriptions of states and transitions:

In the RESET state all item counters and outputs are set to 0. The FSM transition to this state
whenever RST input is set to 1. When RST is set to 0 the FSM transition to IDLE state in which
the machine will be waiting for a transaction to start.

When RELOAD input is set to 1 the FSM transition to the reload state where all snack items are
set 10 modeling the reload of items’ stocks. When RELOAD is set to 0, the machine will
transition to IDLE state to wait for a transition to start.

In IDLE state, if the CARD_IN input is set to 1, the FSM will transition to Transaction Start state in
which the machine would wait the first digit to be entered. If the first digit is not entered in 5
clocks cycles the machine will return to IDLE state.

If the first digit is entered, the machine would transition to the Select first Digit state in which it
would wait for the second digit to be entered. If the second digit is not entered, the machine
would transition to IDLE state.

If the second digit is entered, the machine would transition to Select Second Digit state in which
the machine would check if the two digits are valid and the stock of the chosen item is greater
than 0.
If the two digits are invalid (are not between 00 and 19) or the stock of the chosen item is equal
to 0, then the machine would transition to Invalid Selection sate in which the INVALID_SEL
output will be set to 1, and then the machine would transition to IDLE to wait for a new state.

If the two digits are valid and there is enough in stock of the chosen item, the FSM would
transition to Valid Selection state in which the COST output will be set with corresponding cost
of the chosen item’s code. In the state, the machine will wait for VALID_TRAN signal.

If VALID_TRAN is not set to 1 in 5 cycles, the machine would transition to Invalid Transaction
state in which the machine would set FAILED-TRAN output to 1, and then it would transition to
IDLE to wait for a new transaction.

If the VALID_TRAN is set to 1 in less than 5 cycles, the machine would transition to Vend state
in which the VEND output set to 1 and the stock of the corresponding item would decrement by 1.

In this state, the machine also wait for DOOR_OPEN to be set to 1 and then to be set to 0 to
transition to IDLE state to wait for anew transaction. If the DOOR_OPEN is not set to 1 in 5 clock
cycles the machine would transition to IDLE state.


The Project report contains full description of the testbench simulation.
