all : mul.o
	riscv32-unknown-elf-ld mul.o -o main -T link.ld
	
sim: all
	riscv-vp main
	
mul.o : mul.S
	# requires riscv gnu toolchain for m-extension
	riscv32-unknown-elf-as mul.S -o mul.o -march=rv32im -mabi=ilp32
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main
	
hex: all
	../elf2bin.py ./main mul.hex 0x4020
	
clean:
	rm -f main mul.o
