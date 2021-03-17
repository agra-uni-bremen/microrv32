all : cssrTest.o
	riscv32-unknown-elf-ld cssrTest.o -o main -T link.ld
	
sim: all
	riscv-vp main
	
cssrTest.o : cssrTest.S
	riscv32-unknown-elf-as cssrTest.S -o cssrTest.o -march=rv32i -mabi=ilp32
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main

hex: all
	../elf2bin.py ./main cssrTest.hex
	
clean:
	rm -f main csr.o
