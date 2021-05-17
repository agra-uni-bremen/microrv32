package core.microrv32.tb

import spinal.core._
import spinal.sim._
import spinal.core.sim._
import scala.math._
import core.microrv32.RVCLIC
import core.microrv32.SimpleBus

object RVCLICTopSim {

  var simEndTime : BigInt = 0

  def main(args: Array[String]) {

    SimConfig
      .withConfig(
        SpinalConfig(
          defaultClockDomainFrequency=FixedFrequency(12 MHz)
        )
      )
      .withWave
      .compile{
        val top = new RVCLIC()
        top
      }        
      .doSim{
        dut =>
        def read(addr : Int):Bits = {
          dut.io.sb.SBaddress #= addr
          dut.io.sb.SBvalid #= true
          dut.io.sb.SBwdata #= 0
          dut.io.sb.SBwrite #= false
          dut.clockDomain.waitRisingEdge()
          dut.io.sb.SBaddress #= 0
          dut.io.sb.SBvalid #= true
          dut.io.sb.SBrdata
        }
        def write(addr : Int, value : Int){
          dut.io.sb.SBaddress #= addr
          dut.io.sb.SBvalid #= true
          dut.io.sb.SBwdata #= value
          dut.io.sb.SBwrite #= true
          dut.clockDomain.waitRisingEdge()
          dut.io.sb.SBvalid #= false
          dut.clockDomain.waitRisingEdge()
        }

        dut.clockDomain.forkStimulus(period = 83)
        var dutRunning = false
        var simSteps : Int = 0
        var maxsimSteps : Int = 300
        var newIrq = true
        var oldCmpVal : Int = 0x0000003F
        var newCmpVal : Int = oldCmpVal + 20
        // starting values
        dut.io.sb.SBaddress #= 0
        dut.io.sb.SBvalid #= false
        dut.io.sb.SBwdata #= 0
        dut.io.sb.SBwrite #= false
        dut.io.sb.SBsize #= 4
        dut.io.sel #= true
        dut.clockDomain.waitRisingEdge()
        write(0x4000, oldCmpVal)
        while(simSteps <= maxsimSteps){
          //Wait a rising edge on the clock
          dut.clockDomain.waitRisingEdge()
          if(dut.io.irq.toBoolean && simSteps > 0x20 && newIrq){
            newIrq = false
            write(0x4000, newCmpVal)
          }
          simSteps += 1
        }
      }
  }
}