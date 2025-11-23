// Name: Leonard Paya
// Date: 09/17/2025

// This is left shift register that keeps shifts some number of bits, by one location
//      when enShift is true.

// Parameters: 
//      - BITWIDTH: Number of bits that each register in a location on the line stores.
//      - SHIFTLEN: The number of Shift locations wanted. Default is 10 bits long.
// Inputs:
//      - in: a variable length input that feeds into the rightmost register of the same length.
//      - enShift: 1-bit input that when true signals that a shift must occur.
//      - clk: Clock Signal
//      - reset: 1 bit reset signal.
// Outputs:
//      - out: A collection of signals that when called as out[x], will provide the value stored in
//              that column of registers.

module ShiftLeftReg #(
    parameter int BITWIDTH = 1,
    parameter int SHIFTERLEN = 10
) (
    input logic [BITWIDTH - 1 : 0] in,
    input logic clk, reset, enShift,
    output logic [BITWIDTH - 1 : 0] out [SHIFTERLEN - 1 : 0]
);

    genvar i;
    generate
        for (i = 0; i < SHIFTERLEN; i++) begin : RegXBit
            RegEnXBit #(.BITWIDTH(BITWIDTH)) regi (.in(out[i - 1]), .out(out[i]), .reset, .clk, .en(enShift));
        end 
    endgenerate


endmodule 