#!/usr/bin/env bash

shopt -s extglob

synthDesign() {
    designPath=$(basename $1)
    designTop="${designPath%.*}"
    echo $designTop
    yosys -p"read_verilog $1; hierarchy -top $designTop; synth_ice40; write_blif synth/${designTop}.blif; write_json synth/${designTop}.json" -l synth/synth.log
}

pnrDesign() {
    designPath=$(basename $1)
    designTop="${designPath%.*}"
    echo $designTop
    nextpnr-ice40 -l synth/pnr.log --hx8k --package ct256 --json synth/${designTop}.json --pcf-allow-unconstrained --asc synth/${designTop}.asc
}

printStats() {
    grep -A24 "Printing statistics*" synth/synth.log
    grep -A7 "Info: Device utilisation*" synth/pnr.log
    grep "Max frequency for clock *" synth/pnr.log | tail -1
}

synthDesign $1
pnrDesign $1
printStats