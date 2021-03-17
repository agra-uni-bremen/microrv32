package core.microrv32.peripheral.uart

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
        val top = new SBUart()
        top
      }        
      .doSim{
        dut =>

        var startRXDFork : Boolean = false
        var rdRXVal : Long = 0
        var rxOcc : Long = 0
        var rxAlEm : Long = 0
        var rxEm : Long = 0
        val txdDecodeThread = fork {
          val mBaudrate = 115200
          val myBaudPeriod = floor(1e9/mBaudrate).toInt
          // Wait until the design sets the uartPin to true (wait for the reset effect).
          // println("wait 1 at " + simTime())
          waitUntil(dut.io.uart.txd.toBoolean == true)
          while(true) {
            // println("wait 2 at " + simTime())
            waitUntil(dut.io.uart.txd.toBoolean == false)
            // println("sleep 1 at " + simTime())
            sleep(myBaudPeriod/2)
            // println("assert 1 at " + simTime())
            assert(dut.io.uart.txd.toBoolean == false)
            sleep(myBaudPeriod)
            var buffer = 0
            for(bitId <- 0 to 7) {
              if(dut.io.uart.txd.toBoolean)
                buffer |= 1 << bitId
              sleep(myBaudPeriod)
            }
            assert(dut.io.uart.txd.toBoolean == true)
            print(buffer.toChar)
          }
        }
        val rxdEncodeThread = fork {
          val mBaudrate = 115200
          val myBaudPeriod = floor(1e9/mBaudrate).toInt
          dut.io.uart.rxd #= true
          val charsToSend = "hello\n"
          while(!startRXDFork){
            sleep(2* myBaudPeriod)
          }
          for(buf <- charsToSend){
            dut.io.uart.rxd #= false
              sleep(myBaudPeriod)

              for(bitId <- 0 to 7) {
                dut.io.uart.rxd #= ((buf >> bitId) & 1) != 0
                sleep(myBaudPeriod)
              }
              dut.io.uart.rxd #= true
              sleep(myBaudPeriod)
          }
        }

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
        def waitBaud(baudPeriod : Long, baseFreq : Long){
          var waitCnt = floor(baseFreq / baudPeriod).toInt
          for(i <- 0 to waitCnt-1){
            dut.clockDomain.waitRisingEdge()
          }
        }
        def getBit(num:Int, i:Int) : Boolean = ((num & (1 << i)) != 0)
        def encUART(value : Int, pin : Bool, baudPeriod : Long){
          pin #= true
          dut.clockDomain.waitRisingEdge()
          pin #= false
          waitBaud(baudPeriod, 12000000)
          for(i <- 0 to 7){
            pin #= getBit(value, i)
            waitBaud(baudPeriod, 12000000)
          }
          pin #= true
          waitBaud(baudPeriod, 12000000)
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
        write(0, 0x0000000A)
        write(4, 0x00000001)        
        while(simSteps <= maxsimSteps){
          //Wait a rising edge on the clock
          dut.clockDomain.waitRisingEdge()
          simSteps += 1
        }
        read(4)
        dut.clockDomain.waitRisingEdge()
        dut.clockDomain.waitRisingEdge()
        dut.clockDomain.waitRisingEdge()
        dut.clockDomain.waitRisingEdge()
        dut.clockDomain.waitRisingEdge()
        dut.clockDomain.waitRisingEdge()
        // encUART(42,dut.io.uart.rxd, 115200)
        dut.clockDomain.waitRisingEdge()
        dut.clockDomain.waitRisingEdge()
        //read(8)
        dut.clockDomain.waitRisingEdge()
        dut.clockDomain.waitRisingEdge()
        // encUART(64,dut.io.uart.rxd, 115200)
        dut.clockDomain.waitRisingEdge()
        // encUART(65,dut.io.uart.rxd, 115200)
        dut.clockDomain.waitRisingEdge()
        //read(8)
        dut.clockDomain.waitRisingEdge()
        //read(8)
        dut.clockDomain.waitRisingEdge()
        for(step  <- 0 to 400){
         dut.clockDomain.waitRisingEdge()
        }
        startRXDFork = true
        for(step  <- 0 to 8000){
         dut.clockDomain.waitRisingEdge()
        }
        startRXDFork = false
        dut.clockDomain.waitRisingEdge()
        rxOcc = read(12).toLong
        println("occupancy: " + rxOcc)
        dut.clockDomain.waitRisingEdge()
        rxAlEm = read(16).toLong
        println("almost empty: " + rxAlEm)
        dut.clockDomain.waitRisingEdge()
        rxEm = read(20).toLong
        println("empty: " + rxEm)
        dut.clockDomain.waitRisingEdge()
        for(i <- 0 to (rxOcc.toInt - 1)){
          rxOcc = read(12).toLong
          println("before read occupancy: " + rxOcc)
          dut.clockDomain.waitRisingEdge()
          rdRXVal = read(8).toLong
          println("rx char: " + rdRXVal.toChar + " (hex: " + rdRXVal.toHexString + ")")
          dut.clockDomain.waitRisingEdge()
          rxOcc = read(12).toLong
          println("after read occupancy: " + rxOcc)
          dut.clockDomain.waitRisingEdge()
        }
        rxOcc = read(12).toLong
        println("occupancy: " + rxOcc)
        dut.clockDomain.waitRisingEdge()
        rxAlEm = read(16).toLong
        println("almost empty: " + rxAlEm)
        dut.clockDomain.waitRisingEdge()
        rxEm = read(20).toLong
        println("empty: " + rxEm)
        dut.clockDomain.waitRisingEdge()
      }
  }
}