//MaskMapping used to define the different address ranges

package core.microrv32.bus

import spinal.core._
import spinal.lib._
import spinal.lib.IMasterSlave
import spinal.lib.bus.misc._

object SimpleBusDecoder {
  //'decodings' is a sequence. Each element in sequence is a tuple. 
  //Tuple itself consists of two parts: 'SimpleBus' and another tuple.
  //Another Tuple consists of two parts: Bool and MaskMapping object

  //'apply' method in Scala allows to define how an object should be constructed. In this case, 'apply' is used to create a 'SimpleBusDecoder' object.
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
  //'decodings: Seq[MaskMapping]' means that the 'decoding' parameter is a sequence of 'MaskMaping' obejects.
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
    // .map is a method that used in ordered collection. It won't modify the original vec, but create an intermediate collection.
    // In this case, the .map function extracts the 'SBaddress' field from each element in 'io.outputs', then results in a new sequence containigt fields of each element in 'io.ouput'.
    // So in this codes, the value of 'io.input.SBaddress' is directly assigned to each 'SBaddress' filed in the 'io.output',
    // instead of create a new collection that only copy the signal or port.
    io.outputs.map(_.SBaddress).foreach(_ := io.input.SBaddress)
    io.outputs.map(_.SBwdata).foreach(_ := io.input.SBwdata)
    io.outputs.map(_.SBwrite).foreach(_ := io.input.SBwrite)
    io.outputs.map(_.SBsize).foreach(_ := io.input.SBsize)
    io.outputs.map(_.SBvalid).foreach(_ := io.input.SBvalid) // maybe & with addressMapSelector.orR
    // signal multiplexed from slaves to master
    //MuxOH uses One-Hot code to multiplex signals.
    io.input.SBrdata := MuxOH(addressMapSelector, Vec(io.outputs.map(_.SBrdata)))
    io.input.SBready := MuxOH(addressMapSelector, Vec(io.outputs.map(_.SBready)))

    // ******** no hit logic (previous no hit peripheral, here simplified) *********
    val noHitReg = Reg(Bool()) init(False)
    io.unmapped.fired := noHitReg
    //.orR is used to perform a bitwise OR reduction on  all the elements of the Vec.
    //It reduces all the bits across the entire 'Vec' by OR'ing them together.
    //Once the 'not Hit' happened, the signal will keep True, unless clear signal is activated, the signal will back to False again
    //To the InterfaceController, the 'unmapped' signal will keep active, and every subsequent request will be skipped. The skip will end one the decoder receives the 'clear' signal
    when(io.input.SBvalid && !addressMapSelector.orR){
      noHitReg := True
    }.elsewhen(io.unmapped.clear){ //Dot '.' here is very important and the meaning is totally different if deleted
      noHitReg := False
    }
  }
}
