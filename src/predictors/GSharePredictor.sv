// Name: Leonard Paya
// Date: 09/19/2025

// This is a G Share Predictor that selects from 1024 2 bit predictors and is index by an XOR of
//  the current 10-bit branch address and a 10 bit history of the 10 most recent outcomes of the 
//  branches.

// Input:
//      - bAddr: The 10-bit branch address of the current instruction.
//      - brTaken: A 1-bit branch taken signal, when true means branch should be taken, and vice
//          versa. This signal should be for a branch instruction that is 1 clk cycle ahead of
//          this predictor.
//      - en: Enable signal that should be true when the current instruction is a branch.
//      - clk: Clock signal.
//      - reset: Reset signal.
// Output:
//      - prediction: A prediction that will be used to determine the next instruction.

module GSharePredictor (
    input logic [(XORBITWIDTH - 1):0] bAddr,
    input logic brTaken,
    input logic clk, reset, en,
    output logic prediction
);

    //Provides the Prediction Logic :
    logic [9:0] bHistOut;
    logic [1023:0] predPHT; // Outputs of every 2 bit predictor
    logic [9:0] readPHT; // maps to a single predictor in the PHT to pull the value from.

    //Store outcome Logic:
    // maps to a single predictor in PHT to send send the outcome of brTaken
    logic [1023:0] pred2BitEn; 

    logic enWrite; // in prev cycle there was a branch, in this cycle must store input brTaken.
    logic [9:0] writePHT; // Seed of the 2 bit predictor that must be updated with brTaken.


    //Provided the Prediction:
    ShiftLeftReg branchHist(.in(brTaken), .out(bHistOut), .enShift(enWrite), .clk, .reset);

    assign readPHT = bHistOut ^ bAddr;

    assign prediction = predPHT[readPHT]; // A 1024 to 1 Mux.

    generate
        for (genvar i = 0; i < (2 ^ 10); i++) begin : PHT //Pattern History Table
            TwoBitPredictor pred2Bit (.brTaken, .prediction(predPHT[i]), .en(pred2BitEn[i] & enWrite),
                                     .clk, .reset); 
        end
    endgenerate

    //Stores the outcome in the PHT:
    RegXBit #(.BITLEGN TH(11)) updatePredictorReg (.in({en, readPHT}), .out(enWrite, writePHT), .clk, .reset);
    assign pred2BitEn = 1 << writePHT; // This is a decoder.
    
endmodule