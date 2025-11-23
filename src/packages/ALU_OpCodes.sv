package ALU_OpCodes;
    typedef enum logic [3:0] {
        ALU_ADD   = 4'd0, // Adds 2 Registers
        ALU_SUB   = 4'd1, // Subs 2 Registers
        ALU_AND   = 4'd2, // Bitwise AND
        ALU_OR    = 4'd3, // Bitwise OR
        ALU_XOR   = 4'd4, // BITWISE XOR
        ALU_SLT   = 4'd5, // Set Less Than (Signed: rs1 < rs2)
        ALU_SLTU  = 4'd6, // Set Less Than (Unsigned: rs1 < rs2)
        ALU_SLL   = 4'd7, // Shift Left Logical (Zero Extend)
        ALU_SRA   = 4'd8, // Shift Right Arithmetic (Sign Extend)
        ALU_SRL   = 4'd9, // Shift Right Logical (Zero Extend)
       
    } aluOpCode_int;
endpackage