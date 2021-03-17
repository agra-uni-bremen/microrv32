// package core.microrv32

// import spinal.core._
// import spinal.lib.slave
// import spinal.lib._

// //Hardware definition
// class GPIO() extends Component{
//     val io = new Bundle{
//         val sb = slave(SimpleBus(32,32))
//         val gpio = inout(Bits(8 bits))
//         val sel = in(Bool)
//     }   
//     val rdy = Bool
//     // config & exec registers
//     val direction = Reg(Bool) init(False) // RW
//     val debounce_ena = Reg(Bool) init(False) // RW
//     val debounce_sampleTime = Reg(UInt(32 bits)) init(0) // RW
//     val debounce_doubleSamples = Reg(Bool) init(False) // RW
//     val gpio_out_val = Reg(Bits(8 bits)) init(0) // RW
//     val gpio_in_val = Reg(Bits(8 bits)) init(0) // RO

//     val samplerLogic = new Area{
//         val count = Reg(UInt(32 bits)) init(0)
//         val tick = Bool
//         tick := False
//         when(!debounce_ena){
//             count := 0
//         }.otherwise{
//             count := count + 1
//             when(count === debounce_sampleTime){
//                 count := 0
//                 tick := True
//             }
//         }
//     }

//     val gpioLogic = new Area{
//         // sample and debounce into outVal
//         val inSamples = History(that = io.gpio, when = samplerLogic.tick, length = 32)
//         val sampledVal = Mux(debounce_doubleSamples, MajorityVote(inSamples), MajorityVote(inSamples))
//         val inSync = RegNextWhen(io.gpio,debounce_ena)
//         // choose between debounced value and single clocked value from GPIO in
//         val mux_in_val = Mux(debounce_ena, sampledVal, inSync)
//         gpio_in_val := direction ? mux_in_val | B(0, 32 bits)
//         io.gpio := direction ? gpio_out_val | B(0, 32 bits)
//     }

//     val busLogic = new Area{
//         val intAddr = UInt(4 bits)
//         intAddr := io.sb.SBaddress(3 downto 0)
//         val read = io.sb.SBvalid && io.sel && !io.sb.SBwrite
//         val write = io.sb.SBvalid && io.sel && io.sb.SBwrite
//         // register logic
//         io.sb.SBrdata := 0 // default value
//         when(write){
//             when(intAddr === 0){
//                 gpio_out_val := io.sb.SBwdata(7 downto 0)
//             }.elsewhen(intAddr === 1){
//                 // cant write to gpio_in_val, read-only register
//             }.elsewhen(intAddr === 2){
//                 direction := io.sb.SBwdata(0)
//             }.elsewhen(intAddr === 3){
//                 debounce_ena := io.sb.SBwdata(0)
//             }.elsewhen(intAddr === 4){
//                 debounce_sampleTime := io.sb.SBwdata.asUInt
//             }.elsewhen(intAddr === 5){
//                 debounce_doubleSamples := io.sb.SBwdata(0)
//             }
//         }.elsewhen(read){
//             when(intAddr === 0){
//                 io.sb.SBrdata := B(gpio_out_val,32 bits)
//             }.elsewhen(intAddr === 1){
//                 io.sb.SBrdata := B(gpio_in_val,32 bits)
//             }.elsewhen(intAddr === 2){
//                 io.sb.SBrdata := B(direction,32 bits)
//             }.elsewhen(intAddr === 3){
//                 io.sb.SBrdata := B(debounce_ena,32 bits)
//             }.elsewhen(intAddr === 4){
//                 io.sb.SBrdata := B(debounce_sampleTime,32 bits)
//             }.elsewhen(intAddr === 5){
//                 io.sb.SBrdata := B(debounce_doubleSamples,32 bits)
//             }
//         }
//         // bus ready signal
//         rdy := False
//         when((read | write) & io.sel){
//             rdy := True
//         }
//         io.sb.SBready := rdy
//     }
// }