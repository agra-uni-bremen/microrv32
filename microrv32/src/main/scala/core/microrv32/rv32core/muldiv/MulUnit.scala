package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._

//Hardware definition
class MulUnit extends Component {
  val io = new Bundle {
    val multiplicand = in Bits(32 bits)
    val multiplier = in Bits(32 bits)
    val product = out Bits(64 bits)
    val valid = in Bool
    val ready = out Bool
    val busy = out Bool
  }
  // control unit
  val ctrl = new MulUnitControl()
  ctrl.io.valid := io.valid
  io.ready := ctrl.io.ready
  io.busy := ctrl.io.busy
  // regs
  // val op = Reg(MulOperation()) init(MulOperation.mul)
  val mcand = Reg(UInt(32 bits)) init(0)
  val mcandTc = Reg(UInt(32 bits)) init(0)
  val prod = Reg(Bits(64 bits)) init(0)
  val oldLSB = Reg(Bits(1 bits)) init(0)
  // wires
  val partialProduct = Bits(32 bits)
  val mpLSB = prod(0 downto 0)
  val mcandSign = io.multiplicand(31)
  val mplierSign = io.multiplier(31) 
  
  ctrl.io.multiplierLSB := mpLSB ## oldLSB

  // if (LSB ## oldLSB)==10 => sub, if(LSB ## oldLSB)==01 => add, else no addition happens
  partialProduct := ctrl.io.mcandSummand.mux(
    SummandVal.normal -> (prod(63 downto 32).asUInt + mcand ).asBits,
    SummandVal.tcompl -> (prod(63 downto 32).asUInt + mcandTc ).asBits
  )

  when(ctrl.io.loadValues){
    mcand := io.multiplicand.asUInt
    mcandTc := io.multiplicand.asUInt.twoComplement(True)(31 downto 0).asUInt
    prod := B(B(0, 32 bits) ## io.multiplier.asBits, 64 bits)
    oldLSB := 0
  }.elsewhen(ctrl.io.writeAddition){
    prod := partialProduct(31 downto 0) ## prod(31 downto 0)
  }.elsewhen(ctrl.io.shiftProduct){
    oldLSB := mpLSB
    prod := prod(63) ## prod(63 downto 1)
  }

  io.product := io.ready ? prod | 0
}

//Generate the MulUnit's Verilog
object MulUnitVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new MulUnit)
  }
}