package SC_RV32I

import Bus._
import Peripheral._
import SC_RV32I.Core._
// import SC_RV32I.Tools._

import spinal.core._
import spinal.lib._
import spinal.lib.bus.misc._
import spinal.lib.slave

import scala.collection.mutable.ArrayBuffer
import scala.io.Source

class test_InstTop (InitInstFile:String, InstHexSize:Int) extends Component {
    val io = new Bundle {
        val address = in UInt(32 bits)
        val rdata = out Bits(32 bits)
    }

    class fakeCPU() extends Component {
        val io = new Bundle {
            val address = in UInt(32 bits)
            val rdata = out Bits(32 bits)
            val CPUInstBus = master(InstBus(32, 32))        
        }

        io.CPUInstBus.IBaddress := io.address
        io.rdata := io.CPUInstBus.IBrdata
    } 
    
    //define components
    val CPU = new fakeCPU()
    val InstRom = new InstMem (32, InstHexSize, InitInstFile)

    //Interconnection between CPU and Mem
    CPU.io.CPUInstBus <> InstRom.io.ib

    //output assignment
    io.rdata := CPU.io.rdata
    CPU.io.address := io.address

}