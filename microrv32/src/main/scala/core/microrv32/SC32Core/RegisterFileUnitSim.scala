package SC_RV32I.Core

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import java.io._
import scala.io.Source
import scala.collection.mutable.ArrayBuffer
import scala.util.Random

object RFSim {
  def main(args: Array[String]) {
    SimConfig.withFstWave.doSim(new RV32RegisterFile(5, 32, 32)){dut => 

        dut.clockDomain.forkStimulus(period = 10)

        //input signal initialization
        dut.clockDomain.waitRisingEdge()
        dut.io.rs1 #= 0
        dut.io.rs2 #= 0
        dut.io.wrEna #= false
        dut.io.rd #= 0
        dut.io.rdData #= 0

        //testing the asynchronous read and synchronous write
        dut.clockDomain.waitRisingEdge()
        dut.io.wrEna #= true
        dut.io.rs1 #= 1
        dut.io.rd #= 1
        dut.io.rdData #= 15
        sleep(5)
        dut.io.rdData #= 8
        sleep(10)
        dut.io.rdData #= 3
        dut.clockDomain.waitRisingEdge(3)
    }
}
}