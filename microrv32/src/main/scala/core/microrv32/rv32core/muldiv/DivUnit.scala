package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.lib._
import scala.math._

object DivOperation extends SpinalEnum {
  val div, divu, rem, remu = newElement()
}

/*
* Division unit
* Takes divisor, dividend and operation (to distinguish signed and unsigned operations)
* next to control signals to generate the quotient and remainder of the divisor and dividend.
* This division unit works on fixed 32 bit width and is meant for the use in 
* RISC-V, as the corner cases/exception handling is done as specified in the 
* RISC-V specification.
* The division unit implements a unsigned integer division algorithm which produces
* both quotient and remainder at the same time and calculates the bits sequentially.
* For sign handling some additional pre- and post-processing of sign bits and representations
* are done.
*/
class DivUnit extends Component {
  val io = new Bundle {
    val divisor = in Bits(32 bits)
    val dividend = in Bits(32 bits)
    val quotient = out Bits(32 bits)
    val remainder = out Bits(32 bits)
    val valid = in Bool()
    val ready = out Bool()
    val busy = out Bool()
    val operation = in(DivOperation())
  }
  /*
  * For the long division there are many algorithms available.
  *
  * Divide N(umerator) by D(enominator), placing quotient in Q, remainder in R,
  * Equation holds 
  *     Dividend = Quotient * Divisor + Remainder
  *     or
  *     Numerator = Quotient * Denominator + Remainder
  * See the https://en.wikipedia.org/wiki/Division_algorithm#Integer_division_(unsigned)_with_remainder
  * 
  * if D = 0 then error(DivisionByZeroException) end
  * Q := 0                  -- Initialize quotient and remainder to zero
  * R := 0                     
  * for i := n − 1 .. 0 do  -- Where n is number of bits in N
  *   R := R << 1           -- Left-shift R by 1 bit
  *   R(0) := N(i)          -- Set the least-significant bit of R equal to bit i of the numerator
  *   if R >= D then
  *     R := R − D
  *     Q(i) := 1
  *   end
  * end
  * 
  * This division algorithm generates one remainder/quotient bit per cycle. 
  * Thus taking 32 cycles for the calculation alone. 
  * Exceptions are calculated faster (divison by zero and overflow cases).
  */

  // control unit
  val ctrl = new DivUnitControl()
  ctrl.io.valid := io.valid
  io.ready := ctrl.io.ready
  io.busy := ctrl.io.busy

  // regs
  val dividendReg = Reg(UInt(32 bits)) init (0) // numerator
  val divisorReg = Reg(UInt(32 bits)) init (0) // denominator
  val remainderReg = Reg(UInt(32 bits)) init (0)
  val quotientReg = Reg(UInt(32 bits)) init (0)
  val op = Reg(DivOperation()) init(DivOperation.div)

