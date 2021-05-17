
all : dhrystone.c dhrystone_main.c crt.S
	riscv32-unknown-elf-gcc dhrystone.c dhrystone_main.c crt.S -O3 -o main -T clib.ld -nostartfiles
	
sim-opt : all
	microrv32-vp --use-dmi --tlm-global-quantum=10000 main
	
sim-normal : all
	microrv32-vp main
	
native : dhrystone.c dhrystone_main.c
	gcc dhrystone.c dhrystone_main.c -O3 -o native-main
	
dump-elf: all
	riscv32-unknown-elf-readelf -a main
	
dump-code: all
	riscv32-unknown-elf-objdump -D main
	
dump-asm: all
	riscv32-unknown-elf-objdump -s main
	
clean:
	rm -f main native-main
