module fsm ( CLOCK, RESET, LEFT, RIGHT, HAZ, LIGHTS); 
	input CLOCK, RESET, LEFT, RIGHT, HAZ; 
	output [1:6] LIGHTS; 
	reg [1:6] LIGHTS; 
	parameter IDLE = 6'b000000, // Output-coded state assignment 
	L3 = 6'b111000, // and tail-light patterns 
	L2 = 6'b011000, 
	L1 = 6'b001000, 
	R1 = 6'b000100, 
	R2 = 6'b000110, 
	R3 = 6'b000111, 
	LR3 = 6'b111111; 
	always @ (posedge CLOCK) // State memory (with sync. reset) 
		if (RESET) LIGHTS <= IDLE; 
		else 
			case (LIGHTS) // and next-state logic. 
				IDLE : 
					if (HAZ || (LEFT && RIGHT)) LIGHTS <= LR3; 
					else if (LEFT) LIGHTS <= L1; 
					else if (RIGHT) LIGHTS <= R1; 
					else LIGHTS <= IDLE; 
					
				L1 : 
					if (HAZ) LIGHTS <= LR3;
					else if (RIGHT) LIGHTS <= IDLE;
					else LIGHTS <= L2; 
					
				L2 : 
					if (HAZ) LIGHTS <= LR3; 
					else if (RIGHT) LIGHTS <= IDLE;
					else LIGHTS <= L3; 
						
				L3 : LIGHTS <= IDLE; 
				
				R1 : 
					if (HAZ) LIGHTS <= LR3;
					else if (LEFT) LIGHTS <= IDLE; 
					else LIGHTS <= R2;
				
				R2 : 
					if (HAZ) LIGHTS <= LR3; 
					else if (LEFT) LIGHTS <= IDLE;
					else LIGHTS <= R3;
				
				R3 : LIGHTS <= IDLE; 
				
				LR3 : LIGHTS <= IDLE;
				
				default : LIGHTS <= IDLE; 
			endcase 
endmodule
