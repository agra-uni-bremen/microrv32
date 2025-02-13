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
    var logFileEnabled = true
    var failPC: BigInt = 0
    var passPC: BigInt = 0

    var reachedEnd = false

    var enaMul = false
    var enaDiv = false
    var enaComp = false

    // some very crude and experimental commandline argument handling
    // if logFileEnabled is set in test bench, the arguments after the binary are the failpc and passpc for automatic check and logging
    // else the argument passed after the binary is the core variant (used for semi-automatic benchmarking)
    // if (logFileEnabled) {
    //   if (args.length > 1) {
    //     failPC = BigInt(args(1), 16)
    //     passPC = BigInt(args(2), 16)
    //   }
    // } else {
      if (args.length > 1) {
        args(1) match {
          case "rv32i"   => { enaMul = false; enaDiv = false; enaComp = false }
          case "rv32im"  => { enaMul = true; enaDiv = true; enaComp = false }
          case "rv32ic"  => { enaMul = false; enaDiv = false; enaComp = true }
          case "rv32imc" => { enaMul = true; enaDiv = true; enaComp = true }
          case _         => { enaMul = false; enaDiv = false; enaComp = false }
        }
        println("enaMul " + enaMul)
        println("enaDiv " + enaDiv)
        println("enaComp " + enaComp)
      }
    // }

    var hexFilePath = args(0)
    var memSize = Source.fromFile(hexFilePath).getLines.size

    var simPC: BigInt = 0
    var simEndTime: BigInt = 0
    var cpuHalted = false

    SimConfig
      .withConfig(
        SpinalConfig(
          defaultClockDomainFrequency = FixedFrequency(12 MHz)
        )
      )
      // .withWave
      .withFstWave
      .compile {
        val top = new MicroRV32Top(
          hexFilePath,
          memSize,
          RV32CoreConfig(
            generateMultiply = enaMul,
            generateDivide = enaDiv,
            generateCompressed = enaComp
          )
        )
        // make signals public in simulation scope
        top.cpu.cpu.programCounter.simPublic()
        top.cpu.cpu.CSRLogic.newFetch.simPublic()
        top.cpu.cpu.CSRLogic.minstret.simPublic() 
        top.cpu.cpu.CSRLogic.mcycle.simPublic()

        // top.cpu.io.halted.simPublic()
        top.ram.memBank0.simPublic()
        top.ram.memBank1.simPublic()
        // top.clockDomain.reset.simPublic()
        // top.uartPeriph.io.uart.rxd.simPublic()
        top.cpu.cpu.regs.regFile.simPublic()

        top
      }
      .doSim { dut =>
        // Create a new thread for uart decoding to print outout to simulation console
        val txdDecodeThread = fork {
          val mBaudrate = 115200
          val myBaudPeriod = floor(1e9 / mBaudrate).toInt
          // Wait until the design sets the uartPin to true (wait for the reset effect).
          waitUntil(dut.io.uart.txd.toBoolean == true)
          while (true) {
            waitUntil(dut.io.uart.txd.toBoolean == false)
            sleep(myBaudPeriod / 2)
            assert(dut.io.uart.txd.toBoolean == false)
            sleep(myBaudPeriod)
            var buffer = 0
            for (bitId <- 0 to 7) {
              if (dut.io.uart.txd.toBoolean)
                buffer |= 1 << bitId
              sleep(myBaudPeriod)
            }
            assert(dut.io.uart.txd.toBoolean == true)
            print(buffer.toChar)
          }
        }

        // def readRam(ram : Memory, beginAddr : Int, endAddr : Int) : Array[BigInt] = {
        //   var ramBytes = new ArrayBuffer[BigInt]
        //   for(idx <- beginAddr to endAddr){
        //     ramBytes.append(ram.memRam.getBigInt(idx))
        //   }
        //   ramBytes.toArray
        // }
        
        // return ABI name for register number
        def regname(reg:Int) : String = {
          reg match {
            case 0 =>
              return "zero"
            case 1 =>
              return "ra"
            case 2 =>
              return "sp"
            case 3 =>
              return "gp"
            case 4 =>
              return "tp"
            case 5 =>
              return "t0"
            case 6 =>
              return "t1"
            case 7 =>
              return "t2"
            case 8 =>
              return "s0/fp"
            case 9 =>
              return "s1"
            case 10 =>
              return "a0"
            case 11 =>
              return "a1"
            case 12 =>
              return "a2"
            case 13 =>
              return "a3"
            case 14 =>
              return "a4"
            case 15 =>
              return "a5"
            case 16 =>
              return "a6"
            case 17 =>
              return "a7"
            case 18 =>
              return "s2"
            case 19 =>
              return "s3"
            case 20 =>
              return "s4"
            case 21 =>
              return "s5"
            case 22 =>
              return "s6"
            case 23 =>
              return "s7"
            case 24 =>
              return "s8"
            case 25 =>
              return "s9"
            case 26 =>
              return "s10"
            case 27 =>
              return "s11"
            case 28 =>
              return "t3"
            case 29 =>
              return "t4"
            case 30 =>
              return "t5"
            case 31 =>
              return "t6"
            case default =>
              return "gpr"
          }
        }

        // def printRegFile() = {
        //   for(i <- 0 to 31) {
        //     printf("%-5s(x%2d) = %8x\n",regname(i),i,dut.cpu.cpu.regs.regFile.getBigInt(i)) //'.getBigInt' is use to 'Mem' only
        //   }
        // }
        def returnRegFileString() : String = {
          var regFileDump = new StringBuilder("")
          for(i <- 0 to 31) {
            regFileDump.append(f"${regname(i)}%-5s(x${i}%2d) = ${dut.cpu.cpu.regs.regFile.getBigInt(i)}%8x\n")
          }
          regFileDump.toString
        }
        def printRegFile() = {
          print(returnRegFileString())
          // for(i <- 0 to 31) {
            //Format specifiers always begin with a % and end up with the type of data to be printed(eg:'s' for string, 'd' for decimal, 'x' for hexadecimal)
            //'%' marks the beginning of the format specifier, '-' means left-align the output within the specified field width
            //'5' is the specified field width., 's' tells printf to expect a string argument
            //'%2d' means 2 character width, decimal.  '%8x'
            // printf("%-5s(x%2d) = %8x\n",regname(i),i,dut.cpu.cpu.registerFile.RegisterArray.getBigInt(i))
            // printf("%-5s(x%2d) = %8x\n",regname(i),i,dut.cpu.cpu.registerFile.RegisterArray(i).toBigInt)
          // }
        }

        var logfileStringBuilder = new StringBuilder("")
        println("Starting simulation")
        println(f"File ${hexFilePath}")
        logfileStringBuilder.append("Starting simulation\n")
        logfileStringBuilder.append(java.time.format.DateTimeFormatter.ofPattern("YYYY-MM-dd H:m:s").format(java.time.LocalDateTime.now)+"\n\n")
        logfileStringBuilder.append(f"MEM = ${hexFilePath}\n")
        // Fork a process to generate the reset and the clock on the dut
        var clockPeriodNS = 82
        logfileStringBuilder.append(f"clock period (ns) = ${clockPeriodNS}\n")
        dut.clockDomain.forkStimulus(period = clockPeriodNS)
        var dutRunning = false
        var simSteps: Int = 0
        var noInstr: Int = 1
        var noClk: Int = 1
        var maxsimSteps: Int = 2600
        var maxSimstepsReached = false
        // var resetRiEdge: Int = 100
        // var resetFaEdge: Int = 104

        // println("Starting simulation")
        // // Fork a process to generate the reset and the clock on the dut
        // dut.clockDomain.forkStimulus(period = 82)
        // var dutRunning = false
        // var simSteps: Int = 0
        // var maxsimSteps: Int = 2600
        // var maxSimstepsReached = false
        // var resetRiEdge: Int = 100
        // var resetFaEdge: Int = 104

        // reading ram is fairly new addition to spinalhdl and still needs some debugging
        // dut.clockDomain.waitRisingEdge()
        // var ramC = dut.ram
        // dut.clockDomain.waitRisingEdge()
        // println("memory before 2nd reset at 0x80002000")
        // readRam(ramC,0x00001ffc,0x00002000+8).toList.foreach{ printf("%8x ",_)}
        // print("\n")

        // uart rxd 
        val rxdSim: Boolean = true
        dut.io.uart.rxd #= rxdSim
        val t1 = System.nanoTime
        while ((simSteps <= maxsimSteps) || dutRunning) {
          var k = dut.cpu.cpu.programCounter.toBigInt
          var i = dut.cpu.cpu.CSRLogic.newFetch.toBoolean
          var cpuHalt = dut.io.cpuHalted.toBoolean

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
          if (k == failPC && !reachedEnd && i) {
            reachedEnd = true
            simEndTime = simTime()
            simPC = k
            println("Failed test @ " + simEndTime + "ns")
          }
          if (k == passPC && !reachedEnd && i) {
            reachedEnd = true
            simEndTime = simTime()
            simPC = k
            println("Passed test @ " + simEndTime + "ns")
          }
          if (cpuHalt && !reachedEnd) {
            reachedEnd = true
            simEndTime = simTime()
            simPC = k
            cpuHalted = cpuHalt
            val t2 = System.nanoTime
            println("Halted @ " + simEndTime + "ns")
            println("SimSteps: " + simSteps)
            println("CPU time: " + (t2 - t1) + " ns")
            printf("SIMPC : %8x\n", simPC)
            logfileStringBuilder.append(f"Halted @ time = ${simEndTime} ns\nSimSteps = ${simSteps}\nCPU time = ${(t2 - t1)} ns\nsimPC = ${simPC}%8x\n")
          }
          // if(simSteps >= resetRiEdge && simSteps <= resetFaEdge){
          //   dut.clockDomain.assertReset()
          // }else{
          //   dut.clockDomain.deassertReset()
          // }

          // Wait a rising edge on the clock
          dut.clockDomain.waitRisingEdge()
          simSteps += 1
        }

        // println("memory after 2nd reset at 0x80000000")
        // readRam(ramC,0,4).toList.foreach{printf("%x ",_)}
        // print("\n")

        if (!logFileEnabled) {
          // println("3rd reset after full run")
          // dut.clockDomain.assertReset()
          // dut.clockDomain.waitRisingEdge()
          // dut.clockDomain.deassertReset()
          // dut.clockDomain.waitRisingEdge()
          // println("run 600 steps")
          // for(stepsOther <- 0 to 600){
          //  dut.clockDomain.waitRisingEdge()
          // }

          // printf("ram@ %x = %x\n", rAddr, dut.ram.memRam.getBigInt(rAddr))
          // println(readRam(ramC,0,5).toList)
          printf("dut halted: %b\n", dutRunning)
          printf("simulation steps reached: %d\n\n", simSteps)
          // readRam(ramC,0x4000/4,0x4b04/4).toList.foreach{
          //   printf("%8x\n",_)
          // }

        }
      
      // print regfile, simtime, pc, num-instr like vp does
      printRegFile()
      printf("pc = %08x\n", dut.cpu.cpu.programCounter.toBigInt)
      printf("num-instr = %d\n", dut.cpu.cpu.CSRLogic.minstret.toBigInt)
      printf("num-clk-cycle = %d\n", dut.cpu.cpu.CSRLogic.mcycle.toBigInt)
      printf("CPI = %f\n", dut.cpu.cpu.CSRLogic.mcycle.toBigInt.toFloat / dut.cpu.cpu.CSRLogic.minstret.toBigInt.toFloat)

      logfileStringBuilder.append(returnRegFileString())
      logfileStringBuilder.append(f"pc = ${dut.cpu.cpu.programCounter.toBigInt}%08x\n")
      logfileStringBuilder.append(f"num-instr = ${dut.cpu.cpu.CSRLogic.minstret.toBigInt}\n")
      logfileStringBuilder.append(f"num-clk-cycle = ${dut.cpu.cpu.CSRLogic.mcycle.toBigInt}\n")
      logfileStringBuilder.append(f"CPI = ${dut.cpu.cpu.CSRLogic.mcycle.toBigInt.toFloat / dut.cpu.cpu.CSRLogic.minstret.toBigInt.toFloat}%3.4f\n")
      logfileStringBuilder.append(f"IPC = ${dut.cpu.cpu.CSRLogic.minstret.toBigInt.toFloat / dut.cpu.cpu.CSRLogic.mcycle.toBigInt.toFloat}%3.4f\n")
      logfileStringBuilder.append(f"IPS = ${BigDecimal(dut.cpu.cpu.CSRLogic.minstret.toBigInt) /(BigDecimal(dut.cpu.cpu.CSRLogic.mcycle.toBigInt)*BigDecimal(clockPeriodNS*10e-9))}%.4f\n")

    if (logFileEnabled) {
            val fileName = "simulation.log"
            val logfilePath = org.apache.commons.io.FilenameUtils.getPath(args(0)) + fileName
            scala.tools.nsc.io.File(logfilePath).writeAll(logfileStringBuilder.toString)
    }

      }

    // log the rv32ui-p test results
    // if (logFileEnabled) {
    //   val fileName = "./log/rv32ui-p-tests.log"
    //   val currentTest = org.apache.commons.io.FilenameUtils.getName(args(0))
    //   val logWriter = new FileWriter(fileName, true)
    //   try {
    //     logWriter.append(currentTest + " :\t")
    //     if (reachedEnd && simPC == passPC) {
    //       logWriter.append("Passed test @\t" + simEndTime + "ns")
    //     } else if (reachedEnd && simPC == failPC) {
    //       logWriter.append("Failed test @\t" + simEndTime + "ns")
    //     } else if (reachedEnd && cpuHalted) {
    //       logWriter.append(("Failed, halted @\t" + simEndTime + "ns"))
    //     } else {
    //       logWriter.append("no result")
    //     }
    //   } finally {
    //     logWriter.append(("\n"))
    //     logWriter.close()
    //   }
    // }
  }
}
