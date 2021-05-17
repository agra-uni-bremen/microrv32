all : timer.o
	riscv32-unknown-elf-ld timer.o -o main -T link.ld
	
sim: all
	riscv-vp main
	
timer.o : timer.S
	riscv32-unknown-elf-as timer.S -o timer.o -march=rv32i -mabi=ilp32
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -Mnumeric -D --visualize-jump -w -l main
	
hex: all
	../elf2bin.py ./main timer.hex 0x4020
	
clean:
	rm -f main timer.o
