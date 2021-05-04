package core.microrv32.peripheral.gpiobank

import spinal.core._
import spinal.sim._
import spinal.core.sim._
import scala.math._

object SBUartTopSim {

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
        val top = new SBGPIOBank()
        top
      }        
      .doSim{
        dut =>
        def read(addr : Int):Bits = {
          dut.io.sb.SBaddress #= addr
          dut.io.sb.SBvalid #= true
          dut.io.sb.SBwdata #= 0
          dut.io.sb.SBwrite #= false
          dut.io.sel #= true
          dut.clockDomain.waitRisingEdge()
          dut.io.sb.SBaddress #= 0
          dut.io.sb.SBvalid #= true
          dut.io.sel #= false
          dut.clockDomain.waitRisingEdge()
          dut.io.sb.SBrdata
        }
        def write(addr : Int, value : Int){
          dut.io.sb.SBaddress #= addr
          dut.io.sb.SBvalid #= true
          dut.io.sb.SBwdata #= value
          dut.io.sb.SBwrite #= true
          dut.io.sel #= true
          dut.clockDomain.waitRisingEdge()
          dut.io.sb.SBvalid #= false
          dut.io.sel #= false
          dut.clockDomain.waitRisingEdge()
        }
        
        dut.clockDomain.forkStimulus(period = 82)
        var dutRunning = false
        var simSteps : Int = 0
        var maxsimSteps : Int = 1200
        
        // starting values
        dut.io.sb.SBaddress #= 0
        dut.io.sb.SBvalid #= false
        dut.io.sb.SBwdata #= 0
        dut.io.sb.SBwrite #= false
        dut.io.sb.SBsize #= 4
        dut.io.sel #= false
        // dut.io.uart.rxd #= true
        dut.clockDomain.waitRisingEdge()
        
        while(simSteps <= maxsimSteps){
          //Wait a rising edge on the clock
          dut.clockDomain.waitRisingEdge()
          simSteps += 1
        }
        dut.clockDomain.waitRisingEdge()
      }
  }
}