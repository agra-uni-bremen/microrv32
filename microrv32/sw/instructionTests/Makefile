all : instr.o
	riscv32-unknown-elf-ld instr.o -o main -T link.ld
	
sim: all
	riscv-vp main
	
instr.o : instr.S
	riscv32-unknown-elf-as instr.S -o instr.o -march=rv32i -mabi=ilp32
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main
	
hex: all
	../elf2bin.py ./main instr.hex 0x0800
clean:
	rm -f main instr.o
