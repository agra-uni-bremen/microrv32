package SC_RV32I.Core

import spinal.core._
import spinal.lib.master
import scala.annotation.switch

import SC_RV32I.Core._
import Bus._

case class SBCoreIO() extends Bundle {
    val IB = master(InstBus(32, 32))
    val DB = master(DataBus(32, 32))
    val unmapped = in Bool()
    val fetchSync = out Bool()
    // cpu halted through ecall, pls notice the different from the 'halting signals' below
    val halted = out Bool()
    // halting signals for external, memory mapped shutdown
    val halt = in Bool() 
    val haltErr = in Bool()
}

//The interface will deal with the problem of LB/LBU and LH/LHU
class SBRV32Core(val cfg : SC_RV32CoreConfig) extends Component{
    val io = new SBCoreIO()

    val cpu = new SCCore(cfg)
    val dataController = new DataController()
    
    //internal connection: the trick is input of every module
    //cpu.io.halt and cpu.io.haltErr
    cpu.io.halt := io.halt
    cpu.io.haltErr := io.haltErr
    //cpu.InstInterface
    cpu.io.InstMemIF.instruction := io.IB.IBrdata
    //cpu.Data.Interface
    cpu.io.DataMemIF.dataReady := io.DB.DBready
    cpu.io.DataMemIF.ctrlBusy := dataController.io.ctrl.busy
    cpu.io.DataMemIF.readData := io.DB.DBrdata
    //DataController
    dataController.io.ctrl.request := cpu.io.DataMemIF.request
    dataController.io.ctrl.write := cpu.io.DataMemIF.readWrite
    dataController.io.bus.unmapped := io.unmapped
    dataController.io.bus.ready := io.DB.DBready

    //output signal 
    //IB
    io.IB.IBaddress := cpu.io.InstMemIF.address.asUInt
    //DB
    io.DB.DBwrite := dataController.io.bus.write
    io.DB.DBvalid := dataController.io.bus.valid
    io.DB.DBaddress := cpu.io.DataMemIF.address.asUInt
    io.DB.DBwdata := cpu.io.DataMemIF.writeData
    io.DB.DBsize := cpu.io.DataMemIF.size
    //io.fetchSync
    io.fetchSync := cpu.io.fetchSync
    //io.halted
    io.halted := cpu.io.halted
}

//Generating Verilog
object SBRV32CoreTop {
  def main(args: Array[String]) {
    SpinalConfig(
      defaultClockDomainFrequency=FixedFrequency(12 MHz),
      targetDirectory = "rtl"
      ).generateVerilog(new SBRV32Core(SC_RV32CoreConfig()))
      .printPruned()
  }
}