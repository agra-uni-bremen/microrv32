#!/usr/bin/env python3
'''
Script is used to generate array with random shuffled numbers between 0 and NMAX (default: 40)
Use:

python3 arrGen.py > test.h

or

python3 arrGen.py 100 > test.h (generates 100 shuffled numbers instead 40)

'''
import random
import sys

NMAX_DEFAULT = 40
NMAX = NMAX_DEFAULT
if len(sys.argv) == 2:
    NMAX = int(sys.argv[1])
linemax = 15

prehead = "//generated testdata from arrGen.py\n" + "#define ARRAYSIZE " + str(NMAX) + "\n"
prearray = "uint32_t arr[ARRAYSIZE] = {"
post = "\n};\n//end of generated testdata"

nums = [i for i in range(NMAX)]
shufNums = nums.copy()
random.shuffle(shufNums)

print(prehead)
print(prearray)
i = 0
for element in shufNums:
    print(str(element) + ", ",end='')
    i+=1
    if i%linemax == 0:
        print("\n")
print(post)