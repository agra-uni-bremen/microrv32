all : sum.o
	riscv32-unknown-elf-ld sum.o -o main -T link.ld
	
sim: all
	riscv-vp main
	
sum.o : sum.S
	riscv32-unknown-elf-as sum.S -o sum.o -march=rv32i -mabi=ilp32
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main
	
hex: all
	../elf2bin.py ./main basic-asm.hex
	
clean:
	rm -f main sum.o
