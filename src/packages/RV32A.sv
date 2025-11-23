//Name: Leonard Paya
//Date: 09/08/2025

// 

// Source: "The RISC-V Instruction Set Manual Volume I: Unprivileged ISA"
// Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154769/RISC-V+Technical+Specifications
// Version: 20250508
// Published: May 2025

package RV32A;
    typedef enum logic [6:0] {
        OP_A_EX = 7'b0101111;
    } opcode_e;

    typedef enum logic [2:0] {
        FUNC3_A_W = 3'b010;
    } func3_e;

    typedef enum logic [4:0] {
        FUNC7_LR      = 5'b00010;
        FUNC7_SC      = 5'b00011;
        FUNC7_AMOSWAP = 5'b00001;
        FUNC7_AMOADD  = 5'b00000;
        FUNC7_AMOXOR  = 5'b00100;
        FUNC7_AMOAND  = 5'b01100;
        FUNC7_AMOOR   = 5'b01000;
        FUNC7_AMOMIN  = 5'b10000;
        FUNC7_AMOMAX  = 5'b10100;
        FUNC7_AMOMINU = 5'b11000;
        FUNC7_AMOMAXU = 5'b11100;
    } func5_e;
endpackage