module FrameTimer#(
	parameter integer CLK_FREQ = 50_000_000,
	parameter integer FRAME_RATE = 60,
)(
	input  logic clk,
	input  logic reset,
	output logic Hz60_signal
);

	localparam integer COUNT_MAX = (CLK_FREQ / FRAME_RATE) - 1;
	
	logic [19:0] counter;
	
	always_ff @(posedge) begin
		if (reset) begin
			counter = 0;
			Hz60_signal = 1'b0;
		end
		else if (counter == COUNT_MAX) begin
			counter = 0;
			Hz60_signal = 1'b1;
		end
		else begin
			counter = counter + 1;
			Hz60_signal;
		end
	end
endmodule