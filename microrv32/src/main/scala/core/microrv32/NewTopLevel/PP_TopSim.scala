package PP_RV32I

import PP_RV32I.Core._

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
object PP_MicroRV32TopSim {
  def main(args: Array[String]) {
    // set to true if you want to log riscv-tests simulation results into ./log/rv32ui-p-tests.log
    var logFileEnabled = true
    var failPC: BigInt = 0
    var passPC: BigInt = 0

    var reachedEnd = false

    // var enaMul = false
    // var enaDiv = false
    // var enaComp = false

    var hexFilePathIMem = args(0)
    var hexFilePathDMem = args(1)

    // some very crude and experimental commandline argument handling
    // if logFileEnabled is set in test bench, the arguments after the binary are the failpc and passpc for automatic check and logging
    // else the argument passed after the binary is the core variant (used for semi-automatic benchmarking)
    // if (logFileEnabled) {
    //   if (args.length > 1) {  //checks if there are at least two arguments provided on the command line
    //     failPC = BigInt(args(1), 16)
    //     passPC = BigInt(args(2), 16)
    //   }
    // } else {
      // if (args.length > 1) {
        // args(1) match {
        //   case "rv32i"   => { enaMul = false; enaDiv = false; enaComp = false }
        //   case "rv32im"  => { enaMul = true; enaDiv = true; enaComp = false }
        //   case "rv32ic"  => { enaMul = false; enaDiv = false; enaComp = true }
        //   case "rv32imc" => { enaMul = true; enaDiv = true; enaComp = true }
        //   case _         => { enaMul = false; enaDiv = false; enaComp = false }
        // }
        // println("enaMul " + enaMul)
        // println("enaDiv " + enaDiv)
        // println("enaComp " + enaComp)
      // }
    // }

    // var hexFilePath = args(0)
    // var memSize = Source.fromFile(hexFilePath).getLines.size
    var InstmemSize = Source.fromFile(hexFilePathIMem).getLines.size
    var DatamemSize = Source.fromFile(hexFilePathDMem).getLines.size

    var simPC: BigInt = 0
    var simEndTime: BigInt = 0
    var cpuHalted = false

    var logfileStr = ""

    SimConfig
      .withConfig(
        SpinalConfig(
          defaultClockDomainFrequency = FixedFrequency(12 MHz)
        )
      )
      .withFstWave
      //'compile' prepares the design for the simulation. 
      //Create the instance that it can drive with inputs and read outputs
      .compile { 
        val top = new PP_MicroRV32Top(
          hexFilePathIMem,
          InstmemSize,
          hexFilePathDMem,
          DatamemSize,
          PP_RV32CoreConfig()
        )
        // make signals public in simulation scope
        top.cpu.cpu.programCounter.simPublic() //PC
        top.cpu.cpu.registerFile.RegisterArray.simPublic() //RF

        top
      }
  //.doSim is the testbench, not the SpinalConfig
      .doSim { dut => 
        //Create a new thread for uart decoding to print outout to simulation console
        //val txdDecodeThread = fork {}
        //!not needed now 

        //return ABI name for register numberbusMappings += DataRam.io.db -> (DataRam.io.sel, MaskMapping(0x80000000l, 0xFF000000l))
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
        def returnRegFileString() : String = {
          var regFileDump = new StringBuilder("")
          for(i <- 0 to 31) {
            regFileDump.append(f"${regname(i)}%-5s(x${i}%2d) = ${dut.cpu.cpu.registerFile.RegisterArray(i).toBigInt}%8x\n")
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
        println(f"File ${hexFilePathIMem}")
        logfileStringBuilder.append("Starting simulation\n")
        logfileStringBuilder.append(java.time.format.DateTimeFormatter.ofPattern("YYYY-MM-dd H:m:s").format(java.time.LocalDateTime.now)+"\n\n")
        logfileStringBuilder.append(f"IMEM = ${hexFilePathIMem}\nDMEM = ${hexFilePathDMem}\n")
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

        //uart rxd
        val rxdSim: Boolean = true
        dut.io.uart.rxd #= rxdSim
        val t1 = System.nanoTime
        while ((simSteps <= maxsimSteps) || dutRunning) {
          var k = dut.cpu.cpu.programCounter.toBigInt
        //   var i = dut.cpu.cpu.CSRLogic.newFetch.toBoolean
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
        //   if (k == failPC && !reachedEnd && i) {
          if (k == failPC && !reachedEnd) {
            reachedEnd = true
            simEndTime = simTime()
            simPC = k
            println("Failed test @ " + simEndTime + "ns")
          }
          if (k == passPC && !reachedEnd) {
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
          if(!dut.io.cpuHalted.toBoolean) {
            noClk += 1
          }
          if(dut.io.cpuFetch.toBoolean) {
            noInstr += 1
          }
        }

        // if (!logFileEnabled) {
        //   printf("dut halted: %b\n", dutRunning)
        //   printf("simulation steps reached: %d\n\n", simSteps)
        // }

        // print regfile, simtime, pc, num-instr like vp does
        printRegFile()
        printf("pc = %08x\n", dut.cpu.cpu.programCounter.toBigInt)
        printf("num-instr = %d\n", noInstr)
        printf("num-clk-cycle = %d\n", noClk)
        printf("CPI = %f\n", noClk.toFloat / noInstr.toFloat)
        printf("IPC = %3.3f\n", noInstr.toFloat / noClk.toFloat)
        printf("IPS = %.3f\n", BigDecimal(noInstr) /(BigDecimal(noClk)*BigDecimal(clockPeriodNS*10e-9)))

        logfileStringBuilder.append(returnRegFileString())
        logfileStringBuilder.append(f"pc = ${dut.cpu.cpu.programCounter.toBigInt}%08x\n")
        logfileStringBuilder.append(f"num-instr = ${noInstr}\n")
        logfileStringBuilder.append(f"num-clk-cycle = ${noClk}\n")
        logfileStringBuilder.append(f"CPI = ${noClk.toFloat / noInstr.toFloat}%3.4f\n")
        logfileStringBuilder.append(f"IPC = ${noInstr.toFloat / noClk.toFloat}%3.4f\n")
        logfileStringBuilder.append(f"IPS = ${BigDecimal(noInstr) /(BigDecimal(noClk)*BigDecimal(clockPeriodNS*10e-9))}%.4f\n")
    
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

    if (logFileEnabled) {
            val fileName = "simulation.log"
            val logfilePath = org.apache.commons.io.FilenameUtils.getPath(args(0)) + fileName
            scala.tools.nsc.io.File(logfilePath).writeAll(logfileStringBuilder.toString)
    }     
  }
}
}