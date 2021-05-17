all : blink.o
	riscv32-unknown-elf-ld blink.o -o main -T link.ld
	
sim: all
	riscv-vp main
	
blink.o : blink.S
	riscv32-unknown-elf-as blink.S -o blink.o -march=rv32i -mabi=ilp32
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main
	
hex: all
	../elf2bin.py ./main blink.hex 0x0190
	
clean:
	rm -f main blink.o
