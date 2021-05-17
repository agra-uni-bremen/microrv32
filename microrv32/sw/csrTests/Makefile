all : csrTest.o
	riscv32-unknown-elf-ld csrTest.o -o main -T link.ld
	
sim: all
	riscv-vp main
	
csrTest.o : csrTest.S
	riscv32-unknown-elf-as csrTest.S -o csrTest.o -march=rv32i -mabi=ilp32
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main

hex: all
	../elf2bin.py ./main csrTest.hex
	
clean:
	rm -f main csr.o
