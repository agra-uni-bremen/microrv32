#!/usr/bin/python3
import sys, os, re, csv
from unittest import result

def makeHX8KCSV(dir):
    LC_MAX = 7680
    RAM_MAX = 32
    resultEntry = {
                    'lc[absolute]' :'',
                    'lc[percent]' : '', 
                    'mem[absolute]' : '', 
                    'mem[percent]' : '', 
                    'f_max' : '',
                    'synth time' : '',
                    'pnr time' : ''
                }
    regexLC = re.compile("(?<=(ICESTORM\_LC\:))(\s+((\d+)\/\s+\d+\s+(\d+\%)))")
    regexMEM = re.compile("(?<=(ICESTORM\_RAM\:))(\s+((\d+)\/\s+\d+\s+(\d+\%)))")
    regexFMax = re.compile("\d+.\d+ MHz(?=\s\()")
    regexSTime = re.compile("((\d+:)\d+\.\d+\s)(?=(real))")
    regexPTime = re.compile("((\d+:)\d+\.\d+\s)(?=(real))")
    
    with open(dir+"/pnr_stat.log", 'r') as f:
        lines = f.readlines()
        for line in lines:
            matchedLC = regexLC.search(line)
            matchedMem = regexMEM.search(line)
            matchedFMax = regexFMax.search(line)
            if(matchedLC != None):
                splitLC = re.split(r"[\s/]",re.sub(r'\s+',' ',matchedLC.group().strip()))
                resultEntry['lc[absolute]'] = splitLC[0]
                resultEntry['lc[percent]'] = splitLC[-1]
            if(matchedMem != None):
                splitMem = re.split(r"[\s/]",re.sub(r'\s+',' ',matchedMem.group().strip()))
                resultEntry['mem[absolute]'] = splitMem[0]
                resultEntry['mem[percent]'] = splitMem[-1]
            if(matchedFMax != None):
                splitFMax = re.split(r"[\s/]",matchedFMax.group())
                resultEntry['f_max'] = splitFMax[0]
    with open(dir+"/time_synth.log", 'r') as f:
        lines = f.readlines()
        for line in lines:
            matchedTime = regexSTime.search(line)
            if(matchedTime != None):
                resultEntry['synth time'] = matchedTime.group()
    with open(dir+"/time_pnr.log", 'r') as f:
        lines = f.readlines()
        for line in lines:
            matchedTime = regexPTime.search(line)
            if(matchedTime != None):
                resultEntry['pnr time'] = matchedTime.group()
    # write CSV for folder
    with open(dir+"summary.csv", "w") as csvfile:
        filewriter = csv.writer(csvfile, delimiter=',', quotechar='"',
                                quoting=csv.QUOTE_MINIMAL, lineterminator="\n")
        # header
        filewriter.writerow(['Description', 'Value'])
        # entries
        filewriter.writerow(['Slice (Logic Area)', 
                            (resultEntry['lc[absolute]'] + " / " + str(LC_MAX) + " (" + resultEntry['lc[percent]'] + ")")
                        ])
        filewriter.writerow(['Memory (BRAM)',
                            (resultEntry['mem[absolute]'] + " / " + str(RAM_MAX) + " (" + resultEntry['mem[percent]'] + ")")
                        ])
        filewriter.writerow(['f_max [MHz]',resultEntry['f_max']])
        filewriter.writerow(['Synth Time [M:s.ms]',resultEntry['synth time']])
        filewriter.writerow(['PnR Time [M:s.ms]',resultEntry['pnr time']])

