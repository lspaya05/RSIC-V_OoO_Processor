// Name: Leonard Paya
// Date: 09/10/2025

// This module implements a D flip-flop that is to be used in every module it is needed in.
//  A D flip-flop outputs a settled input at the positive edge of a clock.

// Input:
//		- in: 1-bit input signal.
//		- reset: Reset signal, sets the output value to 0 at the next positive edge.
//      - clk: System Clock Signal.
// Output:
//		- out: output that changes at the positive edge of the clock.

module Dff (
    input logic in, 
    input logic reset,
    input logic clk,
    output logic out
);

    always_ff @(posedge clk) begin
        if (reset) 
            out <=0;
        else    
            out <= in; 
    end 
endmodule