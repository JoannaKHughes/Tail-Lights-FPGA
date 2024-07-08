module top( clock, reset, left, right, haz, blinkers); 
	input clock, reset, left, right, haz;
	output [1:6] blinkers; 
	logic clk;

	clockdiv clkLabel(.iclk(clock), .oclk(clk));
	fsm lightLabel(.CLOCK(clk), .RESET(reset), .LEFT(left), .RIGHT(right), .HAZ(haz), .LIGHTS(blinkers));
	

endmodule
