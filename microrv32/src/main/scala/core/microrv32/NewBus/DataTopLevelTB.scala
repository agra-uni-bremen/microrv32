package MEM

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import java.io._
import scala.io.Source
import scala.collection.mutable.ArrayBuffer
import scala.util.Random

object DataTestSim {
  def main(args: Array[String]) {

    var hexFilePath = args(0)
    var memSize = Source.fromFile(hexFilePath).getLines.size
    println("Argument passed: " + hexFilePath)
    SimConfig.withFstWave.doSim(new test_DataTop(hexFilePath,memSize)){dut => 

        dut.clockDomain.forkStimulus(period = 10)

        //initiation
        dut.clockDomain.waitRisingEdge()
        dut.io.request #= false
        dut.io.address #= 0
        dut.io.write #= false
        dut.io.wdata #= 0
        dut.io.size #= 4
        dut.clockDomain.waitRisingEdge()
        var min = 0x80000000l

        //test read
        for (i <- 0 until 3) {
            dut.io.request #= true
            dut.io.write #= false
            dut.io.size #= 1 << i
            dut.io.address #= min + i*4
            dut.clockDomain.waitRisingEdge()
            dut.io.request #= false
            dut.clockDomain.waitRisingEdge()

            if (i ==0 ) {
                dut.io.address #= 0
                dut.io.request #= true
                dut.clockDomain.waitRisingEdge()
                dut.io.request #= false
                dut.clockDomain.waitRisingEdge()
            }
        }

        //test write
        for (i <- 0 until 3) {
            dut.io.request #= true
            dut.io.write #= true
            dut.io.size #= 1 << i
            dut.io.address #= min + i*4
            dut.io.wdata #= Random.nextInt(0xFFFFFFF)
            dut.clockDomain.waitRisingEdge()
            dut.io.request #= false
            dut.clockDomain.waitRisingEdge()

            if (i == 0 ) {
                dut.io.request #= true
                dut.io.address #= 0
                dut.clockDomain.waitRisingEdge()
                dut.io.request #= false
                dut.clockDomain.waitRisingEdge()
            }
        }

        //Verifying the write
        for (i <- 0 until 10) {
            dut.io.request #= true
            dut.io.write #= false
            dut.io.size #= 4
            dut.io.address #= min + i*4
            dut.clockDomain.waitRisingEdge()
            dut.io.request #= false
            dut.clockDomain.waitRisingEdge()
        }

        dut.clockDomain.waitRisingEdge(3)
    }
  }
}