#!/bin/bash

# (time for file in sw/benchmarks/jsa-benchmarks/prebuilt/rv32i/*.elf;do (time microrv32-vp --intercept $file) &> ~/Seafile/WiMi-Share/jsa-exp/data/tmp/vp/rv32i/${file##*/}.log; done) &> ~/Seafile/WiMi-Share/jsa-exp/data/tmp/vp/rv32i/total_opt.log

# (time for file in sw/benchmarks/jsa-benchmarks/prebuilt/rv32i/*.elf;do (time microrv32-vp --intercept --use-dmi --tlm-global-quantum 1000 $file) &> ~/Seafile/WiMi-Share/jsa-exp/data/tmp/vp-opt/rv32i/${file##*/}.log; done) &> ~/Seafile/WiMi-Share/jsa-exp/data/tmp/vp-opt/rv32i/total_opt.log

# (time for file in sw/benchmarks/jsa-benchmarks/prebuilt/rv32imc/*.elf;do (time microrv32-vp --intercept $file) &> ~/Seafile/WiMi-Share/jsa-exp/data/tmp/vp/rv32imc/${file##*/}.log; done) &> ~/Seafile/WiMi-Share/jsa-exp/data/tmp/vp/rv32imc/total_opt.log

# (time for file in sw/benchmarks/jsa-benchmarks/prebuilt/rv32imc/*.elf;do (time microrv32-vp --intercept --use-dmi --tlm-global-quantum 1000 $file) &> ~/Seafile/WiMi-Share/jsa-exp/data/tmp/vp-opt/rv32imc/${file##*/}.log; done) &> ~/Seafile/WiMi-Share/jsa-exp/data/tmp/vp-opt/rv32imc/total_opt.log

variantArray=("rv32i" "rv32imc")
simArray=("vp" "vp-opt" "rtl")
for sim in ${simArray[*]}; do
    for variant in ${variantArray[*]}; do
        echo $variant $sim
        if [ $sim = "vp" ]
        then
            for file in sw/benchmarks/jsa-benchmarks/prebuilt/$variant/*.elf; do
                echo "Runnning " ${file##*/}
                (time microrv32-vp --intercept $file) &> ./jsa-exp/bench/$sim/$variant/${file##*/}.log
            done
        fi
        if [ $sim = "vp-opt" ]
        then
            for file in sw/benchmarks/jsa-benchmarks/prebuilt/$variant/*.elf; do
                echo "Runnning " ${file##*/}
                (time microrv32-vp --intercept --use-dmi --tlm-global-quantum 1000 $file) &> ./jsa-exp/bench/$sim/$variant/${file##*/}.log
            done
        fi
        if [ $sim = "rtl" ]
        then
            for file in sw/benchmarks/jsa-benchmarks/prebuilt/$variant/*.hex; do
                echo "Runnning " ${file##*/}
                (time make sim_spinal simROM="$file" variant="$variant") &> ./jsa-exp/bench/$sim/$variant/${file##*/}.log
            done
        fi
    done;
done;