// Name: Leonard Paya
// Date: 09/15/2025

// This a dynamic branch predictor, that requires 2 predictions to be wrong to change the 
//  prediction choice. :)

// Input: 
//      - brTaken: 1 bit input, true if a branch was taken.
//      - clk: clock signal
//      - reset: reset signal, initial state is S1.
//      - en: enable, if true means the current instruction in some part of the pipe line is 
//              a branch.
// Output:
//      - prediction: 1 bit signal, true if predicting a branch should be taken. 

module TwoBitPredictor (
    input logic brTaken,
    input logic clk, reset, en,
    output logic prediction
)
    logic pastPred;

    Dff_En pastPredDFF(.in(prediction), .out(pastPred), .en, .reset, .clk);

    enum {S0, S1, S2, S3} ps, ns; // Present state, next state
    
    // Next State Logic
    always_comb begin
        casez (ps)
            // Predict Not Taken: 0 Wrong
            S0: begin
                if (en && brTaken)
                    ns = S1;
                else 
                    ns = S0;
            end

            // Predict Not Taken: 1 Wrong
            S1: begin
                if (en && brTaken)
                    ns = S3;
                else if (en && !brTaken)
                    ns = S0;
                else 
                    ns = S1;
            end

            // Predict Taken: 1 Wrong 
            S2: begin
                if (en && brTaken)
                    ns = S3;
                else if (en && !brTaken)
                    ns = S0;
                else 
                    ns = S2; 
            end
            
            // Predict Taken: 0 Wrong
            S3: begin 
                if (en && !brTaken)
                    ns = S2;
                else 
                    ns = S3;
            end
        endcase  
    end

    //Predictions: 0 -> Predict Not Taken, 1 -> Predict Taken
    always_comb begin
        casez(ps)
            S0: prediction = 0;
            S1: prediction = 0;
            S2: prediction = 1;
            S3: prediction = 1;
        endcase
    end 

    // Next State Logic
    always_ff @(posedge clk) begin 
        if (reset)
            ps <= S1;
        else 
            ps <= ns;
    end 

endmodule