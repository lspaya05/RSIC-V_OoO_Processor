// Name: Leonard Paya
// Date: 09/05/2025

// Implements a full Adder that sums the inputs to give a sum in binary in the form {cOut, sum}.

// Input:
//		- in1: 1-bit input, if 1 then value it rep is 1 in dec. 
//		- in2: 1-bit input, if 1 then value it rep is 1 in dec.
//		- cIn: 1-bit input, if 1 then value it rep is 1 in dec.
// Output:
//		- sum: 1-bit, least significant fig in the binary representation of the sum.
//		- cOut: 1-bit, most significant fig in the binary representation of the sum.

module FullAdder  #(
    parameter int GATEDELAY = 50
) (
    input logic in1, in2, cIn,
	output logic sum, cOut
);
	
	// The logic for the adder:
	// Logic for the and's in the Cout's equation.
	logic andcin1, andcin2, andcin3;
	
	xor #GATEDELAY outputGate(sum, in1, in2, cIn);
	
	and #GATEDELAY term1Cin (andcin1, in1, in2);
	and #GATEDELAY term2Cin (andcin2, in2, cIn);
	and #GATEDELAY term3Cin (andcin3, in1, cIn);
	
	or #GATEDELAY carryOut (cOut, andcin1, andcin2, andcin3);

endmodule

