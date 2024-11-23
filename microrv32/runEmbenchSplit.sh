#!/usr/bin/env bash

shopt -s extglob

runBenchmarks() {
    for benchmarkPath in sw/embench-split-prebuilt/!(huffbench|md5sum|qrduino|picojpeg|sglib-combined|tarfind|wikisort); do 
    # for benchmarkPath in sw/embench-split-prebuilt/!(); do
        #~ echo $benchmarkPath
        benchmarkName=$(basename $benchmarkPath)
        echo $benchmarkName
        #~ echo "${benchmarkPath}/${benchmarkName}"
        # make sim_split simROM="${benchmarkPath}/${benchmarkName}"
        make sim_spinal simROM="${benchmarkPath}/${benchmarkName}" variant="rv32i"
    done;
}

runBenchmarks
