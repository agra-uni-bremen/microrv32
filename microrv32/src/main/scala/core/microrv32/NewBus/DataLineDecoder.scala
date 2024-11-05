// The SimpleBusDecoder has multiple tasks/responsibilties: 
// It interconnects all components, CPU, memory and peripherals with each other. 
// In order to do so, each component of the slave side is passed as a list consisting of the bus interface of the respective component, 
// it select signal and its address range described as 'MaskMapping'.

package Peripheral

import spinal.core._
import spinal.lib._
import spinal.lib.IMasterSlave
import spinal.lib.bus.misc._
import spinal.lib.slave
import spinal.lib.master

import Bus._

class DataLineDecoder (decodings:Seq[MaskMapping]) extends Component {
    //'decodings: Seq[MaskMapping]' means that the 'decoding' parameter is a sequence of 'MaskMaping' obejects.
    val io = new Bundle {
        val LineDF = slave(DataBus(32, 32))
        val LineDM = Vec(master(DataBus(32, 32)), decodings.size)
        val selects = out (Vec(Bool(), decodings.size))
        val unmapped = new Bundle {
            val fired = out (Bool()) //indicate if the address is not in the range of MaskMapping
            val clear = in (Bool())
        }
    }

    //Selects generating module
    val decodeLogic = new Area {
        //'map' means function to every elements in 'decodings' and produces an intermidiate or new colletion,(_) means every elements inside the sequence.
        //Every element is object 'MapMapping', 'hit' is a function to every 'MaskMapping', to check if the DBaddress is in the range
        //After checking each MaskMappping, which is the address allocation to different peripherals, Bool type is returned in every checking. 
        //Then until 'valid' get accessible that final outcome is combined as a new sequence, with ordered Bool type.
        //Under normal conditions, none of the elements is True or only one element is True.
        //'decodings.map(_.hit(io.LineDF.DBaddress) && io.LineDF.DBvalid)' produces a sequence of Bool values. 
        //'addressMapSelector' is a vec of bool type.(Vec is ordered.)
        //Vec can be seen a SpinalHDL's Seq, but the parameter defined at the class must be the data type in the Scala.
        val addressMapSelector = Vec(decodings.map(_.hit(io.LineDF.DBaddress)))
        // val addressMapSelector = Vec(decodings.map(_.hit(io.LineDF.DBaddress) & io.LineDF.DBvalid))

        //Now need to assign parrally, where each element in addressMapSelector is assigned to the corresponding element in io.selects.
        //The .zipped method in Scala is used to combine two Vec[Bool] objects into a single iterable of pairs (tuples).
        //.zipped will create an iterable of pairs: (io.selects(0), addressMapSelector(0)), (io.selects(1), addressMapSelector(1)), (io.selects(2), addressMapSelector(2))... and so on.
        //The .foreach method iterates over each pair of elements produced by .zipped.
        //Actually it is a loop that assigning each value from addressMapSelector to the corresponding element in io.selects.
        (io.selects, addressMapSelector).zipped.foreach(_ := _)

        //Now connecting the internal bus signals.
        //The signals from masters' out to slaves' in are directly wired.
        // .map is a method that used in ordered collection. It won't modify the original vec, but create an intermediate collection.
        // In this case, the .map function extracts the 'LineDF.ioaddress' field from each element in 'io.LineDM', then results in a new sequence containigt fields of each element in 'io.ouput'.
        // So in this codes, the value of 'io.LineDF.DBaddress' is directly assigned to each 'DBaddress' filed in the 'io.output',
        // instead of create a new collection that only copy the signal or port.
        io.LineDM.map(_.DBaddress).foreach(_ := io.LineDF.DBaddress)
        io.LineDM.map(_.DBwdata).foreach(_ := io.LineDF.DBwdata)
        io.LineDM.map(_.DBwrite).foreach(_ := io.LineDF.DBwrite)
        io.LineDM.map(_.DBsize).foreach(_ := io.LineDF.DBsize)
        io.LineDM.map(_.DBvalid).foreach(_ := io.LineDF.DBvalid)

        //The signals from slaves' out to masters' in should be selected by selects signal. Mux will inplemented to choose.
        //MuxOH uses One-Hot code to multiplex signals.
        io.LineDF.DBrdata := MuxOH(addressMapSelector, Vec(io.LineDM.map(_.DBrdata)))
        io.LineDF.DBready := MuxOH(addressMapSelector, Vec(io.LineDM.map(_.DBready)))

        //When address is not in the range or artificially halt
        //.orR is used to perform a bitwise OR reduction on  all the elements of the Vec.
        //It reduces all the bits across the entire 'Vec' by OR'ing them together.
        when(io.LineDF.DBvalid && !addressMapSelector.orR){ //Requesting, but address is out of the whole range
            io.unmapped.fired := True
        }.elsewhen(io.unmapped.clear){ 
            io.unmapped.fired := False
        } otherwise {
            io.unmapped.fired := False
        }
    } 
}

// Creating a bigger instantiated component of above class.
// The object below extends its ports, directly complete the wire connecting to CPU master(DataMemIF) and peripheral slaves, 
// instead of waiting for wire connecting until TopLevel.
// Besides, it's better for adapting the 'busMapping' module in TopLevel. 
// By constructing hardware component with broader range, 'busMapping' ArrayBuffer module in TopLevel can be directly applied in DataLineDecoder object.
object DataLineDecoder {
    //'apply' method in Scala allows to define how an object should be constructed. In this case, 'apply' is used to create a 'SimpleBusDecoder' object.
    def apply (CPUmasterDF:DataBus, decodings:Seq[(DataBus, (Bool, MaskMapping))]): DataLineDecoder = {
        val decoder = new DataLineDecoder(decodings.map(_._2._2))
        CPUmasterDF <> decoder.io.LineDF
        (decodings.map(_._1), decoder.io.LineDM).zipped.foreach(_ <> _)
        (decodings.map(_._2._1), decoder.io.selects).zipped.foreach(_ := _)
        decoder.setPartialName(CPUmasterDF, "decoder")
    }
}