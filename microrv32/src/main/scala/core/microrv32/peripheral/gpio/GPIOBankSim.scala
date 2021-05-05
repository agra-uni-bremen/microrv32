package core.microrv32.peripheral.gpiobank

import spinal.core._
import spinal.sim._
import spinal.core.sim._
import scala.math._

object GPIOBankSim {

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
        var maxsimSteps : Int = 100
        
        var gpioOutVar : Int = 0
        var gpioOutput : Int = 0
        var gpioInVar : Int = 0
        var gpioInput : BigInt = 0

        // starting values
        dut.io.sb.SBaddress #= 0
        dut.io.sb.SBvalid #= false
        dut.io.sb.SBwdata #= 0
        dut.io.sb.SBwrite #= false
        dut.io.sb.SBsize #= 4
        dut.io.sel #= false
        
        dut.io.gpio.read #= 0

        // T1: write all values to output reg with all pins enabled 
        dut.clockDomain.waitRisingEdge()
        println("T1: write all values to output reg with all pins enabled")
        write(0, 0x000000FF)
        for(i <- 0x00 to 0xff)
        {
          gpioOutVar = i
          dut.clockDomain.waitRisingEdge()
          write(4, gpioOutVar)
          dut.clockDomain.waitRisingEdge()
          gpioOutput = dut.io.gpio.write.toInt & dut.io.gpio.writeEnable.toInt
          if(gpioOutput != i)
          {
            printf("T1: GPIO Output not correct @ %h\n", i)
          }
          dut.clockDomain.waitRisingEdge()
        }

        // T2: write all values to output reg with masked output enable
        dut.clockDomain.waitRisingEdge()
        println("T2: write all values to output reg with masked output enable")
        write(0, 0x00000055)
        for(i <- 0x00 to 0xff)
        {
          gpioOutVar = i & 0x55
          dut.clockDomain.waitRisingEdge()
          write(4, gpioOutVar)
          dut.clockDomain.waitRisingEdge()
          gpioOutput = dut.io.gpio.write.toInt & dut.io.gpio.writeEnable.toInt
          if(gpioOutput != (i & 0x55))
          {
            printf("T2: GPIO Output not correct @ %h\n", i)
          }
          dut.clockDomain.waitRisingEdge()
        }
        
        // T3: write all values to output reg with no output enabled
        dut.clockDomain.waitRisingEdge()
        println("T3: write all values to output reg with no output enabled")
        write(0, 0x00000000)
        write(4, 0x00000000)
        for(i <- 0x00 to 0xff)
        {
          gpioOutVar = i & 0xff
          dut.clockDomain.waitRisingEdge()
          write(4, gpioOutVar)
          dut.clockDomain.waitRisingEdge()
          gpioOutput = dut.io.gpio.write.toInt & dut.io.gpio.writeEnable.toInt
          if(gpioOutput != (i & 0x00))
          {
            printf("T3: GPIO Output not correct @ %h\n", i)
          }
          dut.clockDomain.waitRisingEdge()
        }

        // T4: read in values through gpio and compare input register with input (all pins read)
        dut.clockDomain.waitRisingEdge()
        println("T4: read in values through gpio and compare input register with input")
        write(0, 0x00000000)
        var readMask = 0xff
        for(i <- 0x00 to 0xff)
        {
          gpioInVar = i & readMask
          dut.io.gpio.read #= gpioInVar
          dut.clockDomain.waitRisingEdge()
          dut.clockDomain.waitRisingEdge()
          gpioInput = read(8).toBigInt & 0xff
          // dut.clockDomain.waitRisingEdge()
          if((gpioInput & readMask) != gpioInVar)
          {
            printf("T4: GPIO Input not correct @ %h\n", i)
          }
          dut.clockDomain.waitRisingEdge()
        }

        // T5: read in values through gpio and compare input register with input (masked enable)
        dut.clockDomain.waitRisingEdge()
        println("T5: read in values through gpio and compare input register with input (masked enable)")
        write(0, 0x00000000)
        readMask = 0xAA
        for(i <- 0x00 to 0xff)
        {
          gpioInVar = i & readMask
          dut.io.gpio.read #= gpioInVar
          dut.clockDomain.waitRisingEdge()
          dut.clockDomain.waitRisingEdge()
          gpioInput = read(8).toBigInt & 0xff
          // dut.clockDomain.waitRisingEdge()
          if((gpioInput & readMask) != gpioInVar)
          {
            printf("T5: GPIO Input not correct @ %h\n", i)
          }
          dut.clockDomain.waitRisingEdge()
        }

        // while(simSteps <= maxsimSteps){
        //   //Wait a rising edge on the clock
        //   dut.clockDomain.waitRisingEdge()
        //   simSteps += 1
        // }

        dut.clockDomain.waitRisingEdge()
      }
  }
}