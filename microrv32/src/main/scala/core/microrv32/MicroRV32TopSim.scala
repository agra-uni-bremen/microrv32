package core.microrv32

import spinal.core._
import spinal.sim._
import scala.math._
import spinal.core.sim._

import scala.util.Random

import java.io._
import scala.io.Source
import scala.collection.mutable.ArrayBuffer

/*
 * Simulation Testbench for MicroRV32Top component
 * Main test environment
 * Can execute rv32ui-p- tests and log results based off given programcounters for <pass> and <fail> lables of the test dumps.
 * Can tell when halting event (halt, pass, fail, error) happened in the vcd waveforms.
 * Otherwise takes a hexdump of the binary (without elf).
 * Has a default maximum steps amount for simulation steps
 */
// TODO further refactoring of this simulation environment, make arguments optional but keep the structure
// for them like it is right now so the rv32ui-p-tests can be run easily when information from it
// is known
// maybe even have a seperate topsim file for the rv32ui tests so they can be run in batch
object MicroRV32TopSim {
  def main(args: Array[String]) {
    // set to true if you want to log riscv-tests simulation results into ./log/rv32ui-p-tests.log
    var logFileEnabled = false

    var reachedEnd = false
    var failPC : BigInt = 0
    var passPC : BigInt = 0
    if(args.length > 1){
      failPC = BigInt(args(1),16)
      passPC = BigInt(args(2),16)
    }
    var simPC : BigInt = 0
    var simEndTime : BigInt = 0
    var cpuHalted = false

    SimConfig
      .withConfig(
        SpinalConfig(
          defaultClockDomainFrequency=FixedFrequency(12 MHz)
        )
      )
      .withWave
      .compile{
        val top = new MicroRV32Top(args(0))
        //make signals public in simulation scope
        top.cpu.pcLogic.programCounter.simPublic()
        top.cpu.controlFSM.newFetch.simPublic()
        top.cpu.io.halted.simPublic()
        top.ram.memRam.simPublic()
        top.clockDomain.reset.simPublic()
        top.uartPeriph.io.uart.rxd.simPublic()
        top
      }        
      .doSim{dut =>

        // Create a new thread for uart decoding to print outout to simulation console
        val txdDecodeThread = fork {
          val mBaudrate = 115200
          val myBaudPeriod = floor(1e9/mBaudrate).toInt
          // Wait until the design sets the uartPin to true (wait for the reset effect).
          waitUntil(dut.io.uart.txd.toBoolean == true)
          while(true) {
            waitUntil(dut.io.uart.txd.toBoolean == false)
            sleep(myBaudPeriod/2)
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

        def readRam(ram : Memory, beginAddr : Int, endAddr : Int) : Array[BigInt] = {
          var ramBytes = new ArrayBuffer[BigInt]
          for(idx <- beginAddr to endAddr){
            ramBytes.append(ram.memRam.getBigInt(idx))
          }
          ramBytes.toArray
        }

        println("Starting simulation")
        //Fork a process to generate the reset and the clock on the dut
        dut.clockDomain.forkStimulus(period = 82)
        var dutRunning = false
        var simSteps : Int = 0
        var maxsimSteps : Int = 2600
        var maxSimstepsReached = false
        var resetRiEdge : Int = 100
        var resetFaEdge : Int = 104

        // reading ram is fairly new addition to spinalhdl and still needs some debugging
        // dut.clockDomain.waitRisingEdge()
        var ramC = dut.ram
        dut.clockDomain.waitRisingEdge()
        // println("memory before 2nd reset at 0x80000000")
        // readRam(ramC,0,158).toList.foreach{ printf("%8x ",_)}
        // print("\n")

        // uart rxd
        val rxdSim : Boolean = true
        dut.io.uart.rxd #= rxdSim
        val t1 = System.nanoTime
        while((simSteps <= maxsimSteps) || dutRunning){
          var k = dut.cpu.pcLogic.programCounter.toBigInt
          var i = dut.cpu.controlFSM.newFetch.toBoolean
          var cpuHalt = dut.cpu.io.halted.toBoolean
          
          dutRunning = !cpuHalt
          // println(simSteps)
          // if(simSteps >= maxsimSteps){
          //   maxSimstepsReached = true
          // }
          
          /*
           * If the programcounter is either the fail or pass pc AND the pc is getting fetched,
           * we reached the pass/fail part of the test and can set the boolean and print
           * our information with timestamp to terminal
           */
          if(k == failPC && !reachedEnd && i){
            reachedEnd = true
            simEndTime = simTime()
            simPC = k
            println("Failed test @ " + simEndTime + "ns")
          }
          if(k == passPC && !reachedEnd && i){
            reachedEnd = true
            simEndTime = simTime()
            simPC = k
            println("Passed test @ " + simEndTime + "ns")
          }
          if(cpuHalt && !reachedEnd){
            reachedEnd = true
            simEndTime = simTime()
            simPC = k
            cpuHalted = cpuHalt
            val t2 = System.nanoTime
            println("Halted @ " + simEndTime + "ns")
            println("SimSteps: " + simSteps)
            println("CPU time: " + (t2-t1) + " ns")

          }
          // if(simSteps >= resetRiEdge && simSteps <= resetFaEdge){
          //   dut.clockDomain.assertReset()
          // }else{
          //   dut.clockDomain.deassertReset()
          // }
          
          //Wait a rising edge on the clock
          dut.clockDomain.waitRisingEdge()
          simSteps += 1
        }
        
        //println("memory after 2nd reset at 0x80000000")
        //readRam(ramC,0,4).toList.foreach{printf("%x ",_)}
        //print("\n")
      
        if(!logFileEnabled){
          //println("3rd reset after full run")
          //dut.clockDomain.assertReset()
          //dut.clockDomain.waitRisingEdge()
          //dut.clockDomain.deassertReset()
          //dut.clockDomain.waitRisingEdge()
          //println("run 600 steps")
          //for(stepsOther <- 0 to 600){
          //  dut.clockDomain.waitRisingEdge()
          //}

          // printf("ram@ %x = %x\n", rAddr, dut.ram.memRam.getBigInt(rAddr))
          // println(readRam(ramC,0,5).toList)
          printf("dut halted: %b\n", dutRunning)
          printf("simulation steps reached: %d\n",simSteps)
        }
    }
    // log the rv32ui-p test results
    if(logFileEnabled){
      val fileName = "./log/rv32ui-p-tests.log"
      val currentTest = org.apache.commons.io.FilenameUtils.getName(args(0))
      val logWriter = new FileWriter(fileName, true)
      try{
        logWriter.append(currentTest + " :\t")
        if(reachedEnd && simPC == passPC){
          logWriter.append("Passed test @\t" + simEndTime + "ns")
        }
        else if(reachedEnd && simPC == failPC){
          logWriter.append("Failed test @\t" + simEndTime + "ns")
        }
        else if(reachedEnd && cpuHalted){
          logWriter.append(("Failed, halted @\t" + simEndTime + "ns"))
        }
        else{
          logWriter.append("no result")
        }
      }
      finally{
        logWriter.append(("\n"))
        logWriter.close()
      } 
    }
  }
}
