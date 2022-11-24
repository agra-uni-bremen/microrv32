#include <stdint.h>
#include <stdio.h>
#include "platform.h"
#include "uart.h"

#include "test.h"

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
	bubbleSort(arr, sizeof(arr)/sizeof(*arr));
	return 0;
}