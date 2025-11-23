// Name: Leonard Paya
// Date: 09/10/2025

// This module implements a Enabled D flip-flop that is to be used in every module it is needed in.
//  A Enabled D flip-flop outputs a settled input at the positive edge of a clock, when en is true.

// Input:
//		- in: 1-bit input signal.
//		- reset: Reset signal, sets the output value to 0 at the next positive edge.
//      - clk: System Clock Signal.
//      - en: Enable signal that allows value to change at the positive edge.
// Output:
//		- out: output that changes at the positive edge of the clock, if en is true.

module Dff_En (
    input logic in, 
    input logic reset,
    input logic clk,
    input logic en,
    output logic out
);

    logic dffIn;
    assign dffIn = en ? in : out;

    Dff oneBitFF (.in(dffIn), .reset, .en, .out, .clk);


endmodule