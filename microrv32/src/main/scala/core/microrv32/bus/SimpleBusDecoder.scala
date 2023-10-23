package core.microrv32.bus

import spinal.core._
import spinal.lib._
import spinal.lib.IMasterSlave
import spinal.lib.bus.misc._

object SimpleBusDecoder {
  def apply(master : SimpleBus, decodings: Seq[(SimpleBus, (Bool, MaskMapping))]) : SimpleBusDecoder =  {
    val decoder = new SimpleBusDecoder(master, decodings.map(_._2._2))
    master <> decoder.io.input
    // connect all the simplebus interfaces of decodings list with each decoders slave outputs list through the <> operator
    (decodings.map(_._1), decoder.io.outputs).zipped.foreach(_ <> _)
    (decodings.map(_._2._1), decoder.io.selects).zipped.foreach(_ := _)
    decoder.setPartialName(master, "decoder")
  }
}

class SimpleBusDecoder(busMaster : SimpleBus, decodings: Seq[MaskMapping]) extends Component {
  val io = new Bundle {
    val input = slave(SimpleBus(32, 32))
    val outputs = Vec(master(SimpleBus(32, 32)), decodings.size)
    val selects = out(Vec(Bool(), decodings.size))
    val unmapped = new Bundle {
        val fired = out(Bool())
        val clear = in(Bool())
    }
  }
  val decodeLogic = new Area { 
    /**
      * This is the equivalent of having a when(io.input.SBValid) block in which
      * We check each peripheral in the decodings if the address is targeted by the master
      * through the address line.
      * Where this list is containing a true, the corresponding peripheral is targeted
      */
    val addressMapSelector = Vec(decodings.map(_.hit(io.input.SBaddress) && io.input.SBvalid))
    // connect each "hit at address on valid" to the slaves select line to activate it
    (io.selects, addressMapSelector).zipped.foreach(_ := _)

    // signals from master to slaves
    io.outputs.map(_.SBaddress).foreach(_ := io.input.SBaddress)
    io.outputs.map(_.SBwdata).foreach(_ := io.input.SBwdata)
    io.outputs.map(_.SBwrite).foreach(_ := io.input.SBwrite)
    io.outputs.map(_.SBsize).foreach(_ := io.input.SBsize)
    io.outputs.map(_.SBvalid).foreach(_ := io.input.SBvalid) // maybe & with addressMapSelector.orR
    // signal multiplexed from slaves to master
    io.input.SBrdata := MuxOH(addressMapSelector, Vec(io.outputs.map(_.SBrdata)))
    io.input.SBready := MuxOH(addressMapSelector, Vec(io.outputs.map(_.SBready)))

    // ******** no hit logic (previous no hit peripheral, here simplified) *********
    val noHitReg = Reg(Bool()) init(False)
    io.unmapped.fired := noHitReg
    when(io.input.SBvalid && !addressMapSelector.orR){
      noHitReg := True
    }.elsewhen(io.unmapped.clear){
      noHitReg := False
    }
  }
}
