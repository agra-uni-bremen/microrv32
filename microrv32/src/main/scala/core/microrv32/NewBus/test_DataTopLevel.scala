package MEM

import Bus._
import Peripheral._
import SC_RV32I.Core._

import spinal.core._
import spinal.lib._
import spinal.lib.bus.misc._
import spinal.lib.slave
// import Core.MC.Mem.Tools._

import scala.collection.mutable.ArrayBuffer
import scala.io.Source

class test_DataTop (InitDataFile:String, DataHexSize:Int) extends Component {
    val io = new Bundle{
        val request = in (Bool())
        val address = in (UInt(32 bits))
        val write = in (Bool()) //The command that we sent to interface
        val DBwrite = out (Bool()) //The actual signal that the memory will received
        val busy = out (Bool())
        val ready = out (Bool())
        val valid = out (Bool())
        val wdata = in (Bits(32 bits))
        val size = in (UInt(4 bits))
        val rdata = out (Bits(32 bits))
        val fired = out (Bool())
    }

    class dataCPU() extends Component{
        val io = new Bundle {
            //face to the tester
            val request = in (Bool())
            val address = in (UInt(32 bits))
            val writein = in (Bool())
            val writeout = out (Bool())
            val busy = out (Bool())
            val wdata = in (Bits(32 bits))
            val size = in (UInt(4 bits))

            //face to the decoder
            val CPUBus = master (DataBus(32, 32))
            val fired = in (Bool())
        }

        val DataIF = new DataController()

        //Conmmunicating with inside (IF and Bus)
        io.CPUBus.DBvalid := DataIF.io.bus.valid
        DataIF.io.bus.ready := io.CPUBus.DBready
        io.CPUBus.DBwrite := DataIF.io.bus.write

        //Conmmunicating with the tester and decoder
        DataIF.io.ctrl.request := io.request
        io.CPUBus.DBaddress := io.address
        DataIF.io.ctrl.write := io.writein
        io.writeout := io.CPUBus.DBwrite
        io.busy := DataIF.io.ctrl.busy
        io.CPUBus.DBwdata := io.wdata
        io.CPUBus.DBsize := io.size
        DataIF.io.bus.unmapped := io.fired
    }

    val CPU = new dataCPU()
 
    val busMappings = new ArrayBuffer[(DataBus,(Bool, MaskMapping))]

    val DataRam = new DataMem (32, DataHexSize, InitDataFile)
    busMappings += DataRam.io.db -> (DataRam.io.sel, MaskMapping(0x80000000l, 0xFF000000l))

    val DataBusDec = DataLineDecoder (
        CPUmasterDF = CPU.io.CPUBus,
        decodings = busMappings.toSeq
    )
    DataBusDec.io.unmapped.clear := True
    CPU.io.fired := DataBusDec.io.unmapped.fired

    //Connecting with outside
    CPU.io.request := io.request
    CPU.io.address := io.address
    CPU.io.writein := io.write
    io.DBwrite := CPU.io.writeout
    CPU.io.wdata := io.wdata
    CPU.io.size := io.size
    io.busy := CPU.io.busy
    io.ready := DataBusDec.io.LineDF.DBready
    io.valid := CPU.io.CPUBus.DBvalid
    io.rdata := DataBusDec.io.LineDF.DBrdata
    io.fired := DataBusDec.io.unmapped.fired
}

