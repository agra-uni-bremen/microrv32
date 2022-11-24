rvArch?=rv32i

all : sum.o
	riscv32-unknown-elf-ld sum.o -o main -T link.ld --print-memory-usage 
	
sim: all 
	microrv32-vp --intercept-syscalls main
	
sum.o : sum.S
	riscv32-unknown-elf-as sum.S -o sum.o -march=$(rvArch) -mabi=ilp32 --statistics
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D -Mno-aliases -Mnumeric main
	
hex: all
	../elf2bin.py ./main basic-asm.hex
	
clean:
	rm -f main sum.o
