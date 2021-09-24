package core.microrv32

import spinal.core._
/*
 * Constants and Masks and Enum definitions for CSR extension
 */
object MULDIVOpcode{
  // for RV32 Zicsr Extension (CSR)
  // readablity constants for opcode, func3, func7, func12 in different appearances
  // used by decode logic
  // derived from https://github.com/riscv/riscv-opcodes/blob/master/opcodes-rv32i
  def OP_MULDIV = M"0110011"
  
  // MUL
  def F3_MUL    = M"000"
  def F3_MULH   = M"001"
  def F3_MULHSU = M"010"
  def F3_MULHU  = M"011"
  // DIV
  def F3_DIV    = M"100"
  def F3_DIVU   = M"101"
  // REM
  def F3_REM    = M"110"
  def F3_REMU   = M"111"

  // F7 specific to RV32M Standard Extension
  def F7_MULDIV = M"0000001"
}