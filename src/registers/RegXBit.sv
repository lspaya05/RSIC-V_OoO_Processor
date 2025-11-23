// Name: Leonard Paya
// Date: 09/10/2025

// This module implements an Enabled Register, with some choosen bit length

// Parameter:
//      - BITLENGTH: the bus length for the input of the register, default width is 64.
// Input:
//		- in: variable bit input signal.
//		- reset: Reset signal, sets the output value to 0 at the next positive edge.
//      - clk: System Clock Signal.
// Output:
//		- out: variable bit output signal that changes at the positive edge of the clock, if en 
//          is true.

module RegXBit #(
    parameter int BITLENGTH = 64

) (
    input logic [(BITLENGTH - 1) : 0] in, 
    input logic reset, clk,
    output logic [(BITLENGTH - 1) : 0] out
);
    genvar i;
    generate 
        for (i = 0; i < BITLENGTH; i++) begin : Reg
            Dff oneBitReg (.in(in[i]), .out(out[i]), .reset, .clk);            
        end 
    endgenerate 


endmodule