// Name: Leonard Paya
// Date: 09/05/2025

// Usecase: High performance processors, get complicated fast, but does have a latency of O(LogN).
//      Not often used past 32 bits.

// Takes in 2 variable length inputs representing some number in binary, and adds them together and
//      represents the result with sum and cOut.

// Parameters:
//      - GATEDELAY: Delay of every gate implemented.
//      - BITWIDTH: Bit width of in1, in2, and sum.
//      - HIERARCHICAL: If true means that using a 4-bit Hierarchical CLA method.
//      - KOGGESTONE: If true means that using KoggeStone method to add values.
//TO BE IMPLEMENTED:
//      - BRENTKUNG:
//      - HANCARLSON:
//      - SKLANSKY: 
// Input:
//		- in1: input representing the first term to be added together.
//		- in2: input representing the second term to be added together.
// Output:
//		- sum: A 64-bit output that is dependent on the in1 and in2, this is the sum.
//		- cOut: Carry out of the most significant bit in sum.

module CarryLookAheadAdder #(
    parameter int GATEDELAY = 50,
    parameter int BITWIDTH = 64,
    parameter bit HIERARCHICAL = 1'b0,
    parameter bit KOGGESTONE = 1'b0,
    parameter bit BRENTKUNG = 1'b0,
    parameter bit HANCARLSON = 1'b0,
    parameter bit SKLANSKY = 1'b0
) (
	input logic [(BITWIDTH - 1):0] in1,
	input logic [(BITWIDTH - 1):0] in2,
    input logic cIn,
	output logic [(BITWIDTH - 1):0] sum,
	output logic cOut
);
    logic [63:0] carryIns;
    logic [63:0] carryOuts;
    logic [63:0] dontCare;

    assign carryIns[0] = cIn;
    
    //Creates the Adders:
	FullAdder add #(.GATEDELAY(GATEDELAY)) (.in1(in1[0]), .in2(in2[0]), .cIn(carryIns[0]), .sum(sum[0]), .cOut(carryOuts[0]));

    genvar i;
    generate
        for (i = 1; i< BITWIDTH; i++) begin : Adder1Bit
			FullAdder add(.in1(in1[i]), .in2(in2[i]), .cIn(carryIns[i - 1]), .sum(sum[i]), .cOut(dontCare[i]));
        end
    endgenerate

    // Handles the logic for the Carry Outs of the adders:
    generate
        //Make sure only one option of carry-in logic is true.
        if (HIERARCHICAL) begin
            //TODO

        end else if (KOGGESTONE) begin
            //TODO

        end else if (BRENTKUNG) begin
            //TODO

        end else if (HANCARLSON) begin
            //TODO

        end else begin // SKLANSKY
            //TODO
        end
    endgenerate

endmodule