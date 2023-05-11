package core.microrv32

import core.microrv32.peripheral.GPIOLED
import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.util.Random

object GPIOLEDSim {
  def main(args: Array[String]) {
    SimConfig
      .withWave
      .compile(new GPIOLED())
      .doSim{dut =>
        //Fork a process to generate the reset and the clock on the dut
        dut.clockDomain.forkStimulus(period = 10)
        // def read(addr : Int):Bits = {
        //   dut.io.sb.SBaddress #= addr
        //   dut.io.sb.SBvalid #= true
        //   dut.io.sb.SBwdata #= 0
        //   dut.io.sb.SBwrite #= false

        //   dut.clockDomain.waitRisingEdge()
        //   dut.io.sb.SBaddress #= 0
        //   dut.io.sb.SBvalid #= false
        //   dut.io.sb.SBrdata
        // }
        // def write(addr : Int, value : Int){
        //   dut.io.sb.SBaddress #= addr
        //   dut.io.sb.SBvalid #= true
        //   dut.io.sb.SBwdata #= value
        //   dut.io.sb.SBwrite #= true
        //   dut.clockDomain.waitRisingEdge()
        //   dut.io.sb.SBvalid #= false
        // }
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


        // starting values
        dut.io.sb.SBaddress #= 0
        dut.io.sb.SBvalid #= false
        dut.io.sb.SBwdata #= 0
        dut.io.sb.SBwrite #= false
        dut.io.sb.SBsize #= 4
        dut.io.sel #= true

        // write some values into whole register width, only expect lower 8 bits
        dut.clockDomain.waitRisingEdge()
        write(0, 0x0000FFFF)
        val a = read(0)
        println(a)
        write(0, 0x12340123)
        dut.clockDomain.waitRisingEdge()
        val b = read(0)
        println(b)
        dut.clockDomain.waitRisingEdge()
        dut.clockDomain.waitRisingEdge()
        for(idx <- 0 to 5){
          //Wait a rising edge on the clock
          dut.clockDomain.waitRisingEdge()
        }

      }
  }
}