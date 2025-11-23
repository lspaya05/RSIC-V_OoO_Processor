// Name: Leonard Paya
// Date: 09/06/2025

// Implements a half Adder that sums the inputs to give a sum in binary in the form of {cOut, sum}.

// Input:
//		- in1: 1-bit input, if 1 then value it rep is 1 in dec. 
//		- in2: 1-bit input, if 1 then value it rep is 1 in dec.
// Output:
//		- sum: 1-bit, least significant fig in the binary representation of the sum.
//		- cOut: 1-bit, most significant fig in the binary representation of the sum.

module HalfAdder  #(
    parameter int GATEDELAY = 50
) (
    input logic in1, in2,
	output logic sum, cOut
);
	
	xor #GATEDELAY outputGate(sum, in1, in2);	
	and #GATEDELAY term1Cin (cOut, in1, in2);

endmodule

