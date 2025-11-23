//Name: Leonard Paya
//Date: 09/08/2025

// 

// Source: "The RISC-V Instruction Set Manual Volume I: Unprivileged ISA"
// Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154769/RISC-V+Technical+Specifications
// Version: 20250508
// Published: May 2025

package RV32M;
    typedef enum logic [6:0] {
        OP_M_EX = 7'b0110011;
    } opcode_e;

    typedef enum logic [2:0] {
        FUNC3_MUL = 3'b000;
        FUNC3_MULH = 3'b001;
        FUNC3_MULHSU = 3'b010;
        FUNC3_MULHU  = 3'b011;
        FUNC3_DIV    = 3'b100;
        FUNC3_DIVU   = 3'b101;
        FUNC3_REM    = 3'b110;
        FUNC3_REMU   = 3'b111;
    } func3_e;

    typedef enum logic [6:0] {
        FUNC7_M_EX = 7'b0000001;
    } func7_e;
endpackage