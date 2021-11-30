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
    val wrEna = in Bool
    val rd = in UInt(addressWidth bits)
    val rdData = in Bits(dataWidth bits)
    val regs_o = out Bits(dataWidth * wordCount bits) // hier noch abhängig von fpmi generieren?!
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
    // io.regs_o := 0
    io.regs_o(dataWidth - 1  downto 0) := regFile(U"00000")
    io.regs_o(dataWidth * 2 - 1  downto dataWidth) := regFile(U"00001")
    io.regs_o(dataWidth * 3 - 1  downto dataWidth* 2) := regFile(U"00010")
    io.regs_o(dataWidth * 4 - 1  downto dataWidth* 3) := regFile(U"00011")
    io.regs_o(dataWidth * 5 - 1  downto dataWidth* 4) := regFile(U"00100")
    io.regs_o(dataWidth * 6 - 1  downto dataWidth* 5) := regFile(U"00101")
    io.regs_o(dataWidth * 7 - 1  downto dataWidth* 6) := regFile(U"00110")
    io.regs_o(dataWidth * 8 - 1  downto dataWidth* 7) := regFile(U"00111")
    io.regs_o(dataWidth * 9 - 1  downto dataWidth* 8) := regFile(U"01000")
    io.regs_o(dataWidth * 10 - 1  downto dataWidth* 9) := regFile(U"01001")
    io.regs_o(dataWidth * 11 - 1  downto dataWidth* 10) := regFile(U"01010")
    io.regs_o(dataWidth * 12 - 1  downto dataWidth* 11) := regFile(U"01011")
    io.regs_o(dataWidth * 13 - 1  downto dataWidth* 12) := regFile(U"01100")
    io.regs_o(dataWidth * 14 - 1  downto dataWidth* 13) := regFile(U"01101")
    io.regs_o(dataWidth * 15 - 1  downto dataWidth* 14) := regFile(U"01110")
    io.regs_o(dataWidth * 16 - 1  downto dataWidth* 15) := regFile(U"01111")
    io.regs_o(dataWidth * 17 - 1  downto dataWidth* 16) := regFile(U"10000")
    io.regs_o(dataWidth * 18 - 1  downto dataWidth* 17) := regFile(U"10001")
    io.regs_o(dataWidth * 19 - 1  downto dataWidth* 18) := regFile(U"10010")
    io.regs_o(dataWidth * 20 - 1  downto dataWidth* 19) := regFile(U"10011")
    io.regs_o(dataWidth * 21 - 1  downto dataWidth* 20) := regFile(U"10100")
    io.regs_o(dataWidth * 22 - 1  downto dataWidth* 21) := regFile(U"10101")
    io.regs_o(dataWidth * 23 - 1  downto dataWidth* 22) := regFile(U"10110")
    io.regs_o(dataWidth * 24 - 1  downto dataWidth* 23) := regFile(U"10111")
    io.regs_o(dataWidth * 25 - 1  downto dataWidth* 24) := regFile(U"11000")
    io.regs_o(dataWidth * 26 - 1  downto dataWidth* 25) := regFile(U"11001")
    io.regs_o(dataWidth * 27 - 1  downto dataWidth* 26) := regFile(U"11010")
    io.regs_o(dataWidth * 28 - 1  downto dataWidth* 27) := regFile(U"11011")
    io.regs_o(dataWidth * 29 - 1  downto dataWidth* 28) := regFile(U"11100")
    io.regs_o(dataWidth * 30 - 1  downto dataWidth* 29) := regFile(U"11101")
    io.regs_o(dataWidth * 31 - 1  downto dataWidth* 30) := regFile(U"11110")
    io.regs_o(dataWidth * 32 - 1  downto dataWidth* 31) := regFile(U"11111")
  }

  /* // Formal Stuff
  GenerationFlags.formal {
    assumeInitial(clockDomain.isResetActive)
    // Generic Register for Verification
    val f_address = UInt(addressWidth bits)
    f_address.addAttribute("anyconst")
    val f_reg = Reg(Bits(dataWidth bits))
    assumeInitial(f_reg === 0)

    // Test
    /*
    val f_regPast = Reg(Bool)
    f_regPast := past(f_reg,2) === f_reg
    */

    // Always
    ClockDomain.current.withoutReset(){
      // Synchronize Generic Register
      when(io.rd === f_address & io.wrEna & f_address =/= 0){
        f_reg := io.rdData
      }
      // Asserts
      when(io.rs1 === f_address){
        assert(io.rs1Data === f_reg)
      }
      when(io.rs2 === f_address){
        assert(io.rs2Data === f_reg)
      }
      when(f_address === 0){
        assert(f_reg === 0)
      }
      // Test
      /*
      when(f_regPast){
        assert(!io.wrEna)
      }
      */

      // Full proof requires direct insight into the actual register:
      if(unplugged){
        assert(f_reg === regFile(f_address))
      }
    }

    // Reset-State
    /*
    ClockDomain.current.duringReset {
    }
    */
    // Non-ResetState

    // cover statements
    //cover(f_reg =/= 0 & io.rs1Data === f_reg)
  }
  */
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