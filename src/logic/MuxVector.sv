//Name: Leonard Paya
//Date: 11/14/2025

// This is a Vectorized Mux that can work with Multiple Vectors for inputs, and output the
//		the selected vector.

// Parameters:
//		- BIT_WIDTH: Bit Width for each of the vectors, should be base 2.
//		- GATE_DELAY: Optional Gate delay to inlcude if want to see delay in waveforms.
//		- NUM_VECTORS: Number of Vectors to choose from, should be base 2.
// Inputs:
//		- in: A 2D bus input that can accept various vector arguements in the form of
//				{V3, V2, V1, V0}, Has NUM_VECTOR inputs, and BIT_WIDTH bit width for ea. vector.
//		- sel: A variable bit input based on NUM_VECTORS, used to select which vector that needs to
//				used.
// Output:
//		- out: Output that provides the selected Vector choosen from sel. Bit size of BIT_WIDTH.

module MuxVector #(
	parameter int BIT_WIDTH = 2,
    parameter int GATE_DELAY = 50,
	parameter int NUM_VECTORS = 2
) (
	input logic [NUM_VECTORS - 1 : 0][BIT_WIDTH - 1 : 0] in,
    input logic [$clog2(NUM_VECTORS) - 1 : 0] sel,
    output logic [BIT_WIDTH - 1 : 0]out
);
	logic [BIT_WIDTH - 1 : 0][NUM_VECTORS - 1 : 0] in_Transformed;
	
	genvar j, k;
	generate 
		for (j = 0; j < BIT_WIDTH; j++) begin : row
			for (k = 0; k < NUM_VECTORS; k++) begin : col
				assign in_Transformed[j][k] = in[k][j];
			end
		end
	endgenerate

	genvar i;
	generate
		for (i = 0; i < BIT_WIDTH; i++) begin : Muxes
			Mux #(.MUX_WIDTH(NUM_VECTORS), .GATE_DELAY(GATE_DELAY)) muxVec (
				.in(in_Transformed[i]), .out(out[i]), .sel(sel)
			);
		end
		
	endgenerate
	
endmodule