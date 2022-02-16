package core.microrv32

import spinal.core._

case class RegFileIO(addressWidth : Int, dataWidth : Int) extends Bundle{
    val rs1 = in UInt(addressWidth bits)
    val rs2 = in UInt(addressWidth bits)
    val rs1Data = out Bits(dataWidth bits)
    val rs2Data = out Bits(dataWidth bits)
    val wrEna = in Bool()
    val rd = in UInt(addressWidth bits)
    val rdData = in Bits(dataWidth bits)
}

/*
 * The register for the rv32 core
 * Parameters
 * addressWidth : Int -- Word bitwidth as Int
 * dataWidth : Int  -- Data bitwidth as Int
 * wordCount : Int -- Depth of the register file as Int
 */
class RV32RegisterFile(addressWidth : Int, dataWidth : Int, wordCount : Int) extends Component{
  val io = new RegFileIO(addressWidth, dataWidth)
  val regFile = new Mem(Bits(dataWidth bits),wordCount)
  // initialize all registers in register file with 32bit 0 values
  // https://spinalhdl.github.io/SpinalDoc-RTD/SpinalHDL/Data%20types/bits.html for shorthand B
  // https://www.tutorialspoint.com/scala/scala_lists.htm for list handling
  regFile.init(List.fill(wordCount)(B(0,dataWidth bits)))

  io.rs1Data := regFile.readSync(io.rs1)
  io.rs2Data := regFile.readSync(io.rs2)

  // https://github.com/SpinalHDL/SpinalHDL/issues/291 states
  // using multiple condition for memory read requires either unconditional
  // read surrounded by condition or conditional read has combined condition
  when(io.rd =/= 0 && io.wrEna){
    regFile.write(io.rd,io.rdData)
  }
}