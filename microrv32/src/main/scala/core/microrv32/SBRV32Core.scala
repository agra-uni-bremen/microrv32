package core.microrv32

import spinal.core._
import spinal.lib.master
import scala.annotation.switch
import core.microrv32.rv32core._

case class SBCoreIO() extends Bundle{
    val sb = master(SimpleBus(32,32))
    // cpu halted through ecall
    val halted = out Bool()
    // sync signal, asserted when core is in fetch state
    val fetchSync = out Bool()
    // halting signals for external, memory mapped shutdown
    val halt = in Bool()
    val haltErr = in Bool()
    val dbgState = out Bits(4 bits)
    // interrupt timer
    val irqTimer = in Bool()
}

// differentiate between the source of transaction as it needs to be unified onto one bus
object TransactionSource extends SpinalEnum{
    val none, error, imem, dmem = newElement()
}

class SBRV32Core(val cfg : RV32CoreConfig) extends Component{
    val io = new SBCoreIO()

    val cpu = new RiscV32Core(cfg)

    io.halted := cpu.io.halted
    io.fetchSync := cpu.io.fetchSync
    cpu.io.halt := io.halt
    cpu.io.haltErr := io.haltErr
    io.dbgState := cpu.io.dbgState
    cpu.io.irqTimer := io.irqTimer

    val busTranslation = new Area{
        // out
        val sbError = Bool
        val sbAddrMux = Bits(32 bits)
        val sbValidMux = Bool
        val sbWDataMux = Bits(32 bits)
        val sbWriteMux = Bool
        val sbSizeMux = UInt(4 bits)
        // in
        val sbReadyMux = Bool
        val sbRDataMux = Bits(32 bits)

        val transactionSrc = Reg(TransactionSource()) init(TransactionSource.none)
        val wrSize = UInt(4 bits)
        val dmemstrobe = cpu.io.memIF.DMem.wrStrobe

        sbError := cpu.io.memIF.IMem.fetchEnable & cpu.io.memIF.DMem.enable
        sbRDataMux := io.sb.SBrdata
        sbReadyMux := io.sb.SBready

        // on either but not both enables we can pass a transaction
        when(cpu.io.memIF.IMem.fetchEnable){
            transactionSrc := TransactionSource.imem
        }.elsewhen(cpu.io.memIF.DMem.enable){
            transactionSrc := TransactionSource.dmem
        }.elsewhen(sbError){
            transactionSrc := TransactionSource.error
        }.otherwise{
            transactionSrc := TransactionSource.none
        }

        // translate the memory strobe into a according transaction size
        switch(transactionSrc){
            is(TransactionSource.imem){
                wrSize := 4
            }
            is(TransactionSource.dmem){
                when(dmemstrobe === B"0001" | dmemstrobe === B"0010" | dmemstrobe === B"0100" | dmemstrobe === B"1000"){
                    wrSize := 1
                }.elsewhen(dmemstrobe === B"0011" | dmemstrobe === B"1100"){
                    wrSize := 2
                }.elsewhen(dmemstrobe === B"1111"){
                    wrSize := 4
                }.otherwise{
                    wrSize := 0 // indicating error?
                }
            }
            default{
                wrSize := 4
            }

        }

        // mux/demux the signals for the bus transaction
        switch(transactionSrc){
            is(TransactionSource.imem){
                // mux outputs
                sbAddrMux := cpu.io.memIF.IMem.address
                sbValidMux := cpu.io.memIF.IMem.fetchEnable
                sbWDataMux := B(0, 32 bits)
                sbWriteMux := False // read instructions
                sbSizeMux := wrSize // all instructions are 32 bit words for now
                // drive inputs demux
                cpu.io.memIF.IMem.instructionReady := sbReadyMux
                cpu.io.memIF.DMem.dataReady := False
            }
            is(TransactionSource.dmem){
                // mux outputs
                sbAddrMux := cpu.io.memIF.DMem.address
                sbValidMux := cpu.io.memIF.DMem.enable
                sbWDataMux := cpu.io.memIF.DMem.writeData
                sbWriteMux := cpu.io.memIF.DMem.readWrite
                sbSizeMux := wrSize // all instructions are 32 bit words for now
                // drive inputs demux
                cpu.io.memIF.IMem.instructionReady := False
                cpu.io.memIF.DMem.dataReady := sbReadyMux
            }
            is(TransactionSource.error){
                // mux outputs
                sbAddrMux := B(0, 32 bits)
                sbValidMux := False
                sbWDataMux := B(0, 32 bits)
                sbWriteMux := False
                sbSizeMux := wrSize // all instructions are 32 bit words for now
                // drive inputs demux
                cpu.io.memIF.IMem.instructionReady := False
                cpu.io.memIF.DMem.dataReady := False
            }
            default{
                // mux outputs
                sbAddrMux := B(0, 32 bits)
                sbValidMux := False
                sbWDataMux := B(0, 32 bits)
                sbWriteMux := False
                sbSizeMux := wrSize // all instructions are 32 bit words for now
                // drive inputs demux
                cpu.io.memIF.IMem.instructionReady := False
                cpu.io.memIF.DMem.dataReady := False
            }
        }
        // read data is only accepted on the respective ready signal
        cpu.io.memIF.DMem.readData := sbRDataMux
        cpu.io.memIF.IMem.instruction := sbRDataMux
        io.sb.SBaddress := U(sbAddrMux, 32 bits)
        io.sb.SBvalid := sbValidMux
        io.sb.SBwdata := sbWDataMux
        io.sb.SBwrite := sbWriteMux
        io.sb.SBsize := sbSizeMux
    }
}