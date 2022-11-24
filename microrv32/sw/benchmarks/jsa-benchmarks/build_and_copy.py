#!/usr/bin/python3
import sys, os, re, csv, subprocess

variants = ["rv32i", "rv32imc"]

benchmarks = {
                "bubblesort" : ["bubblesort", "bubble"], 
                "fibonacci" : ["fibonacci", "fibo"], 
                "gcd" : ["gcd", "gcd"],
                "matrix-multiply" : ["matrix-multiply", "matrix"] 
            }

def makeAndCopyAllBenches():
    for var in variants:
        print(var)
        for i in os.listdir():
            if(i in benchmarks):
                benchDir = benchmarks[i][0]
                benchName = benchmarks[i][1]
                dumpFile = benchDir+"/"+benchName+".dump"
                processMake = subprocess.run(["make", "-C", benchDir, "hex", "rvArch="+var], capture_output=True, universal_newlines = True)
                # print(processMake)

                processDump = subprocess.run(["make", "-C", benchDir, "dump-code", dumpFile, "rvArch="+var], capture_output=True, universal_newlines = True)
                # print(processDump)

                processWriteDump = subprocess.run(["tee", dumpFile], input=processDump.stdout, capture_output=True, universal_newlines = True)
                # print(processWriteDump)

                processCopyELF = subprocess.run(["cp", benchDir+"/main", "prebuilt/" + var + "/" + benchName + ".elf"], capture_output=True, universal_newlines = True)
                # print(processCopyELF)

                processCopyHEX = subprocess.run(["cp", benchDir+"/"+benchName+".hex", "prebuilt/" + var + "/"], capture_output=True, universal_newlines = True)
                # print(processCopyHEX)

                processCopyDUMP = subprocess.run(["cp", dumpFile, "prebuilt/" + var + "/"], capture_output=True, universal_newlines = True)
                # print(processCopyDUMP)

if __name__ == "__main__":
    makeAndCopyAllBenches()