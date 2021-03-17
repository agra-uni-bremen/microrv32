This work was supported in part by the German Federal Ministry of Education and Research (BMBF) within the project Scale4Edge under contract no.~16ME0127 and within the project VerSys under contract no.~01IW19001.simROM = sw/basic-led-blink/blink.hex
sim_spinal:
	sbt "runMain core.microrv32.MicroRV32TopSim $(simROM)"

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
	sbt "runMain core.microrv32.MicroRV32TopVerilog"

sim_verilog: rtl
	cp rtl/MicroRV32Top.v vtb/rtl/MicroRV32Top.v
	cp rtl/MicroRV32Top.v_toplevel_cpu_regs_regFile.bin vtb/MicroRV32Top.v_toplevel_cpu_regs_regFile.bin
	cp rtl/MicroRV32Top.v_toplevel_ram_memRam_*.bin vtb/MicroRV32Top.v_toplevel_ram_memRam_*.bin
	make top_sim -C vtb 

synth: rtl 
	cp rtl/MicroRV32Top.v vtb/rtl/MicroRV32Top.v
	cp rtl/MicroRV32Top.v_toplevel_cpu_regs_regFile.bin vtb/MicroRV32Top.v_toplevel_cpu_regs_regFile.bin
	cp rtl/MicroRV32Top.v_toplevel_ram_memRam_*.bin vtb/
	make top_synth -C vtb

sw_basic-asm:
	make dump-code -C sw/basic-asm > sw/basic-asm/dump.txt
	make hex -C sw/basic-asm

sw_instr:
	make dump-code -C sw/instructionTests > sw/instructionTests/dump.txt
	make hex -C sw/instructionTests

sw_basic-c:
	make dump-code -C sw/basic-c > sw/basic-c/dump.txt
	make hex -C sw/basic-c

sw_csr-tests:
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

#show_sim_linux:
#	gtkwave vtb/sim/spinalhdl_trace.gtkw &
#
#show_sim_win:
#	gtkwave.exe vtb/sim/spinal_windows.gtkw &

clean:
	rm rtl/*.v
	rm rtl/*.bin
	rm simWorkspace/MicroRV32Top/rtl/*.v
	rm simWorkspace/MicroRV32Top/rtl/*.bin
	make clean -C vtb/

.PHONY: clean rtl sim_verilog synth sw_basic-asm sw_instr sw_basic-c sw_csr-tests sw_led_blink sw_led_c sw_timer_irq
