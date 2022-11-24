#!/bin/bash
for var in ./*/; do 
	for file in $var*.elf; do 
		echo $file; 
		echo $(($(riscv32-unknown-elf-objdump -D $file -j .text -j .sdata -j .rodata -j .eh_frame -j .sbss -j .data -j .bss -j .heap -j .stack  | awk 'NF' | wc -l)-2))
	done; 
done
