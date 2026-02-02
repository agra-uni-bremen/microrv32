package core.microrv32.peripheral.uart

import spinal.core._
import spinal.lib.slave
import spinal.lib._
import spinal.lib.com.uart._
import core.microrv32.bus._

class SBSUart() extends Component{
    val io = new Bundle{
        val sb = slave(SimpleBus(32,32))
        val uart = master(new Uart())
        val sel = in(Bool)
    }
    val busCtrl = SimpleBusSlaveFactory(io.sb, io.sel, addressBits = 8)

    val uartCtrl = new UartCtrl()
    uartCtrl.io.config.setClockDivider(115200 Hz)
    uartCtrl.io.config.frame.dataLength := 7  //8 bits
    uartCtrl.io.config.frame.parity := UartParityType.NONE
    uartCtrl.io.config.frame.stop := UartStopType.ONE
    uartCtrl.io.writeBreak := False
    uartCtrl.io.uart <> io.uart

    val txStream = Stream(Bits(8 bits))
    busCtrl.drive(txStream.payload, address = 0)
    // set valid based on memory mapped register but clear/consume it after 1 cycle <s
    txStream.valid := busCtrl.setOnSet(RegNext(False) init(False), address=4, 0)
    // read on address 4 returns the availability of the stream (i.e., is there no byte being transmitted right now?)
    busCtrl.read(txStream.ready, address = 4)
    uartCtrl.io.write <-< txStream

    // rx fifo to not throw away incoming rx bytes when they are not fetched
    val rxFifoDepth = 16
    val rxFifo = new StreamFifo(dataType = Bits(8 bits), depth = rxFifoDepth) // width=8, depth=16 
    val rxAlmostEmpty = rxFifo.io.occupancy === 1
    val rxEmpty = rxFifo.io.occupancy === 0
    val rxStream = Stream(Bits(8 bits))
    // from uart into fifo
    rxFifo.io.push << uartCtrl.io.read
    // from fifo into mmio register output
    rxStream << rxFifo.io.pop
    busCtrl.read(rxStream.payload, address = 8)
    // by default, ready is only true when payload is read,
    // this way, we pop the next element of the rx fifo
    rxStream.ready := False
    busCtrl.onRead(8){
        rxStream.ready := True
    }
    busCtrl.read(rxFifo.io.occupancy, address = 12)
    busCtrl.read(rxAlmostEmpty, address = 16)
    busCtrl.read(rxEmpty, address = 20)

}