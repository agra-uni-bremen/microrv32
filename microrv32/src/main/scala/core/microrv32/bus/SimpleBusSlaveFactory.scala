package core.microrv32.bus

import spinal.core._
import spinal.lib.bus.misc._
import scala.collection.Seq

object SimpleBusSlaveFactory {
  def apply(bus: SimpleBus, select: Bool, addressBits : Int, dontCareReadData : Boolean = false) = new SimpleBusSlaveFactory(bus, select, addressBits, dontCareReadData)
}

class SimpleBusSlaveFactory(bus: SimpleBus, select: Bool,addressBits : Int, dontCareReadData : Boolean = true) extends BusSlaveFactoryDelayed {
 
  bus.SBready := RegNext((select && bus.SBvalid) && !bus.SBready)
  if(dontCareReadData) bus.SBrdata.assignDontCare() else bus.SBrdata := 0

  val askWrite = (select && bus.SBvalid && bus.SBwrite)
  val askRead  = (select && bus.SBvalid && !bus.SBwrite)
  val doWrite  = (select && bus.SBvalid && bus.SBready &&  bus.SBwrite)
  val doRead   = (select && bus.SBvalid && bus.SBready && !bus.SBwrite)
  val localAddress = bus.SBaddress(addressBits-1 downto 0)
  override def readAddress()  = localAddress
  override def writeAddress() = localAddress

  override def readHalt()  = bus.SBready := False
  override def writeHalt() = bus.SBready:= False

  override def busDataWidth   = 32
  override def wordAddressInc = 4

  override def build(): Unit = {

    super.doNonStopWrite(bus.SBwdata)
    setWordEndianness(LITTLE)
    def doMappedElements(jobs : Seq[BusSlaveFactoryElement]) = super.doMappedElements(
      jobs      = jobs,
      askWrite  = askWrite,
      askRead   = askRead,
      doWrite   = doWrite,
      doRead    = doRead,
      writeData = bus.SBwdata,
      readData  = bus.SBrdata
    )
    switch(localAddress) {
      for ((address, jobs) <- elementsPerAddress if address.isInstanceOf[SingleMapping]) {
        is(address.asInstanceOf[SingleMapping].address) {
          doMappedElements(jobs)
        }
      }
    }

    for ((address, jobs) <- elementsPerAddress if !address.isInstanceOf[SingleMapping]) {
      when(address.hit(bus.SBaddress)){
        report(jobs)
        doMappedElements(jobs)
      }
    }
  }
}
