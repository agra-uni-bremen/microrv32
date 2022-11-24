package core.microrv32

import spinal.core._
/*
 * Constants and Masks and Enum definitions for CSR extension
 */
object CSROpcode{
  // for RV32 Zicsr Extension (CSR)
  // readablity constants for opcode, func3, func7, func12 in different appearances
  // used by decode logic
  // derived from https://github.com/riscv/riscv-opcodes/blob/master/opcodes-rv32i
  def OP_CSR = M"1110011"
  
  def F3_CSRRW  = M"001"
  def F3_CSRRS  = M"010"
  def F3_CSRRC  = M"011"
  def F3_CSRRWI = M"101"
  def F3_CSRRSI = M"110"
  def F3_CSRRCI = M"111"
  def F3_CSR_DECODEMASK = M"-00"

  def F12_MRET = M"001100000010"
}

object RVCSR{
  // default values and encodings for "Zicsr", CSR Extension
  def MISA_DEFAULT = B(32 bits, (31 downto 30) -> B"01", 8 -> true, default -> false)
  def MSTATUS_DEFAULT = B(32 bits, (12 downto 11) -> B"11", default -> false)

  //def TRAP_EXC_ILLEGAL_INSTR = B(32 bits, 31->false, (30 downto 0) -> 2, default -> false)
  // def TRAP_EXC_ILLEGAL_INSTR = B"0000_0000_0000_0000_0000_0000_0000_0010"
  def TRAP_EXC_INSTR_ADDR_MISALIGN = B(32 bits, 31->false, default->false) | 0
  def TRAP_EXC_ILLEGAL_INSTR = B(32 bits, 31->false, default->false) | 2
  def TRAP_EXC_LD_ADDR_MISALIGN = B(32 bits, 31->false, default->false) | 4
  def TRAP_EXC_ST_ADDR_MISALIGN = B(32 bits, 31->false, default->false) | 6
  //def TRAP_EXC_ECALL_M_MODE = B(32 bits, 31->false, (30 downto 0) -> 11, default -> false)
  def TRAP_EXC_ECALL_M_MODE = B(32 bits, 31->false, default->false) | 11
  def TRAP_MACHINE_TIMER_INTERRUPT = B(32 bits, 31->true, default->false) | 7

  // memory map for CSR registers
  // Machine Information Registers
  def MVENDORID_ADDR = U"xF11"
  //def MVENDORID_ADDR = M"1111_0001_0001" // M"xF11"
  def MARCHID_ADDR   = U"xF12"
  def MIMPID_ADDR    = U"xF13"
  def MHARTID_ADDR   = U"xF14"
  // Machine Trap Setup
  def MSTATUS_ADDR = U"x300"
  def MISA_ADDR    = U"x301"
  def MEDELEG_ADDR = U"x302"
  def MIDELEG_ADDR = U"x303"
  def MIE_ADDR     = U"x304"
  def MTVEC_ADDR   = U"x305"
  // Machine Trap Handling
  def MEPC_ADDR   = U"x341"
  def MCAUSE_ADDR = U"x342"
  def MTVAL_ADDR  = U"x343"
  def MIP_ADDR    = U"x344"
  // Hardware Performance Monitor / Machine Counters/Timers
  def MCYCLE_ADDR    = U"xB00"
  def MINSTRET_ADDR  = U"xB02"
  def MCYCLEH_ADDR   = U"xB80"
  def MINSTRETH_ADDR = U"xB82"
  
  // bit masks for read/write access
  def DEFAULT_CSR_MASK   = B"1111_1111_1111_1111_1111_1111_1111_1111"
  def MSTATUS_READ_MASK  = B"0000_0000_0000_0000_0001_1000_1000_1000"
  def MSTATUS_WRITE_MASK = B"0000_0000_0000_0000_0000_0000_1000_1000"
  def MIE_RW_MASK        = B"0000_0000_0000_0000_0000_1000_1000_1000"
  def MTVEC_WRITE_MASK   = B"1111_1111_1111_1111_1111_1111_1111_1100"
  def MIP_RW_MASK        = B"0000_0000_0000_0000_0000_1000_1000_1000"
  def MEPC_WRITE_MASK_32 = B"1111_1111_1111_1111_1111_1111_1111_1100"
  def MEPC_WRITE_MASK_16 = B"1111_1111_1111_1111_1111_1111_1111_1110"

  // mstatus access bits
  def MSTATUS_MIE  = 3
  def MSTATUS_MPIE = 7

  // enable/pending interrupt access positions
  def MIP_MTIP = 7

  def generateMISAValue(muldiv : Boolean, compressed : Boolean) : Bits = {
    // set bits [31:30] to '01' for XLEN = 32
    // set bit [8] to '1' for rv32i
    var misaVal = (1 << 30) | (1 << 7)
    // var misaVal = 0x40000080 
    if(muldiv){
      // if M-extension is configured, set bit [12] to '1'
      misaVal |= (1 << 11)
    }
    if(compressed){
      // if C-extension is configured, set bit [2] to '1'
      misaVal |= (1 << 1)
    }
    B(misaVal,32 bits)
  }

}

// enum to control operation for CSR logic
object CSRAccessType extends SpinalEnum{
  // with csridle the datapath logic can be simplified later
  // additionally provides a read-enable that is seperated from write-enable
  val CSRidle, CSRread, CSRwrite, CSRset, CSRclear = newElement()
}