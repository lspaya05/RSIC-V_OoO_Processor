// Name: Leonard Paya
// Date: 09/05/2025

// Usecase: For low power embedded systems, b/c has very small area / power use. Has Latency of O(N).

// Takes in 2 variable length inputs representing some number in binary, and adds them together and
//      represents the result with sum and cOut.

// Parameters:
//      - GATEDELAY: Delay of every gate implemented.
//      - BITWIDTH: Bit width of in1, in2, and sum.
// Input:
//		- in1: input representing the first term to be added together.
//		- in2: input representing the second term to be added together.
// Output:
//		- sum: A 64-bit output that is dependent on the in1 and in2, this is the sum.
//		- cOut: Carry out of the most significant bit in sum.

module RippleCarryAdder #(
    parameter int GATEDELAY = 50,
    parameter int BITWIDTH = 64
) (
	input logic [(BITWIDTH - 1) : 0] in1,
	input logic [(BITWIDTH - 1) : 0] in2,
    input logic cIn,
	output logic [(BITWIDTH - 1) : 0] sum,
	output logic cOut
);

	logic [63:0] carryOuts;
	
	FullAdder add #(.GATEDELAY) (.in1(in1[0]), .in2(in2[0]), .cIn, .sum(sum[0]), .cOut(carryOuts[0]));
	
	// Creates adder for bit range 63-1:
	genvar i;
	generate
	
		for (i = 1; i < BITWIDTH; i++) begin : Adder1Bit
		
			FullAdder add(.in1(in1[i]), .in2(in2[i]), .cIn(carryOuts[i - 1]), .sum(sum[i]), .cOut(carryOuts[i]));
			
		end
		
	endgenerate
	
	assign cOut = carryOuts[63];
	
endmodule 
