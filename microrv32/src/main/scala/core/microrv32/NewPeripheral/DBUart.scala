package Peripheral

import spinal.core._
import spinal.lib.slave
import spinal.lib._
import spinal.lib.com.uart._

import Bus._

class DBUart() extends Component{
    val io = new Bundle{
        val db = slave(DataBus(32,32))
        val uart = master(new Uart())
        val sel = in(Bool)
    }
    val rdy = Reg(Bool) init(False)
    val intAddr = UInt(8 bits)
    val read = io.db.DBvalid && io.sel && !io.db.DBwrite
    val write = io.db.DBvalid && io.sel && io.db.DBwrite

    val uartCtrl = new UartCtrl()
    uartCtrl.io.config.setClockDivider(115200 Hz)
    uartCtrl.io.config.frame.dataLength := 7  //8 bits
    uartCtrl.io.config.frame.parity := UartParityType.NONE
    uartCtrl.io.config.frame.stop := UartStopType.ONE
    uartCtrl.io.writeBreak := False
    uartCtrl.io.uart <> io.uart

    val DBUartLogic = new Area{
        intAddr := io.db.DBaddress(7 downto 0)
        val txStream = Stream(Bits(8 bits))
        val uartTxValid = Reg(Bool) init(False)
        val uartTxPayload = Reg(Bits(8 bits)) init(0)
        //val uartTxReady = Reg(Bool) init(False)//RegNextWhen(txStream.ready, txStream.ready || (read && intAddr === 1)) init(False)
        val uartTxReady = Reg(Bool) init(False) 
        val rxReg = Reg(Bits(8 bits)) init(0)
        val dbDataOutputReg = Reg(Bits(32 bits)) init(0)
        val outputRegSel = Bool
        val outputBuff = Bits(32 bits)
        // rx fifo to not throw away incomming rx bytes when they are not fetched
        val rxFifoDepth = 16
        //
        val rxFifo = new StreamFifo(dataType = Bits(8 bits), depth = rxFifoDepth) // width=8, depth=16 
        val rxAlmostEmpty = rxFifo.io.occupancy === 1
        val rxEmpty = rxFifo.io.occupancy === 0
        val rxStream = Stream(Bits(8 bits))

        // rx fifo
        rxFifo.io.push << uartCtrl.io.read
        rxStream << rxFifo.io.pop
        // stream to stream connections
        txStream.valid := uartTxValid
        txStream.payload := uartTxPayload
        uartCtrl.io.write <-< txStream
        //rxReg := uartCtrl.io.read.toFlow.toReg()
        
        // default values
        dbDataOutputReg := 0 
        uartTxValid := False
        uartTxReady := txStream.ready
        rxStream.ready := False
        //outputRegSel := False
        //outputBuff := 0

        // address mapping logic
        when(write){
            when(intAddr === 0){
                uartTxPayload := io.db.DBwdata(7 downto 0)
            }.elsewhen(intAddr === 4 && io.db.DBwdata === B(1, 32 bits)){
                // if 0x01 is written into address 1 enable tx for payload written to address 0
                uartTxValid := True
            }
        }.elsewhen(read){
            when(intAddr === 0){
            }.elsewhen(intAddr === 4){
                dbDataOutputReg := B(uartTxReady, 32 bits) // tx ready (goes 1 if tx is available to receive next tx payload and is ready to send)
            }.elsewhen(intAddr === 8){
                dbDataOutputReg := B(rxStream.payload, 32 bits) // output fifo pop payload
                rxStream.ready := True // fifo pop 
            }.elsewhen(intAddr === 12){
                dbDataOutputReg := B(rxFifo.io.occupancy, 32 bits) // occupancy as uint
            }.elsewhen(intAddr === 16){
                dbDataOutputReg := B(rxAlmostEmpty, 32 bits) // one element left
            }.elsewhen(intAddr === 20){
                dbDataOutputReg := B(rxEmpty, 32 bits) // fifo empty
            }
        }
        // 
    }
    // bus ready signal -- transaction must be done in one cycle!
    rdy := False
    when((read | write) & io.sel){
        rdy := True
    }
    io.db.DBready := rdy
    //io.db.DBrdata := Mux(DBUartLogic.outputRegSel,DBUartLogic.outputBuff,DBUartLogic.dbDataOutputReg)
    io.db.DBrdata := DBUartLogic.dbDataOutputReg
}