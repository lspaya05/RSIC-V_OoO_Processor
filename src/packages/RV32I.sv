//Name: Leonard Paya
//Date: 09/08/2025

// Contains the Register bit length (XLEN) and the Instructions that must be implemented with the
//  RV32I ISA. 

// Source: "The RISC-V Instruction Set Manual Volume I: Unprivileged ISA"
// Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154769/RISC-V+Technical+Specifications
// Version: 20250508
// Published: May 2025

package RV32I;

    parameter int XLEN = 32;
    parameter int NUM_REGS = 32;

    localparam int ADDR_W = $clog2(NUM_REGS);

    //Bit-Lengths:
    typedef logic [3:0] nibble_t;
    typedef logic [7:0] byte_t;
    typedef logic [XLEN -1: 0] word_t;
    typedef logic [(2 * XLEN) - 1: 0] dword_t;

    // Instruction Codes:
    typedef enum logic [31:0] {
       ADDR_FENCE_TSO = 32'b10000011001100000000000000001111;
       ADDR_PAUSE     = 32'b10000011001100000000000000001111;
       ADDR_ECALL     = 32'b10000011001100000000000000001111;
       ADDR_EBREAK    = 32'b10000011001100000000000000001111;
    } instr_e;

    typedef enum logic [6:0] {
        OP_LUI    = 7'b0110111;
        OP_AUIPC  = 7'b0010111;
        OP_JAL    = 7'b1101111;
        OP_JALR   = 7'b1100111;
        OP_BCOND  = 7'b1100011;
        OP_LOAD   = 7'b0000011;
        OP_STORE  = 7'b0100011;
        OP_I_TYPE = 7'b0010011;
        OP_R_TYPE = 7'b0110011;
        OP_HINT   = 7'b0001111;
    } opcode_e;

    typedef enum logic [2:0] {
        //Jump and Link Regsiter Function (JALR):
        FUNC3_JALR = 3'b000;

        //Branch Conditional Functions (BCOND):
        FUNC3_BEQ  = 3'b000;
        FUNC3_BNE  = 3'b001;
        FUNC3_BLT  = 3'b100;
        FUNC3_BGE  = 3'b101;
        FUNC3_BLTU = 3'b110;
        FUNC3_BGEU = 3'b111;

        //Load Functions (LOAD):
        FUNC3_LB  = 3'b000;
        FUNC3_LH  = 3'b001;
        FUNC3_LW  = 3'b010;
        FUNC3_LBU = 3'b100;
        FUNC3_LHU = 3'b101;

        //Store Functions (STORE):
        FUNC3_SB = 3'b000;
        FUNC3_SH = 3'b001;
        FUNC3_SW = 3'b010;

        //Logic and Simple Arithmetic (I_TYPE / R_TYPE):
        FUNC3_ADD_SUB  = 3'b000;
        FUNC3_SLL      = 3'b001;
        FUNC3_SLT      = 3'b010;
        FUNC3_SLTU     = 3'b011;
        FUNC3_XOR      = 3'b100;
        FUNC3_SRL_SRA  = 3'b101;
        FUNC3_OR       = 3'b110;
        FUNC3_AND      = 3'b111;

        //Hint Functions (HINT):
        FUNC3_HINT = 3'b000;
    } func3_e;

    typedef enum logic [6:0] {
        //Only Needed on R-Type:
            //Default used in: Add, SLT, SLTU, XOR, OR, AND
        FUNC7_DEFAULT  = 7'b0000000;
        FUNC7_SUB  = 7'b0100000;

        //Needed for R-Type and I-type:
        FUNC7_SLL  = 7'b0000000;
        FUNC7_SRL  = 7'b0000000;
        FUNC7_SRA  = 7'b0100000;
    } func7_e;

    // Functions to use:
endpackage