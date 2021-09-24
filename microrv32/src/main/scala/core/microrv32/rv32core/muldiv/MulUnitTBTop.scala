package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._

//Generate the MulUnitTBTop's Verilog
object MulUnitTBTopVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new MulUnitTBTop)
  }
}
class MulUnitTBTop extends Component{
  val io = new Bundle {
    val multiplicand = in SInt(32 bits)
    val multiplier = in SInt(32 bits)
    val product = out SInt(64 bits)
    val valid = in Bool
    val ready = out Bool
    val operation = in(MulOperation())
  }
  val mulUnit = new MulUnit()
  mulUnit.io.multiplicand := io.multiplicand.asBits
  mulUnit.io.multiplier := io.multiplier.asBits
  io.product := mulUnit.io.product.asSInt
  mulUnit.io.valid := io.valid
  io.ready := mulUnit.io.ready
  mulUnit.io.operation := io.operation
}
