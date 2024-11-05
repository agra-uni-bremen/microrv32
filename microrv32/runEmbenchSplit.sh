#!/usr/bin/env bash

shopt -s extglob

runBenchmarks() {
    for benchmarkPath in sw/embench-split-prebuilt/!(huffbench|md5sum|qrduino|picojpeg|sglib-combined|tarfind|wikisort); do
        #~ echo $benchmarkPath
        benchmarkName=$(basename $benchmarkPath)
        echo $benchmarkName
        #~ echo "${benchmarkPath}/${benchmarkName}"
        make sim_split simROM="${benchmarkPath}/${benchmarkName}"
    done;
}

runBenchmarks
