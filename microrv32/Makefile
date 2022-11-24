simROM = sw/basic-led-blink/blink.hex
synthROM = sw/basic-led-blink/blink.hex
variant ?= rv32imc

sim_spinal:
	sbt "runMain core.microrv32.MicroRV32TopSim $(simROM) $(variant)" 

sim_spinal_freeRTOS-tasks-1:
	sbt "runMain core.microrv32.MicroRV32TopSim sw/freeRTOS-prebuilt/simple-tasks/riscv-main.hex"

sim_spinal_freeRTOS-tasks-2:
	sbt "runMain core.microrv32.MicroRV32TopSim sw/freeRTOS-prebuilt/simple-tasks-2/riscv-main.hex"

sim_spinal_freeRTOS-queues-1:
	sbt "runMain core.microrv32.MicroRV32TopSim sw/freeRTOS-prebuilt/simple-queues/riscv-main.hex"

sim_spinal_freeRTOS-queues-2:
	sbt "runMain core.microrv32.MicroRV32TopSim sw/freeRTOS-prebuilt/simple-queues-2/riscv-main.hex"

sim_spinal_freeRTOS-standard-demo:
	sbt "runMain core.microrv32.MicroRV32TopSim sw/freeRTOS-prebuilt/standard-demo/riscv-main.hex"

rtl: 
	sbt "runMain core.microrv32.MicroRV32TopVerilog $(synthROM)"

rtl_hx8k: 
	sbt "runMain core.microrv32.MicroRV32TopHX8KVerilog $(synthROM)"

sim_verilog: rtl
	cp rtl/MicroRV32Top.v* vtb/rtl/
	cp rtl/MicroRV32Top.v* vtb/
	make top_sim -C vtb 

synth: rtl 
	cp rtl/MicroRV32Top.v* vtb/rtl/
	cp rtl/MicroRV32Top.v* vtb/
	make top_synth -C vtb

synth_hx8k: rtl_hx8k 
	cp rtl/MicroRV32TopHX8K.v* vtb/rtl/
	cp rtl/MicroRV32TopHX8K.v* vtb/
	make top_synth_hx8k -C vtb

sw_basic-asm:
	make dump-code -C sw/basic-asm > sw/basic-asm/dump.txt
	make hex -C sw/basic-asm

sw_instr:
	make dump-code -C sw/instructionTests > sw/instructionTests/dump.txt
	make hex -C sw/instructionTests

sw_basic-c:
	make dump-code -C sw/basic-c > sw/basic-c/dump.txt
	make hex -C sw/basic-c

sw_cssr-tests:
	make dump-code -C sw/csrTests/ > sw/csrTests/dump.txt
	make hex -C sw/csrTests/
	
sw_led_blink:
	make dump-code -C sw/basic-led-blink/ > sw/basic-led-blink/dump.txt
	make hex -C sw/basic-led-blink/

sw_led_c:
	make dump-code -C sw/basic-led-c/ > sw/basic-led-c/dump.txt
	make hex -C sw/basic-led-c/

sw_uart_asm:
	make dump-code -C sw/basic-uart-asm/ > sw/basic-uart-asm/dump.txt
	make hex -C sw/basic-uart-asm/

sw_timer_irq:
	make dump-code -C sw/basic-timerirq/ > sw/basic-timerirq/dump.txt
	make hex -C sw/basic-timerirq/

sw_crc:
	make dump-code -C sw/crc8/ > sw/crc8/dump.txt
	make hex -C sw/crc8/

sw_gpio2:
	make dump-code -C sw/basic-gpio-2/ > sw/basic-gpio-2/dump.txt
	make hex -C sw/basic-gpio-2/

sw_gpiouart:
	make dump-code -C sw/gpio-uart-1/ > sw/gpio-uart-1/dump.txt
	make hex -C sw/gpio-uart-1/

show_sim_linux:
	gtkwave vtb/sim/spinalhdl_trace.gtkw &

show_sim_win:
	gtkwave.exe vtb/sim/spinal_windows.gtkw &

clean:
	rm -f rtl/*.v
	rm -f rtl/*.bin
	rm -rf rtl/jsa-exp/rv32*/*.v
	rm -rf rtl/jsa-exp/rv32*/*.bin
	rm -f simWorkspace/MicroRV32Top/rtl/*.v
	rm -f simWorkspace/MicroRV32Top/rtl/*.bin
	rm -f ./*.v
	rm -f ./*.bin
	make clean -C vtb/

.PHONY: clean rtl sim_verilog synth sw_basic-asm sw_instr sw_basic-c sw_cssr-tests sw_led_blink sw_led_c sw_timer_irq
