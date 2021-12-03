package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._

object MulOperation extends SpinalEnum {
  val mul, mulh, mulhsu, mulhu = newElement()
}

/*
* Multiplication unit
* Takes multiplicand and multiplier and operation next to control signals
* to produce the product of the multiplicand and multiplier.
* The multiplication works on a fixed 32 bit width and handles overflows according
* to the RISC-V specification.
* The multiplication uses a shift-add algorithm to calculate a unsigned product.
* Additional pre- and post-processing is done to handle the signs of signed operations.
*/
class MulUnit extends Component {
  val io = new Bundle {
    val multiplicand = in Bits(32 bits)
    val multiplier = in Bits(32 bits)
    val product = out Bits(64 bits)
    val valid = in Bool()
    val ready = out Bool()
    val busy = out Bool()
    val operation = in(MulOperation())
  }
  // control unit
  val ctrl = new MulUnitControl()
  ctrl.io.valid := io.valid
  io.ready := ctrl.io.ready
  io.busy := ctrl.io.busy
  
  // regs
  val op = Reg(MulOperation()) init(MulOperation.mul)
  val mcand = Reg(UInt(33 bits)) init(0)
  val prod = Reg(Bits(65 bits)) init(0)

  // wires
  val partialProduct = Bits(33 bits)
  val mpLSB = prod(0 downto 0)
  val mcandSign = io.multiplicand(31 downto 31)
  val mplierSign = io.multiplier(31 downto 31)
  
  ctrl.io.multiplierLSB := mpLSB
  
  val multiply = new Area {
    // only 31 bit for signed, sign itself is handled later
    val iMcand = (mcandSign === 1) ? (~io.multiplicand.asUInt+1).asBits(31 downto 0) | io.multiplicand(31 downto 0)
    val iMplier = (mplierSign === 1) ? (~io.multiplier.asUInt+1).asBits(30 downto 0) | io.multiplier(30 downto 0)
    val muxedMcand = io.operation.mux(
        MulOperation.mul -> B(0, 1 bits) ## iMcand,
        MulOperation.mulh -> B(0, 1 bits) ## iMcand,
        MulOperation.mulhsu -> B(0, 1 bits) ## iMcand,
        MulOperation.mulhu -> io.multiplicand.resized
    )
    val muxedMplier = io.operation.mux(
        MulOperation.mul -> B(0, 1 bits) ## iMplier,
        MulOperation.mulh -> B(0, 1 bits) ## iMplier,
        MulOperation.mulhsu -> io.multiplier,
        MulOperation.mulhu -> io.multiplier
    )
    // based on the control signal the summand is 0 or the multiplicand (if the corresponding multiplier bit is 0 or 1)
    val summand = ctrl.io.addMultiplicand.mux(
      True -> mcand,
      False -> U(0, 33 bits)
    )
    partialProduct := (prod(63 downto 32).asUInt + summand ).asBits.resized
    // initially set the registers to the values
    when(ctrl.io.loadValues){
      mcand := muxedMcand.asUInt
      prod := B(B(0, 33 bits) ## muxedMplier.asBits, 65 bits)
      op := io.operation
    }.elsewhen(ctrl.io.calculate){
      // add the partial product of this cycle to the upper product register and apply the shift right
      prod := ((partialProduct ## prod(31 downto 0)) >> 1).resized
    }
  }
  // additional sign handling for the corresponding signed operations available in RISC-V
  val signHandling = new Area {
    /*
    * Signs are produced by these cases
    * (+) * (+) = (+)
    * (+) * (-) = (-)
    * (-) * (+) = (-)
    * (-) * (-) = (+)
    * For the mul/mulh operations these rules can be applied.
    * For mulhsu (signed*unsigned) we can just transfer the sign of the multiplicand to our result
    * For the mulhu operation no sign handling is needed.
    */
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
  io.product := io.ready ? result(63 downto 0) | 0
}
