package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.util.Random

//DivUnit's testbench
object DivUnitSim {
  def main(args: Array[String]) {
    SimConfig.doSim(new DivUnitTBTop) { dut =>
      def RndNextSInt32(): Int = {
        (-Math.pow(2, 31).toInt + Random.nextInt(Math.pow(2, 31).toInt - 1))
      }
      def RndNextUInt32(): Int = {
        (Random.nextInt(Math.pow(2, 32).toInt))
      }
      def applyDIVTestCase(a: Long, b: Long) = {
        // var prd = 0l
        // printf("a = %d, b = %d\n",a,b)
        dut.io.operation #= DivOperation.div
        dut.io.dividend #= a
        dut.io.divisor #= b
        dut.io.dividendU #= 0
        dut.io.divisorU #= 0
        dut.clockDomain.waitRisingEdge()
        dut.io.valid #= true
        dut.clockDomain.waitRisingEdge()
        dut.io.valid #= false
      }
      def applyDIVUTestCase(a: Long, b: Long) = {
        // var prd = 0l
        // printf("a = %d, b = %d\n",a,b)
        dut.io.operation #= DivOperation.divu
        dut.io.dividend #= 0
        dut.io.divisor #= 0
        dut.io.dividendU #= a
        dut.io.divisorU #= b
        dut.clockDomain.waitRisingEdge()
        dut.io.valid #= true
        dut.clockDomain.waitRisingEdge()
        dut.io.valid #= false
      }

      dut.io.operation #= DivOperation.div
      dut.io.dividend #= 0
      dut.io.divisor #= 0
      dut.io.dividendU #= 0
      dut.io.divisorU #= 0
      dut.io.valid #= false

      dut.clockDomain.forkStimulus(period = 10)
      dut.clockDomain.waitRisingEdge()

      var a = -13l
      var b = 4l
      var aQb = a / b
      var aRb = a % b
      applyDIVTestCase(a, b)
      waitUntil(dut.io.ready.toBoolean)
      // printf("a: %d, b: %d, a/b: %d, aMODb: %d, dut.a/b: %d, dut.aMODb: %d\n", a, b, aQb, aRb, dut.io.quotientS.toLong, dut.io.remainderS.toLong)
      dut.clockDomain.waitRisingEdge()
      dut.clockDomain.waitRisingEdge()
      // random test cases
      // printf(
      //   "test# \t\t a * b\t\t\t=>\texpected: a*b \t\t\tretrieved: io.result\n"
      // )
      var N = 20000 // number of random test cases for each test
      var aliveN = 5000
      printf("Starting random test (unconstrained) with N = %d per Test @SimTime= %d\n", N, simTime())
      println("START: DIV/REM Test (Signed / Signed)")
      for (idx <- 0 to N) {
        a = RndNextSInt32().toLong
        b = RndNextSInt32().toLong
        if(idx%aliveN == 0) printf("ALIVE: Test %d of %d (%f %%)\n", idx, N, (idx.toFloat/N.toFloat)*100.0 )
        // printf("a = %d (%X), b = %d (%X), expect: div = %d (%X), rem = %d (%X)\n", a,a,b,b,(a/b),(a/b),(a%b),(a%b))
        applyDIVTestCase(a, b)
        waitUntil(dut.io.ready.toBoolean)
        if (b != 0 || (a != Math.pow(2, 31) && b != -1)) {
          assert(
            assertion = (dut.io.quotientS.toLong == (a / b) ),
            message =
              "FAIL: a/b = " + a.toString + " / " + b.toString + " didnt result in " + (a / b).toString + " but " + dut.io.quotientS.toLong.toString
          )
          assert(
            assertion = (dut.io.remainderS.toLong == (a % b)),
            message =
              "FAIL: a%b = " + a.toString + " % " + b.toString + " didnt result in " + (a % b).toString + " but " + dut.io.remainderS.toLong.toString
          )
        } else if(b == 0){ // DIVISION BY ZERO
          assert(
            assertion = (dut.io.quotientS.toLong == -1),
            message =
              "FAIL(division by zero): a/b = " + a.toString + " / " + b.toString + " didnt result in " + (a / b).toString + " but " + dut.io.quotientS.toLong.toString
          )
          assert(
            assertion = (dut.io.remainderS.toLong == a),
            message =
              "FAIL(division by zero): a%b = " + a.toString + " % " + b.toString + " didnt result in " + (a % b).toString + " but " + dut.io.remainderS.toLong.toString
          )
        } else if(a == Math.pow(2,31).toInt && b == -1){ // OVERFLOW
          assert(
            assertion = (dut.io.quotientS.toLong == -Math.pow(2,31).toInt),
            message =
              "FAIL(overflow): a/b = " + a.toString + " / " + b.toString + " didnt result in " + (a / b).toString + " but " + dut.io.quotient.toLong.toString
          )
          assert(
            assertion = (dut.io.remainder.toLong == 0),
            message =
              "FAIL(overflow): a%b = " + a.toString + " % " + b.toString + " didnt result in " + (a % b).toString + " but " + dut.io.remainder.toLong.toString
          )
        }
        dut.clockDomain.waitRisingEdge()
      }
      println("PASS: DIV/REM Test (Signed / Signed and Signed % Signed)")
      println("START: DIVU/REMU Test (Unsigned / Unsigned and Unsigned % Unsigned)")
      for (idx <- 0 to N) {
        a = RndNextUInt32().toLong
        b = RndNextUInt32().toLong
        if(idx%aliveN == 0) printf("ALIVE: Test %d of %d (%f %%)\n", idx, N, (idx.toFloat/N.toFloat)*100.0 )
        // if(idx%aliveN == 0) printf("ALIVE: Test %d of %d", idx, N)        // printf("a = %d (%X), b = %d (%X), expect: div = %d (%X), rem = %d (%X)\n", a,a,b,b,(a/b),(a/b),(a%b),(a%b))
        applyDIVTestCase(a, b)
        waitUntil(dut.io.ready.toBoolean)
        if (b != 0) {
          assert(
            assertion = (dut.io.quotientS.toLong == (a / b) ),
            message =
              "FAIL: a/b = " + a.toString + " / " + b.toString + " didnt result in " + (a / b).toString + " but " + dut.io.quotientS.toLong.toString
          )
          assert(
            assertion = (dut.io.remainderS.toLong == (a % b)),
            message =
              "FAIL: a%b = " + a.toString + " % " + b.toString + " didnt result in " + (a % b).toString + " but " + dut.io.remainderS.toLong.toString
          )
        } else if(b == 0){ // DIVISION BY ZERO
          assert(
            assertion = (dut.io.quotientS.toLong == (Math.pow(2,32).toInt-1)),
            message =
              "FAIL(division by zero): a/b = " + a.toString + " / " + b.toString + " didnt result in " + (a / b).toString + " but " + dut.io.quotientS.toLong.toString
          )
          assert(
            assertion = (dut.io.remainderS.toLong == a),
            message =
              "FAIL(division by zero): a%b = " + a.toString + " % " + b.toString + " didnt result in " + (a % b).toString + " but " + dut.io.remainderS.toLong.toString
          )
        }
        dut.clockDomain.waitRisingEdge()
      }
      println("PASS: DIVU/REMU Test (Unsigned / Unsigned and Unsigned % Unsigned)")
      

      printf("Ending N=%d random test cases per test @SimTime= %d\n", N, simTime())
      simSuccess()
    }
  }
}
