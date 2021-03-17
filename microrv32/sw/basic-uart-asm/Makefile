all : uart.o
	riscv32-unknown-elf-ld uart.o -o main -T link.ld
	
sim: all
	riscv-vp main
	
uart.o : uart.S
	riscv32-unknown-elf-as uart.S -o uart.o -march=rv32i -mabi=ilp32
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main
	
hex: all
	../elf2bin.py ./main uart.hex 0x0190
	
clean:
	rm -f main uart.o
