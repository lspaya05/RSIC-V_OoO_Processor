// Name: Leonard Paya
// Date: 11/07/2025

// This is a variable size Encoder that supports input widths up to the internal parameter
//      stored as 'MAX_IN_SUPPORTED'. Takes in a log base 2 amount of inputs and returns
//      the unsigned binary value of the input. Output is only valid when only 1 output is on.

// Parameter: 
//      - BIT_WIDTH: Number of input terminals, or max binary number the user wishes to output.
//      - MAX_IN_SUPPORTED: Internal Parameter, represents the max number that is represented by
//          the module.
// Inputs:
//      - in: BIT_WIDTH amount of bits, for valid output only 1 input can be true at a time.
// Outputs:
//      - out: Log base 2 of BIT_WIDTH number of bits, this is the binary representation of the 
//          the one-hot input.
module Encoder #(
    parameter int BIT_WIDTH = 2
) (
    input logic [BIT_WIDTH - 1 : 0] in, 
    output logic [$clog2(BIT_WIDTH) - 1 : 0] out
);
    parameter int MAX_IN_SUPPORTED = 8;

    generate
        if (BIT_WIDTH == 2) begin
            always_comb begin
                out = in[1];
            end
        end else if (BIT_WIDTH == 4) begin
            always_comb begin
                out[1] = in[2] | in[3];
                out[0] = in[1] | in[3]; 
            end 
        end else if (BIT_WIDTH == 8) begin
            always_comb begin
            out[2] = in[4] | in[5] | in[6] | in[7];
            out[1] = in[2] | in[3] | in[6] | in[7];
            out[0] = in[1] | in[3] | in[5] | in[7];
            end 
        end else begin
            initial $error("BIT_WIDTH - Only Supported for Widths below (%0d) ", MAX_IN_SUPPORTED);
        end 
    endgenerate
endmodule 