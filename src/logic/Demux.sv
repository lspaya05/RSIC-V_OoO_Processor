// Name: Leonard Paya
// Date: 11/20/2025

// This is a variable size demux that forwards some input to a collectio

// Parameters:
//      - BIT_WIDTH: Bit Width for each of the vectors, should be base 2.
//      - NUM_VECTORS: Number of Vectors to choose from, should be base 2.
// Inputs:
//      - in: Input with "BIT_WIDTH" number of bits. This represents the input that will be routed
//              to the selected output.
//      - sel: A variable bit input based on NUM_VECTORS, used to select which vector that needs to
//				used.
// Ouputs:
//      - out: 'NUM_VECTOR' output signals each with 'BIT_WIDTH' number of bits. This is the 
//              output that may contain relevant input data or not. 

module Demux #(
    parameter BIT_WIDTH = 8,
    parameter NUM_VECTORS = 2
) (
    input logic [BIT_WIDTH - 1 : 0] in,
    input logic [$clog2(NUM_VECTORS) - 1 : 0] sel, 
    output logic [BIT_WIDTH - 1 : 0] out [NUM_VECTORS - 1 : 0]
);

    int i;
    always_comb begin
        for (i = 0; i < NUM_VECTORS; i++) begin
            out[i] = '0;
        end 

        out[i] = in;
    end

endmodule