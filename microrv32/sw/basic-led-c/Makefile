all : main.c bootstrap.S
	riscv32-unknown-elf-gcc bootstrap.S main.c -o main -march=rv32i -mabi=ilp32 -nostartfiles -Wl,--no-relax -T link.ld
	
sim: all
	riscv-vp --intercept-syscalls main
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main
	
dump-comment: all
	objdump -s --section .comment main

hex: all
	../elf2bin.py main led-c.hex 0x4020
    
clean:
	rm -f main

.PHONY: all sim dump-elf dump-code dump-comment hex clean