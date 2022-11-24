#!/bin/bash
mySeed=0



copy_and_execute() { ## $1:directory, $2: seed
    echo -e "Executing synth+pnr for $1 ($2)\n\n"
    rm -f tmp/*.v*
    # copy files from $1 into root dir
    cp -r $1/*.v* tmp/
    make clean
    # run and log into directory $1
    make all_hx8k rndSeed=$2
    # copy all results into $1/exp 
    if [ ! -d $1/exp/$2 ]; then
        mkdir $1/exp/$2
    fi
    cp -r tmp/hx8k $1/exp/$2
    # cp -r tmp/ecp5 $1/exp/$2
    echo -e "Done synth+pnr for $1 ($2)\n\n"
}

make_csv_for_run() { # $1: directory (assume one directory from rtl/rv32i[m|c]/{seedNumber}) to create summary from logs
    # touch $1/summary_hx8k.csv
    hxk8dir=($1/exp)
    # ecp5dir=($1/exp)
    for seedDir in $hxk8dir/*; do
        python3 makecsv.py hx8k $seedDir/hx8k
        # python3 makecsv.py ecp5 $seedDir/ecp5
    done
}

make_csv_for_all(){
    for dir in rtl/*; do
        make_csv_for_run $dir
    done
}

run_seeded_exp(){
    for i in {1..5}
    do
        mySeed=$RANDOM
        for dir in rtl/*; do
            copy_and_execute $dir $mySeed
        done
    done
}


