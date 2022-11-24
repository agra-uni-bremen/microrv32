all : min.S
	riscv32-unknown-elf-gcc min.S -o main -march=rv32imc -mabi=ilp32 -mno-strict-align -nostartfiles -Wl,--no-relax,--print-memory-usage  -T link.ld
	
sim: all
	microrv32-vp --intercept-syscalls main
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D -Mnumeric -Mno-aliases main
	
dump-comment: all
	objdump -s --section .comment main

hex: all
	../elf2bin.py main min.hex 0x10

clean:
	rm -f main
	rm -f *.hex
	rm -f *.log
	rm -f *.dump
