package PP_RV32I.Core

import spinal.core._
/*
 * Masks, constants for RV32I decode
 */
object RVOpcode{
  // readablity constants for opcode, func3, func7, func12 in different appearances
  // used by decode logic
  // derived from https://github.com/riscv/riscv-opcodes/blob/master/opcodes-rv32i
  def F12_ECALL  = M"000000000000"
  def F12_EBREAK = M"000000000001"
  def F3_PRIV = M"000"

  // opcode format types
  def OP_ZEROS  = M"0000000"
  def OP_REGREG = M"0110011"
  def OP_REGIMM = M"0010011"
  def OP_LOAD   = M"0000011"
  def OP_STORE  = M"0100011"
  def OP_BRANCH = M"1100011"
  def OP_JAL    = M"1101111"
  def OP_JALR   = M"1100111"
  def OP_LUI    = M"0110111"
  def OP_AUIPC  = M"0010111"
  def OP_FENCE  = M"0001111"
  def OP_ECALL  = M"1110011" //This not only conform to the ECALL but also EBREAK

  def F3_JALR = M"000"

  def F3_BEQ  = M"000"
  def F3_BNE  = M"001"
  def F3_BLT  = M"100"
  def F3_BGE  = M"101"
  def F3_BLTU = M"110"
  def F3_BGEU = M"111"

  def F3_LB  = M"000"
  def F3_LH  = M"001"
  def F3_LW  = M"010"
  def F3_LBU = M"100"
  def F3_LHU = M"101"

  def F3_SB = M"000"
  def F3_SH = M"001"
  def F3_SW = M"010"

  def F3_ADDI  = M"000"
  def F3_SLTI  = M"010"
  def F3_SLTIU = M"011"
  def F3_XORI  = M"100"
  def F3_ORI   = M"110"
  def F3_ANDI  = M"111"
  def F3_SLLI  = M"001"
  def F3_SRLI  = M"101"
  def F3_SRAI  = M"101"

  def F3_ADD  = M"000"
  def F3_SUB  = M"000"
  def F3_SLL  = M"001"
  def F3_SLT  = M"010"
  def F3_SLTU = M"011"
  def F3_XOR  = M"100"
  def F3_SRL  = M"101"
  def F3_SRA  = M"101"
  def F3_OR   = M"110"
  def F3_AND  = M"111"

  def F3_FENCE   = M"000"
  def F3_FENCE_I = M"001"

  def F7_Z = M"0000000"
  def F7_O = M"0100000"
}