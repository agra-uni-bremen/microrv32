rvArch?=rv32imc
all : main.c bootstrap.S
	riscv32-unknown-elf-gcc bootstrap.S main.c -o main -march=$(rvArch) -mabi=ilp32 -mstrict-align -nostartfiles -Wl,--no-relax,--print-memory-usage  -T link.ld
	
sim: all
	microrv32-vp --intercept-syscalls main
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main
	
dump-comment: all
	objdump -s --section .comment main

hex: all
	../../../elf2bin.py main gcd.hex
    
clean:
	rm -f main

.PHONY: all sim dump-elf dump-code dump-comment hex clean