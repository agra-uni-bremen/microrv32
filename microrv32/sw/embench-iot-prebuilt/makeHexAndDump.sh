#!/bin/bash

for file in *.elf; do
    echo $file to ${file%.elf}.hex and ${file%.elf}.dump
    ../../elf2bin.py $file ${file%.elf}.hex
    riscv32-unknown-elf-objdump -D -Mnumeric -Mno-aliases $file &> ${file%.elf}.dump
    echo ''
done;