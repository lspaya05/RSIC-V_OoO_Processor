// Name: Leonard Paya
// Date: 11/10/2025

//This implements testbench for the Barrel shifter that shifts the bits of the input either
//      to the right or left by a specified value. This value can be sign extended when shifting
//      to the right. Max value to shift by determined by 1 less than the Inputs number of bits.

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
module BarrelShifter_tb();
    parameter int GATE_DELAY = 50;
    parameter int BIT_WIDTH = 64;

    logic [BIT_WIDTH - 1 : 0] in, out;
    logic [$clog2(BIT_WIDTH) - 1 : 0] shiftAmt;
    logic signExtend, shiftLeft;

    BarrelShifter #(.GATE_DELAY(GATE_DELAY), .BIT_WIDTH(BIT_WIDTH)) dut (.*);

    initial begin
        integer i;
        //Shift Right:
        in = 64'd128;
        signExtend = 1'b0; shiftLeft = 1'b0;

        for (i = 0; i < BIT_WIDTH; i++) begin
            shiftAmt = i;
            #(100 * GATE_DELAY + 10);
        end

        in = 64'hFFFFFFFFFFFFFFFF;
        signExtend = 1'b1; shiftLeft = 1'b0;

        for (i = 0; i < BIT_WIDTH; i++) begin
            shiftAmt = i; 
            #(100 * GATE_DELAY + 10);
        end 

        in = 64'd512; 
        signExtend = 1'b1; shiftLeft = 1'b0;

        for (i = 0; i < BIT_WIDTH; i++) begin
            shiftAmt = i; 
            #(100 * GATE_DELAY + 10);
        end 

        //Shift Left:
        in = 64'd128;
        signExtend = 1'b0; shiftLeft = 1'b1;

        for (i = 0; i < BIT_WIDTH; i++) begin
            shiftAmt = i;
            #(100 * GATE_DELAY + 10);
        end

        in = 64'hFFFFFFFFFFFFFFFF;
        signExtend = 1'b1; shiftLeft = 1'b1;

        for (i = 0; i < BIT_WIDTH; i++) begin
            shiftAmt = i; 
            #(100 * GATE_DELAY + 10);
        end 

        in = 64'd512; 
        signExtend = 1'b1; shiftLeft = 1'b1;

        for (i = 0; i < BIT_WIDTH; i++) begin
            shiftAmt = i; 
            #(100 * GATE_DELAY + 10);
        end 

    end
endmodule