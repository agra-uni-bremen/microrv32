package core.microrv32.rv32core.compressed

import spinal.core._
/*
 * Constants and Masks and Enum definitions for C extension
 */
object CompressedOpcode{
    // instruction[1:0] -- RVC quadrants
    def Q0 = M"00"
    def Q1 = M"01"
    def Q2 = M"10"
    def Q3 = M"11"

    // quadrant 0 funct values 
    def Q0_F3_ILLEGAL  = M"000"
    def Q0_F3_ADDI4SPN = M"000"
    def Q0_F3_FLD      = M"001" //RV32DC/RV64DC
    def Q0_F3_LQ       = M"001" //RV128C
    def Q0_F3_LW       = M"010" 
    def Q0_F3_FLW      = M"011" //RV32FC
    def Q0_F3_LD       = M"011" //RV64C/RV128C
    def Q0_F3_RESERVED = M"100" 
    def Q0_F3_FSD      = M"101" //RV32DC/RV64DC
    def Q0_F3_SQ       = M"101" //RV128C
    def Q0_F3_SW       = M"110" 
    def Q0_F3_FSW      = M"111" //RV32FC
    def Q0_F3_SD       = M"111" //RV64C/RV128C
    
    // quadrant 1 funct values 
    def Q1_F3_NOP       = M"000"
    def Q1_F3_ADDI      = M"000"
    def Q1_F3_JAL       = M"001"
    def Q1_F3_ADDIW     = M"001"
    def Q1_F3_LI        = M"010"
    def Q1_F3_ADDI16SP  = M"011"
    def Q1_F3_LUI       = M"011"
    def Q1_F3_SRLI      = M"100"
    def Q1_F3_SRLI64    = M"100"
    def Q1_F3_SRAI      = M"100"
    def Q1_F3_SRAI64    = M"100"
    def Q1_F3_ANDI      = M"100"
    def Q1_F3_SUB_XOR_OR_AND = M"100"
    
    def Q1_F2_A_SRLI           = M"00"
    def Q1_F2_A_SRLI64         = M"00"
    def Q1_F2_A_SRAI           = M"01"
    def Q1_F2_A_SRAI64         = M"01"
    def Q1_F2_A_ANDI           = M"10"
    def Q1_F2_A_SUB_XOR_OR_AND = M"11"

    def Q1_F6_SUB_XOR_OR_AND = M"100011"
    def Q1_F4_SUB_XOR_OR_AND = M"1000" 
    
    def Q1_F2_B_SUB = M"00"
    def Q1_F2_B_XOR = M"01"
    def Q1_F2_B_OR  = M"10"
    def Q1_F2_B_AND = M"11"
    
    def Q1_F4_SUBW_ADDW = M"1001"
    def Q1_F6_SUBW      = M"100111"
    def Q1_F6_ADDW      = M"100111"

    def Q1_F3_RESERVED = M"100"
    def Q1_F3_J        = M"101"
    def Q1_F3_BEQZ     = M"110"
    def Q1_F3_BNEZ     = M"111"

    // quadrant 2 funct values
    def Q2_F3_SLLI   = M"000"
    def Q2_F3_SLLI64 = M"000"
    def Q2_F3_FLDSP  = M"001"
    def Q2_F3_LQSP   = M"001"
    def Q2_F3_LWSP   = M"010"
    def Q2_F3_FLWSP  = M"011"

    def Q2_F3_JR_MV_EBREAK_JALR_ADD = M"100"
    
    def Q2_F4_JR     = M"1000"
    def Q2_F4_MV     = M"1000"
    def Q2_F4_EBREAK = M"1001"
    def Q2_F4_JALR   = M"1001"
    def Q2_F4_ADD    = M"1001"
    
    def Q2_EBREAK = M"1001000000000010"

    def Q2_F3_FSDSP = M"101"
    def Q2_F3_SQSP  = M"101"
    def Q2_F3_SWSP  = M"110"
    def Q2_F3_FSWSP = M"111"
    def Q2_F3_SDSP  = M"111"

