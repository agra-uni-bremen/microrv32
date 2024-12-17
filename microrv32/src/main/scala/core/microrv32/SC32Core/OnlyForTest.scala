package SC_RV32I.Core

import spinal.core._
import spinal.sim._
import spinal.core.sim._

import java.io._
import scala.io.Source
import scala.collection.mutable.ArrayBuffer
import scala.util.Random

object ModuleSim {
  def main(args: Array[String]) {
    SimConfig.withFstWave.doSim(new SCCore(SC_RV32CoreConfig())){dut =>
    // SimConfig.withFstWave.doSim(new SBRV32Core(SC_RV32CoreConfig())){dut =>
    // SimConfig.withFstWave.doSim(new ControlUnit()){dut =>
    }
    }
}