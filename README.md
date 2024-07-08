# Tail-Lights-FPGA
FPGA Car Rear Lights
Objectives:
Design and implement a state machine that mimics the drive circuitry for the taillights of a Ford Mustang.
Implement the state machine using SystemVerilog.
Experiment Description:
Three input signals control the operation of the taillights. The input signals are LEFT, RIGHT, and HAZARD. Three output signals (LA, LB, and LC) drive the left taillights, and three other outputs (RA, RB, and RC)  drive the right taillights. All lights should be off (idle state) when none of the inputs is high. When HAZARD=1, all six lights should flash on and off in unison. When LEFT=1, the left side tail-lights should flash with the repeating pattern: LA on; LA and LB on; LA, LB, and LC all on; all lights off;  LA on again; etc. When RIGHT=1, the right taillights should flash in the same repeating pattern.

If a switch from LEFT to RIGHT (or vice-versa) occurs in the middle of a flashing sequence, the network should go to the idle state (all lights off) and then begin the new sequence. HAZARD takes precedence over LEFT and RIGHT if either of them is asserted at the same time as HAZARD.  Both LEFT and RIGHT should not be 1 at the same time, but it could happen so decide where the state machine should go in this situation.

Completed Fall 2021
