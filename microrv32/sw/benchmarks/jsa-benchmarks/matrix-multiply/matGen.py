#!/usr/bin/env python3
'''
Script is used to generate two (square) matrices (each is a M-by-M matrix (default: M=5)) with random shuffled numbers between -NMAX and +NMAX (default: 20)
Use:

python3 matGen.py > test.h

or

for 30-by-30 matrices:
python3 matGen.py 30 > test.h 

for 30-by-30 matrices with random numbers between +-5
python3 matGen.py 30 5 > test.h (generates 100 shuffled numbers instead +-20)

'''
import random
import sys

MMAX_DEFAULT = 5
NMAX_DEFAULT = 20

MMAX = MMAX_DEFAULT
NMAX = NMAX_DEFAULT
if len(sys.argv) == 2:
    MMAX = int(sys.argv[1])
elif len(sys.argv) == 3:
    MMAX = int(sys.argv[1])
    NMAX = int(sys.argv[2])
elif len(sys.argv) > 3:
    raise Exception("Too many arguments")
linemax = 10

prehead = "//generated testdata from matGen.py\n" + "#define MATSIZE " + str(MMAX) + "\n"
prearrayA = "int32_t matA[MATSIZE][MATSIZE] = {"
prearrayB = "int32_t matB[MATSIZE][MATSIZE] = {"
postArray = "};\n"
post = "//end of generated testdata"

matA = [[random.randint(-NMAX,+NMAX) for j in range(MMAX)] for i in range(MMAX)]
print(prehead)
print(prearrayA)
i = 0
for element in matA:
    print("\t{ ", end='')
    for num in element:
        print(str(num),end='')
        i+=1
        if i%MMAX != 0:
            print(", ",end='')
    print("},")
print(postArray)

matB = [[random.randint(-NMAX,+NMAX) for j in range(MMAX)] for i in range(MMAX)]
print(prearrayB)
i = 0
for element in matB:
    print("\t{ ", end='')
    for num in element:
        print(str(num),end='')
        i+=1
        if i%MMAX != 0:
            print(", ",end='')
    print("},")
print(postArray)

print("/*")
print("for easy checking, as nested list (usable in many tools that can do matrix multiplication)\n\n")
print(matA)
print("")
print(matB)
print("*/")