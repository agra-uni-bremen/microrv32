#!/bin/bash

exec_vp_sim() {
    echo -e "Executing $1 for vp\n"
    (time microrv32-vp --intercept $1) &> vplog/${1%.elf}.log
    echo -e "Done executing for $1 on vp\n"
}

exec_rtl_sim() {
    echo -e "Executing ${1%.elf} for rtl\n"
    cd ../../
    (time make sim_spinal simROM="./sw/embench-iot-prebuilt/${1%.elf}.hex" variant="rv32i") &> ./sw/embench-iot-prebuilt/rtllog/${1%.elf}.log
    cd sw/embench-iot-prebuilt
    echo -e "Done executing for $1 on rtl\n"
}

for file in *.elf; do
  if [ "${file%.elf}" != "md5sum" ]
  then      
    #echo $file    
    exec_vp_sim $file
    exec_rtl_sim $file
  fi
done;
echo "Done executing all benchmarks!"
