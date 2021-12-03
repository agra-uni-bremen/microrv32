package core.microrv32

import spinal.lib._
import spinal.core._
import spinal.core.Formal._
/*
 * The register for the rv32 core
 * Parameters
 * addressWidth : Int -- Word bitwidth as Int
 * dataWidth : Int  -- Data bitwidth as Int
 * wordCount : Int -- Depth of the register file as Int
 */
class RV32RegisterFileFPMI(addressWidth : Int = 5, dataWidth : Int = 32, wordCount : Int = 32, fpmi: Boolean = true) extends Component{
  val io = new Bundle{
    val rs1 = in UInt(addressWidth bits)
    val rs2 = in UInt(addressWidth bits)
    val rs1Data = out Bits(dataWidth bits)
    val rs2Data = out Bits(dataWidth bits)
    val wrEna = in Bool()
    val rd = in UInt(addressWidth bits)
    val rdData = in Bits(dataWidth bits)
    val regs_o = if(fpmi) out Bits(dataWidth * wordCount bits) else null
  }

  val regFile = new Mem(Bits(dataWidth bits),wordCount)
  // initialize all registers in register file with 32bit 0 values
  // https://spinalhdl.github.io/SpinalDoc-RTD/SpinalHDL/Data%20types/bits.html for shorthand B
  // https://www.tutorialspoint.com/scala/scala_lists.htm for list handling
  regFile.init(List.fill(wordCount)(B(0,dataWidth bits)))
  
  io.rs1Data := regFile.readAsync(io.rs1)
  io.rs2Data := regFile.readAsync(io.rs2)

  // https://github.com/SpinalHDL/SpinalHDL/issues/291 states
  // using multiple condition for memory read requires either unconditional
  // read surrounded by condition or conditional read has combined condition
  when(io.rd =/= 0 && io.wrEna){
    regFile.write(io.rd,io.rdData)
  }
  if(fpmi){
    for(i <- 1 to wordCount){
      io.regs_o((dataWidth * i - 1)  downto (dataWidth* (i-1))) := regFile(U(i - 1, addressWidth bits))
    }
  }
}

//Generate the Top Verilog
object RV32RegisterFileFPMI {
  def main(args: Array[String]) {
    SpinalConfig(
      defaultConfigForClockDomains = ClockDomainConfig(resetKind=SYNC, resetActiveLevel=HIGH),
      targetDirectory = "pm"
      ).includeFormal.generateSystemVerilog(new RV32RegisterFileFPMI())
  }
}