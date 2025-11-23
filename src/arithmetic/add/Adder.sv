// Name: Leonard Paya
// Date: 09/09/2025

// This is the main module to implement any type of adder, only use this module and pick an
//  implementation style when creating any microcontroller. Adds two values with the same bit
//  width and the cIn bit providing the sum as well as a carry out if the sum goes beyond what
//  can be represented with the selected bit width.

// Parameters:
//      - GATE_DELAY: Delay of every gate implemented.
//      - BIT_WIDTH: Bit width of in1, in2, and sum.
//      - METHOD: A String that contains one of the following optiions:
//          - RTL: Using the built in RTL to decide which adder to use.
//          - RIPPLECARRY:: Using a Ripple Carry Adder
//          - HIERARCHICAL: Using a 4-bit Hierarchical CLA method.
//          - KOGGESTONE: Using KoggeStone method to add values.
//          - BRENTKUNG:
//          - HANCARLSON:
//          - SKLANSKY: 
// Input:
//		- in1: input representing the first term to be added together.
//		- in2: input representing the second term to be added together.
// Output:
//		- sum: A 64-bit output that is dependent on the in1 and in2, this is the sum.
//		- cOut: Carry out of the most significant bit in sum.

module Adder #(
    parameter int GATE_DELAY = 50;
    parameter int BIT_WIDTH = 64;
    parameter string METHOD = "RTL"
) (
    input logic [(BIT_WIDTH - 1) : 0] in1,
	input logic [(BIT_WIDTH - 1) : 0] in2,
    input logic cIn,
	output logic [(BIT_WIDTH - 1) : 0] sum,
	output logic cOut
);

    generate
        initial $info("Adder Architecture: %s with %dps of Gate Delay and a Bit Width of %d",
                         METHOD, GATE_DELAY, BIT_WIDTH);
                         
        if (METHOD == "RTL") begin 
            initial $info("The gate delay displayed above is incorrect. RTL has no gate delay");
            logic [BIT_WIDTH : 0] addOut;

            assign addOut = in1 + in2 + cIn;

            // Output Logics:
            sum = addOut[(BIT_WIDTH - 1) : 0];
            cOut = addOut[BIT_WIDTH];

        end else if (METHOD == "RIPPLECARRY") begin
            RippleCarryAdder #(.GATE_DELAY(GATE_DELAY), .BIT_WIDTH(BIT_WIDTH)) rcAdder (.*);

        // end else if (METHOD == "HIERARCHICAL") begin
        //     CarryLookAheadAdder #(.GATE_DELAY(GATE_DELAY), .BIT_WIDTH(BIT_WIDTH), .HIERARCHICAL(1'b1)) 
        //         hAdder (.*);

        // end else if (METHOD == "KOGGESTONE") begin
        //     CarryLookAheadAdder #(.GATE_DELAY(GATE_DELAY), .BIT_WIDTH(BIT_WIDTH), .KOGGESTONE(1'b1))
        //          ksAdder (.*);

        // end else if (METHOD == "BRENTKUNG") begin
        //     CarryLookAheadAdder #(.GATE_DELAY(GATE_DELAY), .BIT_WIDTH(BIT_WIDTH), .BRENTKUNG(1'b1)) 
        //         bkAdder (.*);

        // end else if (METHOD == "HANCARLSON") begin
        //     CarryLookAheadAdder #(.GATE_DELAY(GATE_DELAY), .BIT_WIDTH(BIT_WIDTH), .HANCARLSON(1'b1)) 
        //         hcAdder (.*);

        // end else if (METHOD == "SKLANSKY") begin
        //     CarryLookAheadAdder #(.GATE_DELAY(GATE_DELAY), .BIT_WIDTH(BIT_WIDTH), .SKLANSKY(1'b1)) 
        //         sAdder (.*);

        end else begin
            $error("Adder Implementation not valid.");
        end
    endgenerate
endmodule