    // defined instruction masks
    def Q0_ILLEGAL_INSTRUCTION  = M"0000_0000_0000_0000"
}

object RVOP{
    // instruction[1:0] -- RVC quadrants
    def Q0 = B"00"
    def Q1 = B"01"
    def Q2 = B"10"
    def Q3 = B"11"

    // quadrant 0 funct values 
    def Q0_F3_ILLEGAL  = B"000"
    def Q0_F3_ADDI4SPN = B"000"
    def Q0_F3_FLD      = B"001" //RV32DC/RV64DC
    def Q0_F3_LQ       = B"001" //RV128C
    def Q0_F3_LW       = B"010" 
    def Q0_F3_FLW      = B"011" //RV32FC
    def Q0_F3_LD       = B"011" //RV64C/RV128C
    def Q0_F3_RESERVED = B"100" 
    def Q0_F3_FSD      = B"101" //RV32DC/RV64DC
    def Q0_F3_SQ       = B"101" //RV128C
    def Q0_F3_SW       = B"110" 
    def Q0_F3_FSW      = B"111" //RV32FC
    def Q0_F3_SD       = B"111" //RV64C/RV128C
    
    // quadrant 1 funct values 
    def Q1_F3_NOP       = B"000"
    def Q1_F3_ADDI      = B"000"
    def Q1_F3_JAL       = B"001"
    def Q1_F3_ADDIW     = B"001"
    def Q1_F3_LI        = B"010"
    def Q1_F3_ADDI16SP  = B"011"
    def Q1_F3_LUI       = B"011"
    def Q1_F3_SRLI      = B"100"
    def Q1_F3_SRLI64    = B"100"
    def Q1_F3_SRAI      = B"100"
    def Q1_F3_SRAI64    = B"100"
    def Q1_F3_ANDI      = B"100"
    def Q1_F3_SUB_XOR_OR_AND = B"100"
    
    def Q1_F2_A_SRLI           = B"00"
    def Q1_F2_A_SRLI64         = B"00"
    def Q1_F2_A_SRAI           = B"01"
    def Q1_F2_A_SRAI64         = B"01"
    def Q1_F2_A_ANDI           = B"10"
    def Q1_F2_A_SUB_XOR_OR_AND = B"11"

    def Q1_F6_SUB_XOR_OR_AND = B"100011"
    def Q1_F4_SUB_XOR_OR_AND = B"1000" 
    
    def Q1_F2_B_SUB = B"00"
    def Q1_F2_B_XOR = B"01"
    def Q1_F2_B_OR  = B"10"
    def Q1_F2_B_AND = B"11"
    
    def Q1_F4_SUBW_ADDW = B"1001"
    def Q1_F6_SUBW      = B"100111"
    def Q1_F6_ADDW      = B"100111"

    def Q1_F3_RESERVED = B"100"
    def Q1_F3_J        = B"101"
    def Q1_F3_BEQZ     = B"110"
    def Q1_F3_BNEZ     = B"111"

    // quadrant 2 funct values
    def Q2_F3_SLLI   = B"000"
    def Q2_F3_SLLI64 = B"000"
    def Q2_F3_FLDSP  = B"001"
    def Q2_F3_LQSP   = B"001"
    def Q2_F3_LWSP   = B"010"
    def Q2_F3_FLWSP  = B"011"

    def Q2_F3_JR_MV_EBREAK_JALR_ADD = B"100"
    
    def Q2_F4_JR     = B"1000"
    def Q2_F4_MV     = B"1000"
    def Q2_F4_EBREAK = B"1001"
    def Q2_F4_JALR   = B"1001"
    def Q2_F4_ADD    = B"1001"
    
    def Q2_EBREAK = B"1001000000000010"

    def Q2_F3_FSDSP = B"101"
    def Q2_F3_SQSP  = B"101"
    def Q2_F3_SWSP  = B"110"
    def Q2_F3_FSWSP = B"111"
    def Q2_F3_SDSP  = B"111"

    def Q0_ILLEGAL_INSTRUCTION  = B"0000_0000_0000_0000"
}
