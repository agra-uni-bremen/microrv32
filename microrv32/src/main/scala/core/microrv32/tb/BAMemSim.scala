package core.microrv32.tb

import spinal.core._
import spinal.sim._
import spinal.core.sim._
import scala.math._
import core.microrv32.ByteAddressableMemory

object BAMemSim {

  var simEndTime : BigInt = 0

  def main(args: Array[String]) {

    val memPath = "src/main/ressource/BAMem/BAMem_test_init_1.hex"
    SimConfig
      .withConfig(
        SpinalConfig(
          defaultClockDomainFrequency=FixedFrequency(12 MHz)
        )
      )
      .withWave
      .compile{
        val top = new ByteAddressableMemory(wordCount = 32,memPath)
        top
      }        
      .doSim{
        dut =>
        def read(addr : BigInt, size : BigInt) : BigInt = {
          var rdval : BigInt = 0
          dut.io.sb.SBaddress #= addr
          dut.io.sb.SBvalid #= true
          dut.io.sb.SBwdata #= 0
          dut.io.sb.SBwrite #= false
          dut.io.sb.SBsize #= size
          dut.clockDomain.waitRisingEdge()
          dut.io.sb.SBaddress #= 0
          dut.io.sb.SBvalid #= false
          rdval = dut.io.sb.SBrdata.toBigInt
          dut.clockDomain.waitRisingEdge()
          rdval
        }
        def write(addr : BigInt, value : BigInt, size : BigInt){
          dut.io.sb.SBaddress #= addr
          dut.io.sb.SBvalid #= true
          dut.io.sb.SBwdata #= value
          dut.io.sb.SBwrite #= true
          dut.io.sb.SBsize #= size
          dut.clockDomain.waitRisingEdge()
          dut.io.sb.SBvalid #= false
          dut.io.sb.SBwrite #= false
          dut.io.sb.SBsize #= 4
          dut.io.sb.SBaddress #= 0
          dut.io.sb.SBwdata #= 0
          dut.clockDomain.waitRisingEdge()
        }

        dut.clockDomain.forkStimulus(period = 83)
        var dutRunning = true
        var simSteps : BigInt = 0
        var maxsimSteps : BigInt = 10
        // starting values
        dut.io.sb.SBaddress #= 0
        dut.io.sb.SBvalid #= false
        dut.io.sb.SBwdata #= 0
        dut.io.sb.SBwrite #= false
        dut.io.sb.SBsize #= 4
        dut.io.sel #= true
        dut.clockDomain.waitRisingEdge()
        simSteps = 0
        while(simSteps <= maxsimSteps){
          read(simSteps, 4)
          dut.clockDomain.waitRisingEdge()
          read(simSteps, 2)
          read(simSteps+2, 2)
          dut.clockDomain.waitRisingEdge()
          read(simSteps, 1)
          read(simSteps+1, 1)
          read(simSteps+2, 1)
          read(simSteps+3, 1)
          dut.clockDomain.waitRisingEdge()
          simSteps += 4
        }
        simSteps = 0
        while(simSteps <= maxsimSteps){
          write(4*simSteps, (0x0d0c0b0a & (BigInt(1) << 32) - 1), 4)
          dut.clockDomain.waitRisingEdge()
          simSteps += 1
        }
        simSteps = 0
        while(simSteps <= maxsimSteps){
          read(simSteps, 4)
          dut.clockDomain.waitRisingEdge()
          read(simSteps, 2)
          read(simSteps+2, 2)
          dut.clockDomain.waitRisingEdge()
          read(simSteps, 1)
          read(simSteps+1, 1)
          read(simSteps+2, 1)
          read(simSteps+3, 1)
          dut.clockDomain.waitRisingEdge()
          simSteps += 4
        }
      }
  }
}