package core.microrv32.rv32core.muldiv

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.util.Random
import javax.net.ssl.TrustManager


//MulUnit's testbench
object MulUnitSim {
  def main(args: Array[String]) {
    SimConfig.doSim(new MulUnitTBTop){dut =>
      def RndNextSInt32():Int = {
        (-Math.pow(2,31).toInt + Random.nextInt( Math.pow(2,31).toInt-1 ))
      }
      def RndNextUInt32():Int = {
        (Random.nextInt(Math.pow(2,32).toInt))
      }
      def applyMulTestCase(a:Long,b:Long) = {
        // var prd = 0l
        // printf("a = %d, b = %d\n",a,b)
        dut.io.operation #= MulOperation.mul
        dut.io.multiplicand #= a
        dut.io.multiplier #= b
        dut.io.multiplicandU #= 0
        dut.io.multiplierU #= 0
        dut.io.valid #= true
        dut.clockDomain.waitRisingEdge()
        dut.io.valid #= false
      }
      def applyMulSUTestCase(a:Long,b:Long) = {
        // var prd = 0l
        // printf("a = %d, b = %d\n",a,b)
        dut.io.operation #= MulOperation.mulhsu
        dut.io.multiplicand #= a
        dut.io.multiplier #= 0
        dut.io.multiplicandU #= 0
        dut.io.multiplierU #= b
        dut.io.valid #= true
        dut.clockDomain.waitRisingEdge()
        dut.io.valid #= false
      }
      def applyMulHUTestCase(a:Long,b:Long) = {
        // var prd = 0l
        // printf("a = %d, b = %d\n",a,b)
        dut.io.operation #= MulOperation.mulhu
        dut.io.multiplicand #= 0
        dut.io.multiplier #= 0
        dut.io.multiplicandU #= a
        dut.io.multiplierU #= b
        dut.io.valid #= true
        dut.clockDomain.waitRisingEdge()
        dut.io.valid #= false
      }

      dut.io.operation #= MulOperation.mul
      dut.io.multiplicand #= 0
      dut.io.multiplier #= 0
      dut.io.multiplicandU #= 0
      dut.io.multiplierU #= 0
      dut.io.valid #= false
    
      dut.clockDomain.forkStimulus(period = 10)
      dut.clockDomain.waitRisingEdge()

      // fixed test case, 4*3 = 12?
      var a = 3l
      var b = 4l
      applyMulTestCase(a,b)

      // random test cases
      // printf("test# \t\t a * b\t\t\t=>\texpected: a*b \t\t\tretrieved: io.result\n")
      var N = 1 // number of random test cases for each test
      printf("Starting random test (unconstrained) with N = %d @SimTime= %d\n", N, simTime())
      
      println("START: MUL, MULH Test (Signed * Signed)")
      for(idx <- 0 to N){
        a = RndNextSInt32().toLong
        b = RndNextSInt32().toLong
        applyMulTestCase(a,b)
        waitUntil(dut.io.ready.toBoolean)
        assert(
          assertion = (a*b == dut.io.product.toLong),
          message = "FAIL: a*b = " + a.toString + " * " + b.toString + " didnt result in " + (a*b).toString + " but " + dut.io.product.toLong.toString
        )
        dut.clockDomain.waitRisingEdge()
      }
      println("PASS: MUL, MULH Test (Signed * Signed)")

      println("START: MULHSU Test (Signed * Unsigned)")
      for(idx <- 0 to N){
        a = RndNextSInt32().toLong
        b = RndNextUInt32().toLong
        applyMulSUTestCase(a,b)
        waitUntil(dut.io.ready.toBoolean)
        assert(
          assertion = (a*b == dut.io.product.toLong),
          message = "FAIL: a*b = " + a.toString + " * " + b.toString + " didnt result in " + (a*b).toString + " but " + dut.io.product.toLong.toString
        )
        dut.clockDomain.waitRisingEdge()
      }
      println("PASS: MULHSU Test (Signed * Unsigned)")

      println("START: MULHU Test (Unsigned * Unsigned)")
      for(idx <- 0 to N){
        a = RndNextUInt32().toLong
        b = RndNextUInt32().toLong
        applyMulHUTestCase(a,b)
        waitUntil(dut.io.ready.toBoolean)
        assert(
          assertion = (a*b == dut.io.product.toLong),
          message = "FAIL: a*b = " + a.toString + " * " + b.toString + " didnt result in " + (a*b).toString + " but " + dut.io.product.toLong.toString
        )
        dut.clockDomain.waitRisingEdge()
      }
      println("PASS: MULHU Test (Unsigned * Unsigned)")

      println("Debug testcases")
      a = 0x80000000l
      b = 0xffff8000l
      applyMulSUTestCase(a,b)
      waitUntil(dut.io.ready.toBoolean)
      assert(
        assertion = (a*b == dut.io.product.toLong),
        message = "FAIL: a*b = " + a.toString + " * " + b.toString + " didnt result in " + (a*b).toString + " but " + dut.io.product.toLong.toString
      )
      dut.clockDomain.waitRisingEdge()

      printf("Ending @SimTime= %d\n", N, simTime())
      simSuccess()
    }
  }
}