  // wires
  // signhandling wires
  val dividendTC = io.dividend(31) ? (~io.dividend.asUInt + 1).asBits | io.dividend.asBits
  val divisorTC = io.divisor(31) ? (~io.divisor.asUInt + 1).asBits | io.divisor.asBits
  // R := R << 1
  // R[0] := dividend[i]
  val tmpRem1 = (remainderReg(30 downto 0) ## dividendReg(ctrl.io.iterationBit)).asUInt
  // R >= D?
  val RgtD = tmpRem1 >= divisorReg
  // (if R >= D) R := R - D
  val tmpRem2 = tmpRem1 - divisorReg
  // (if R >= D) Q[i] := 1
  val tmpQuo1 = quotientReg | (U(1, 32 bits) |<< ctrl.io.iterationBit)
  val isSignedOperation = (io.operation === DivOperation.div | io.operation === DivOperation.rem)
  val isDivisionByZero = io.divisor === 0
  val isOverflow = isSignedOperation & (io.dividend.asSInt === (-Math.pow(2,32-1).toLong)) & (io.divisor.asSInt === -1)
  val isCornerCase = isDivisionByZero | isOverflow
  ctrl.io.isCornerCase := isCornerCase

  val divide = new Area {
    when(ctrl.io.loadValues) {
      dividendReg := io.operation.mux[UInt](
        DivOperation.div -> U(dividendTC, 32 bits),
        DivOperation.divu -> io.dividend.asUInt,
        DivOperation.rem -> U(dividendTC, 32 bits),
        DivOperation.remu -> io.dividend.asUInt
      )
      divisorReg := io.operation.mux[UInt](
        DivOperation.div -> U(divisorTC, 32 bits),
        DivOperation.divu -> io.divisor.asUInt,
        DivOperation.rem -> U(divisorTC, 32 bits),
        DivOperation.remu -> io.divisor.asUInt
      )
      remainderReg := U(0, 32 bits)
      quotientReg := U(0, 32 bits)
      op := io.operation
    }.elsewhen(ctrl.io.setCornerValues){
      // handle exception cases defined by the RISC-V specification
      // division by zero
      when(isDivisionByZero){
        when(isSignedOperation){
          quotientReg := S(-1, 32 bits).asUInt
          remainderReg := io.dividend.asUInt
        }.otherwise{
          quotientReg := U(Math.pow(2,32).toLong-1, 32 bits)
          remainderReg := io.dividend.asUInt
        }
      }.elsewhen(isOverflow){
        // overflow case 
        quotientReg := S((-Math.pow(2,32-1).toLong), 32 bits).asUInt
        remainderReg := U(0, 32 bits)
      }
    }.elsewhen(ctrl.io.calculate) {
      // if(R>=D) save the difference with D, else just the non-conditional steps
      remainderReg := RgtD.mux[UInt](
        True -> tmpRem2,
        False -> tmpRem1
      )
      // also set the quotient bit to 1 for that iteration step/bit
      when(RgtD){
        // quotientReg := tmpQuo1
        quotientReg(ctrl.io.iterationBit) := True
      }
    }
  }

  // additional pre and post sign handling for operations using signed values
  val signHandling = new Area {
    /*
    * Signs are produced by these cases
    * N(+) : D(+) = Q(+), R(+)
    * N(+) : D(-) = Q(-), R(+)
    * N(-) : D(+) = Q(-), R(-)
    * N(-) : D(-) = Q(+), R(-)
    */
    val quotientSign = Reg(Bits(1 bits)) init (0)
    val remainderSign = Reg(Bits(1 bits)) init (0)
    val dividendSign = io.dividend(31 downto 31)
    val divisorSign = io.divisor(31 downto 31)
    val signSet = Reg(Bool) init(False)
    when(ctrl.io.loadValues) {
      quotientSign := 0
      remainderSign := 0
      when(isSignedOperation){
        quotientSign := dividendSign ^ divisorSign
        remainderSign := dividendSign
        signSet := True
      }
    }
    when(ctrl.io.isCornerCase){
      quotientSign := 0
      remainderSign := 0
      signSet := False
    }
  }

  val resultQuotient = op.mux[Bits](
    DivOperation.div -> ((signHandling.quotientSign === 1) ? (~quotientReg + 1).asBits | quotientReg.asBits),
    DivOperation.divu -> quotientReg.asBits,
    DivOperation.rem -> ((signHandling.quotientSign === 1) ? (~quotientReg + 1).asBits | quotientReg.asBits),
    DivOperation.remu -> quotientReg.asBits
  )
  val resultRemainder = op.mux[Bits](
    DivOperation.div -> ((signHandling.remainderSign === 1) ? (~remainderReg + 1).asBits | remainderReg.asBits),
    DivOperation.divu -> remainderReg.asBits,
    DivOperation.rem -> ((signHandling.remainderSign === 1) ? (~remainderReg + 1).asBits | remainderReg.asBits),
    DivOperation.remu -> remainderReg.asBits
  )
  io.quotient := io.ready ? resultQuotient | 0
  io.remainder := io.ready ? resultRemainder | 0
}
