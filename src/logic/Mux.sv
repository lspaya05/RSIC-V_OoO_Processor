// Name: Leonard Paya
// Date: 10/06/2025

// This is a Variable size Mux that can take any amount of input where log base 2 is equal to an
//  integer. The selector must be equal to log base 2 of the input bits. There is no error checking
//  in this module.

// Parameters:
//      - MUX_WIDTH: Variable bit length for possible choices to choose from in the Mux. Must be log
//              base 2.
//      - GATE_DELAY: Variable Integer value to control the Gate Delay of all logic gates instatiated.
// Input:
//      - in: Variable bit length, these are the possible choices that can be choosen from.
//      - sel: Variable bit length, selects the input to output. Must be log base 2 of the MUX_WIDTH.
// Output:
//      - out: A one bit output that contains the value that we selected.

module Mux #(
    parameter int MUX_WIDTH = 2,
    parameter int GATE_DELAY = 50
) (
    input logic [MUX_WIDTH - 1 : 0] in,
    input logic [$clog2(MUX_WIDTH) - 1 : 0] sel,
    output logic out
);

    genvar i;
    generate 
        if (MUX_WIDTH == 2) begin : baseCase
            logic notSel, A, B;
	
            not #GATE_DELAY notSelGate (notSel, sel);
        
            and #GATE_DELAY AndforOldValue (A, notSel, in[0]);
            and #GATE_DELAY AndforNewValue (B, sel, in[1]);
        
            or #GATE_DELAY MuxOut (out, A, B);

        end else begin : recursiveCase
            
            logic inConnect1, inConnect0;

            Mux #(.MUX_WIDTH(MUX_WIDTH / 2), .GATE_DELAY(GATE_DELAY)) lowerMux (
                .in(in[(MUX_WIDTH / 2) - 1 : 0]), .sel(sel[$clog2(MUX_WIDTH) - 2 : 0]), .out(inConnect0)
            );

            Mux #(.MUX_WIDTH(MUX_WIDTH / 2), .GATE_DELAY(GATE_DELAY)) higherMux (
                .in(in[MUX_WIDTH - 1: MUX_WIDTH / 2]), .sel(sel[$clog2(MUX_WIDTH) - 2 : 0]), .out(inConnect1)
            );

            Mux #(.MUX_WIDTH(2), .GATE_DELAY(GATE_DELAY)) frontMux (
                .in({inConnect1, inConnect0}), .sel(sel[($clog2(MUX_WIDTH) - 1)]), .out(out)
            );
        end

    endgenerate

endmodule