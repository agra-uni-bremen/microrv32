package SC_RV32I

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import java.io._
import scala.io.Source
import scala.collection.mutable.ArrayBuffer
import scala.util.Random

object InstTestSim {
  def main(args: Array[String]) {

    var hexFilePath = args(0)
    var memSize = Source.fromFile(hexFilePath).getLines.size
    println("Argument passed: " + hexFilePath)
    SimConfig.withFstWave.doSim(new test_InstTop(hexFilePath,memSize)){dut =>
    
      dut.clockDomain.forkStimulus(period = 10)

      //initiation
      dut.clockDomain.waitRisingEdge()
      dut.io.address #= 0
      dut.clockDomain.waitRisingEdge()

      //Fetching address
      var min = 0x80000000l
      for (i <- 0 until 12) {
        dut.io.address #= min + i*4
        dut.clockDomain.waitRisingEdge()
      }

      dut.clockDomain.waitRisingEdge(5)
      

    }}
}