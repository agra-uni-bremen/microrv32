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

      dut.io.operation #= MulOperation.mul
      dut.io.multiplicand #= 0
      dut.io.multiplier #= 0
      dut.io.valid #= false
    
      dut.clockDomain.forkStimulus(period = 10)
      dut.clockDomain.waitRisingEdge()

      // fixed test case, 4*3 = 12?
      var product = 0l
      var a = 3l
      var b = 4l
      dut.io.operation #= MulOperation.mul
      dut.io.multiplicand #= a
      dut.io.multiplier #= b
      dut.io.valid #= true
      dut.clockDomain.waitRisingEdge()
      dut.io.valid #= false
      dut.clockDomain.waitRisingEdge()
      waitUntil(dut.io.ready.toBoolean)
      assert(dut.io.product.toBigInt == 12)
      dut.clockDomain.waitRisingEdge()
      // random test cases
      // printf("test# \t\t a * b\t\t\t=>\texpected: a*b \t\t\tretrieved: io.result\n")
      var N = 300 // number of random test cases
      printf("Starting random test (unconstrained) with N = %d @SimTime= %d\n", N, simTime())
      for(idx <- 0 to N){
        a = RndNextSInt32().toLong
        b = RndNextSInt32().toLong
        dut.io.multiplicand #= a
        dut.io.multiplier #= b
        dut.io.valid #= true
        dut.clockDomain.waitRisingEdge()
        dut.io.valid #= false
        // dut.clockDomain.waitRisingEdge()
        waitUntil(dut.io.ready.toBoolean)
        product = dut.io.product.toLong
        // printf("%7d \t %11d * %11d\t=>\texpected: %d \tretrieved: %d\n", idx, a, b, a*b, product)
        assert(
          assertion = (a*b == product),
          message = "a*b = " + a.toString + " * " + b.toString + " didnt result in " + (a*b).toString + " but " + product.toString
        )
        dut.clockDomain.waitRisingEdge()
        // if(idx % 30000 == 0) printf("Ping, idx=%d, simTime()=%d\n", idx, simTime())
      }
      printf("Ending @SimTime= %d\n", N, simTime())
      simSuccess()
    }
  }
}