def makeECP5CSV(dir):
    LUT_MAX = 83640
    DFF_MAX = 83640
    RAM_MAX = 41820
    RAMW_MAX = 20910
    SLICE_MAX = 41820

    resultEntry = {
                    'total slices[absolute]' :'',
                    'total slices[percent]' :'',
                    'total luts[absolute]' :'',
                    'total luts[percent]' :'',
                    'logic luts[absolute]' : '', 
                    'logic luts[percent]' : '', 
                    'carry luts[absolute]' : '', 
                    'carry luts[percent]' : '',
                    'total dff[absolute]' : '', 
                    'total dff[percent]' : '', 
                    'ram luts[absolute]' : '', 
                    'ram luts[percent]' : '', 
                    'ramw luts[absolute]' : '', 
                    'ramw luts[percent]' : '', 
                    'f_max' : '',
                    'synth time' : '',
                    'pnr time' : ''
                }
    regexSlice = re.compile("(?<=(TRELLIS\_SLICE\:))(\s+((\d+)\/\s*\d+\s+(\d+\%)))")
    regexTotLuts = re.compile("(?<=(Total LUT4s\:))(\s+((\d+)\/\s*\d+\s+(\d+\%)))")
    regexTotLogic = re.compile("(?<=(logic LUTs\:))(\s+((\d+)\/\s*\d+\s+(\d+\%)))")
    regexTotCarry = re.compile("(?<=(carry LUTs\:))(\s+((\d+)\/\s*\d+\s+(\d+\%)))")
    regexDFFs = re.compile("(?<=(Total DFFs\:))(\s*((\d+)\/\s*\d+\s+(\d+\%)))")
    regexRAM = re.compile("(?<=(RAM LUTs\:))(\s*((\d+)\/\s*\d+\s+(\d+\%)))")
    regexRAMW = re.compile("(?<=(RAMW LUTs\:))(\s*((\d+)\/\s*\d+\s+(\d+\%)))")
    regexFMax = re.compile("\d+.\d+ MHz(?=\s\()")
    regexSTime = re.compile("((\d+:)\d+\.\d+\s)(?=(real))")
    regexPTime = re.compile("((\d+:)\d+\.\d+\s)(?=(real))")
    
    with open(dir+"/pnr_stat.log", 'r') as f:
        lines = f.readlines()
        for line in lines:
            matchedSlice = regexSlice.search(line)
            matchedTotLuts = regexTotLuts.search(line)
            matchedLogic = regexTotLogic.search(line)
            matchedCarry = regexTotCarry.search(line)
            matchedDFFs = regexDFFs.search(line)
            matchedRAM = regexRAM.search(line)
            matchedRAMW = regexRAMW.search(line)
            matchedFMax = regexFMax.search(line)
            if(matchedSlice != None):
                splitSlice = re.split(r"[\s/]",re.sub(r'\s+',' ',matchedSlice.group().strip()))
                resultEntry['total slices[absolute]'] = splitSlice[0]
                resultEntry['total slices[percent]'] = splitSlice[-1]
            if(matchedTotLuts != None):
                splitTotLuts = re.split(r"[\s/]",re.sub(r'\s+',' ',matchedTotLuts.group().strip()))
                resultEntry['total luts[absolute]'] = splitTotLuts[0]
                resultEntry['total luts[percent]'] = splitTotLuts[-1]
            if(matchedLogic != None):
                splitTotLogic = re.split(r"[\s/]",re.sub(r'\s+',' ',matchedLogic.group().strip()))
                resultEntry['logic luts[absolute]'] = splitTotLogic[0]
                resultEntry['logic luts[percent]'] = splitTotLogic[-1]
            if(matchedCarry != None):
                splitTotCarry = re.split(r"[\s/]",re.sub(r'\s+',' ',matchedCarry.group().strip()))
                resultEntry['carry luts[absolute]'] = splitTotCarry[0]
                resultEntry['carry luts[percent]'] = splitTotCarry[-1]
            if(matchedDFFs != None):
                splitDFF = re.split(r"[\s/]",re.sub(r'\s+',' ',matchedDFFs.group().strip()))
                resultEntry['total dff[absolute]'] = splitDFF[0]
                resultEntry['total dff[percent]'] = splitDFF[-1]
            if(matchedRAM != None):
                splitRAM = re.split(r"[\s/]",re.sub(r'\s+',' ',matchedRAM.group().strip()))
                resultEntry['ram luts[absolute]'] = splitRAM[0]
                resultEntry['ram luts[percent]'] = splitRAM[-1]
            if(matchedRAMW != None):
                splitRAMW = re.split(r"[\s/]",re.sub(r'\s+',' ',matchedRAMW.group().strip()))
                resultEntry['ramw luts[absolute]'] = splitRAMW[0]
                resultEntry['ramw luts[percent]'] = splitRAMW[-1]
            if(matchedFMax != None):
                splitFMax = re.split(r"[\s/]",matchedFMax.group())
                resultEntry['f_max'] = splitFMax[0]
    with open(dir+"/time_synth.log", 'r') as f:
        lines = f.readlines()
        for line in lines:
            matchedTime = regexSTime.search(line)
            if(matchedTime != None):
                resultEntry['synth time'] = matchedTime.group()
    with open(dir+"/time_pnr.log", 'r') as f:
        lines = f.readlines()
        for line in lines:
            matchedTime = regexPTime.search(line)
            if(matchedTime != None):
                resultEntry['pnr time'] = matchedTime.group()
    # write CSV for folder
    with open(dir+"summary.csv", "w") as csvfile:
        filewriter = csv.writer(csvfile, delimiter=',', quotechar='"',
                                quoting=csv.QUOTE_MINIMAL, lineterminator="\n")
        # header
        filewriter.writerow(['Description', 'Value'])
        # entries
        filewriter.writerow(['Slices (Logic Area)', 
                            (resultEntry['total slices[absolute]'] + " / " + str(SLICE_MAX) + " (" + resultEntry['total slices[percent]'] + ")")
                        ])
        filewriter.writerow(['Total LUTs (Logic Area)', 
                            (resultEntry['total luts[absolute]'] + " / " + str(LUT_MAX) + " (" + resultEntry['total luts[percent]'] + ")")
                        ])
        filewriter.writerow(['Logic LUTs (Logic Area)', 
                            (resultEntry['logic luts[absolute]'] + " / " + str(LUT_MAX) + " (" + resultEntry['logic luts[percent]'] + ")")
                        ])
        filewriter.writerow(['Carry LUTs (Logic Area)', 
                            (resultEntry['carry luts[absolute]'] + " / " + str(LUT_MAX) + " (" + resultEntry['carry luts[percent]'] + ")")
                        ])
        filewriter.writerow(['Total DFFs', 
                            (resultEntry['total dff[absolute]'] + " / " + str(DFF_MAX) + " (" + resultEntry['total dff[percent]'] + ")")
                        ])
        filewriter.writerow(['RAM LUTs (Logic Area)', 
                            (resultEntry['ram luts[absolute]'] + " / " + str(RAM_MAX) + " (" + resultEntry['ram luts[percent]'] + ")")
                        ])
        filewriter.writerow(['RAMW LUTs (Logic Area)', 
                            (resultEntry['ramw luts[absolute]'] + " / " + str(RAMW_MAX) + " (" + resultEntry['ramw luts[percent]'] + ")")
                        ])
        filewriter.writerow(['f_max [MHz]',resultEntry['f_max']])
        filewriter.writerow(['Synth Time [M:s.ms]',resultEntry['synth time']])
        filewriter.writerow(['PnR Time [M:s.ms]',resultEntry['pnr time']])

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Error, wrong number of arguments!")
    else:
        mode = sys.argv[1]
        expDir = sys.argv[2]
        if mode == "hx8k":
            makeHX8KCSV(expDir)
        elif mode == "ecp5":
            makeECP5CSV(expDir)
        else:
            print("Error wrong mode argument!")