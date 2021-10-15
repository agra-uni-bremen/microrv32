package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._

object MulOperation extends SpinalEnum {
  val mul, mulh, mulhsu, mulhu = newElement()
}

//Hardware definition
class MulUnit extends Component {
  val io = new Bundle {
    val multiplicand = in Bits(32 bits)
    val multiplier = in Bits(32 bits)
    val product = out Bits(64 bits)
    val valid = in Bool
    val ready = out Bool
    val operation = in(MulOperation())
  }
  // control unit
  val ctrl = new MulUnitControl()
  ctrl.io.valid := io.valid
  io.ready := ctrl.io.ready

  // regs
  val op = Reg(MulOperation()) init(MulOperation.mul)
  val mcand = Reg(UInt(32 bits)) init(0)
  val prod = Reg(Bits(64 bits)) init(0)

  // wires
  val partialProduct = Bits(32 bits)
  val mpLSB = prod(0 downto 0)
  val mcandSign = io.multiplicand(31 downto 31)
  val mplierSign = io.multiplier(31 downto 31)
  
  ctrl.io.multiplierLSB := mpLSB
  
  val multiply = new Area {
    // only 31 bit for signed, sign itself is handled later
    val iMcand = (mcandSign === 1) ? (~io.multiplicand.asUInt+1).asBits(30 downto 0) | io.multiplicand(30 downto 0)
    val iMplier = (mplierSign === 1) ? (~io.multiplier.asUInt+1).asBits(30 downto 0) | io.multiplier(30 downto 0)
    val muxedMcand = io.operation.mux(
        MulOperation.mul -> B(0, 1 bits) ## iMcand,
        MulOperation.mulh -> B(0, 1 bits) ## iMcand,
        MulOperation.mulhsu -> B(0, 1 bits) ## iMcand,
        MulOperation.mulhu -> io.multiplicand
    )
    val muxedMplier = io.operation.mux(
        MulOperation.mul -> B(0, 1 bits) ## iMplier,
        MulOperation.mulh -> B(0, 1 bits) ## iMplier,
        MulOperation.mulhsu -> io.multiplier,
        MulOperation.mulhu -> io.multiplier
    )
    val summand = ctrl.io.addMultiplicand.mux(
      True -> mcand,
      False -> U(0, 32 bits)
    )
    partialProduct := (prod(63 downto 32).asUInt + summand ).asBits

    when(ctrl.io.loadValues){
      mcand := muxedMcand.asUInt
      prod := B(B(0, 32 bits) ## muxedMplier.asBits, 64 bits)
      op := io.operation
    }.elsewhen(ctrl.io.calculate){
      prod := (partialProduct ## prod(31 downto 0)) |>> 1
    }
  }

  val signHandling = new Area {
    val prodSign = Reg(Bits(1 bits)) init(0)
    val isSignedOperation = io.operation === MulOperation.mul | io.operation === MulOperation.mulh | io.operation === MulOperation.mulhsu
    val mulSign = mcandSign ^ mplierSign
    when(ctrl.io.loadValues & isSignedOperation){
      prodSign := io.operation.mux[Bits](
        MulOperation.mul -> mulSign,
        MulOperation.mulh -> mulSign,
        MulOperation.mulhsu -> mcandSign,
        MulOperation.mulhu -> 0
      )
    }
  }
  val result = op.mux[Bits](
    MulOperation.mul -> ((signHandling.prodSign === 1) ? (~prod.asUInt+1).asBits | prod),
    MulOperation.mulh -> ((signHandling.prodSign === 1) ? (~prod.asUInt+1).asBits | prod),
    MulOperation.mulhsu -> ((signHandling.prodSign === 1) ? (~prod.asUInt+1).asBits | prod),
    MulOperation.mulhu -> prod
  )
  io.product := io.ready ? result | 0
}
