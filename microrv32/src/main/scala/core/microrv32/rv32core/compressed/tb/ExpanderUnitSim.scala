package core.microrv32.rv32core.compressed

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import scala.util.Random

import core.microrv32.rv32core
import core.microrv32.rv32core._

// Testbench generates (unconstrained) random numbers and applies them to the unit for each available operation
// Using N as the test count. Simulate without wavetrace generation for faster simulation speeds.
object ExpanderUnitSim {
  def main(args: Array[String]) : Unit = {
    SimConfig.withWave.doSim(new ExpanderUnit) { dut =>
      dut.io.compInstr #= 0
      
      // dut.clockDomain.forkStimulus(period = 10)
      sleep(2)
      dut.io.compInstr #= 0x00ff & (0x3)
      sleep(2)
      dut.io.compInstr #= 0x00ff & ((0xab << 5) | ((0x7 & 0x3) << 2))
      sleep(2)

      simSuccess()
    }
  }
}
