package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._

class DivUnitTBTop extends Component {
  val io = new Bundle {
    val dividend = in SInt (32 bits)
    val divisor = in SInt (32 bits)
    val dividendU = in UInt (32 bits)
    val divisorU = in UInt (32 bits)
    val quotient = out Bits (32 bits)
    val quotientS = out SInt (32 bits)
    val remainder = out Bits (32 bits)
    val remainderS = out SInt (32 bits)
    val valid = in Bool ()
    val ready = out Bool ()
    val operation = in(DivOperation())
  }
  val divUnit = new DivUnit()
  divUnit.io.dividend := io.operation.mux[Bits](
    DivOperation.div -> io.dividend.asBits,
    DivOperation.rem -> io.dividend.asBits,
    DivOperation.divu -> io.dividendU.asBits,
    DivOperation.remu -> io.dividendU.asBits
  )
  divUnit.io.divisor := io.operation.mux[Bits](
    DivOperation.div -> io.divisor.asBits,
    DivOperation.rem -> io.divisor.asBits,
    DivOperation.divu -> io.divisorU.asBits,
    DivOperation.remu -> io.divisorU.asBits
  )
  io.quotient := divUnit.io.quotient
  io.quotientS := divUnit.io.quotient.asSInt
  io.remainder := divUnit.io.remainder
  io.remainderS := divUnit.io.remainder.asSInt
  divUnit.io.valid := io.valid
  io.ready := divUnit.io.ready
  divUnit.io.operation := io.operation
}
