package core.microrv32.peripheral

import spinal.core._
import spinal.sim._
import spinal.core.sim._
import scala.math._

object SBShutdownSim {

  var simEndTime : BigInt = 0

  def main(args: Array[String]) {
    SimConfig
      .withConfig(
        SpinalConfig(
          defaultClockDomainFrequency=FixedFrequency(12 MHz)
        )
      )
      .withFstWave
      .compile{
        val top = new SBShutdown()
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
          dut.clockDomain.waitRisingEdge()
          dut.io.sb.SBaddress #= 0
          dut.io.sel #= false
          dut.io.sb.SBvalid #= false
          dut.io.sb.SBrdata
        }
        def write(addr : Int, value : Int){
          dut.io.sb.SBaddress #= addr
          dut.io.sb.SBvalid #= true
          dut.io.sb.SBwdata #= value
          dut.io.sb.SBwrite #= true
          dut.io.sel #= true
          dut.clockDomain.waitRisingEdge()
          dut.clockDomain.waitRisingEdge()
          dut.io.sb.SBvalid #= false
          dut.io.sel #= false
        }
        def getBit(num:Int, i:Int) : Boolean = ((num & (1 << i)) != 0)

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
        write(0, 0x0000000A)
        dut.clockDomain.waitRisingEdge()
        write(4, 0x00000001)        
        dut.clockDomain.waitRisingEdge()
        read(0)
        write(0, 93)        
        dut.clockDomain.waitRisingEdge()
        write(4, 93)        
        dut.clockDomain.waitRisingEdge()
      }
  }
}