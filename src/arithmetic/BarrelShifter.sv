// Name: Leonard Paya
// Date: 11/10/2025

//This implements a Barrel shifter that shifts the bits of the input either to the right or left
//      by a specified value. This value can be sign extended when shifting to the right.
//      Max value to shift by determined by 1 less than the Inputs number of bits.

// Parameters:
//      - GATE_DELAY: Possible Gate delay to add, if wanted.
//      - BIT_WIDTH: Number of Bits for the input vectors.
// Inputs: 
//      - in: Operand of BIT_WIDTH bit size to perform operation on.
//      - shiftAmt: Unsigned value of bits to shift by. Bus size is Log base 2 of BIT_WIDTH.
//      - signExtend: When true will sign extend the right shift, if not zero extends.
//      - shiftLeft: When true shifts input to the left, when false shifts input to the right.
// Outputs: 
//      - out: Shifted result of bit size BIT_WIDTH.
module BarrelShifter #(
    parameter int GATE_DELAY = 50, 
    parameter int BIT_WIDTH = 32
) (
    input logic [BIT_WIDTH - 1 : 0] in,
    input logic [$clog2(BIT_WIDTH) - 1 : 0] shiftAmt,
    input logic signExtend, shiftLeft,
    output logic [BIT_WIDTH - 1 : 0] out
);

    logic signExtender; //Provides value for Right Arithmetic Shift.

    //Used in the Generate Blocks to create the inputs for the Muxes:
    logic [2 * (BIT_WIDTH - 1): 0] rightShiftPossibleValues;
    logic [2 * (BIT_WIDTH - 1): 0] leftShiftPossibleValues;
    logic [BIT_WIDTH - 1 : 0] rightShiftOut;
    logic [BIT_WIDTH - 1 : 0] leftShiftOut;
    

    Mux #(.MUX_WIDTH(2), .GATE_DELAY(GATE_DELAY)) chooseSignExtender (
        .in({in[BIT_WIDTH - 1], 1'b0}), .out(signExtender), .sel(signExtend)
    );

    genvar j;
    //Generates the range of which the the barrel muxes can take.
    generate
        for (j = 0; j < 2 * BIT_WIDTH - 1; j++) begin : rightShift_PossibleValues
            if (j > BIT_WIDTH - 1)
                assign rightShiftPossibleValues[j] = signExtender;
            else 
                assign rightShiftPossibleValues[j] = in[j];
        end

        for (j = 0; j < 2 * BIT_WIDTH - 1; j++) begin : leftShift_PossibleValues
            if (j > BIT_WIDTH - 1)
                assign leftShiftPossibleValues[j] = 1'b0;
            else 
                assign leftShiftPossibleValues[j] = in[-j + BIT_WIDTH - 1];
        end
    endgenerate

    genvar i;
    //Generates the Barrel Shift Muxes:
    generate

        for (i = 0; i < BIT_WIDTH; i++) begin : shiftRightMuxes
            Mux #(.MUX_WIDTH(BIT_WIDTH), .GATE_DELAY(GATE_DELAY)) BarrelMuxRight (
                .in(rightShiftPossibleValues[(i + BIT_WIDTH - 1) : i]), .out(rightShiftOut[i]),
                                     .sel(shiftAmt[($clog2(BIT_WIDTH) - 1) : 0])
            );
        end 

        for (i = 0; i < BIT_WIDTH; i++) begin : shiftLeftMuxes
            Mux #(.MUX_WIDTH(BIT_WIDTH), .GATE_DELAY(GATE_DELAY)) BarrelMuxLeft (
                .in(leftShiftPossibleValues[(-i + 2 * BIT_WIDTH - 2) : -i + BIT_WIDTH - 1]),
                .out(leftShiftOut[i]), .sel(shiftAmt[($clog2(BIT_WIDTH) - 1) : 0])
            );
        end 
    endgenerate
    
    MuxVector #(.BIT_WIDTH(BIT_WIDTH), .NUM_VECTORS(2), .GATE_DELAY(GATE_DELAY)) finalOut (
        .in({leftShiftOut, rightShiftOut}), .sel(shiftLeft), .out(out)
    );

endmodule 