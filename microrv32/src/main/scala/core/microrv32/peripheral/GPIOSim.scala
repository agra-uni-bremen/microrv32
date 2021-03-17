// package core.microrv32

// import spinal.core._
// import spinal.sim._
// import spinal.core.sim._

// import scala.util.Random

// object GPIOSim {
//   def main(args: Array[String]) {
//     SimConfig
//       .withWave
//       .compile(new GPIO())
//       .doSim{dut =>
        
//         def read(addr : Int):Bits = {
//           dut.io.sb.SBaddress #= addr
//           dut.io.sb.SBvalid #= true
//           dut.io.sb.SBwdata #= 0
//           dut.io.sb.SBwrite #= false
//           dut.clockDomain.waitRisingEdge()
//           dut.io.sb.SBaddress #= 0
//           dut.io.sb.SBvalid #= true
//           dut.io.sb.SBrdata
//         }
//         def write(addr : Int, value : Int){
//           dut.io.sb.SBaddress #= addr
//           dut.io.sb.SBvalid #= true
//           dut.io.sb.SBwdata #= value
//           dut.io.sb.SBwrite #= true
//           dut.clockDomain.waitRisingEdge()
//         }

//         dut.clockDomain.forkStimulus(period = 83)
//         var dutRunning = false
//         var simSteps : Int = 0
//         var maxsimSteps : Int = 150

//         // starting values
//         dut.io.sb.SBaddress #= 0
//         dut.io.sb.SBvalid #= false
//         dut.io.sb.SBwdata #= 0
//         dut.io.sb.SBwrite #= false
//         dut.io.sb.SBsize #= 4
//         dut.io.sel #= true

//         dut.clockDomain.waitRisingEdge()
//         write(0, 0x0000FFFF)
//         var a = read(0)
//         var c = read(1)
//         var b = read(2)
//         println(a)
//         write(1, 0x00000001)
//         dut.clockDomain.waitRisingEdge()
//         dut.io.gpio #= 0x01
//         dut.clockDomain.waitRisingEdge()
//         dut.io.gpio #= 0x02
//         dut.clockDomain.waitRisingEdge()
//         dut.io.gpio #= 0x03
//         dut.clockDomain.waitRisingEdge()
        
//         while(simSteps <= maxsimSteps){
//           //Wait a rising edge on the clock
//           dut.clockDomain.waitRisingEdge()
//           simSteps += 1
//         }

//       }
//   }
// }