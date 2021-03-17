#include <stdint.h>
#include <stdio.h>
#include "platform.h"
#include "uart.h"

#include "test.h"

#define DEBUG 0

void bubbleSort(uint32_t array[], uint32_t len);

void bubbleSort(uint32_t array[], uint32_t len) {
	uint32_t i = 0;
	uint32_t j = 0;
	uint32_t tmp;
    for (i = 0; i < len; i++) {
        for (j = 0; j < len - i - 1; j++) {
            if (array[j] > array[j + 1]) {
                tmp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = tmp;
            }
        }
    }
}

int main() {
	// uint32_t arr[] = {5,6,12,123,4,7,1,8876,2}; // rely on arrGen.py and test.h for testdata

	bubbleSort(arr, sizeof(arr)/sizeof(*arr));

	#if DEBUG
		char elBuf[sizeof(arr)/sizeof(*arr)][5];
		// the use of the debug flag will output the result
		// but it will make use of stdio.h and the sprintf function to transform integers into formatted string
		// this will increase the size of the binary drastically, recommended with microrv32-vp only
		for(int i=0; i<sizeof(arr)/sizeof(*arr) ; i++) {
			sprintf(elBuf[i], "%u\t",arr[i]);
			sendString(elBuf[i],5);
		}
		putChr('\n');
	#endif

	return 0;
}