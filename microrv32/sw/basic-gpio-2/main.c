#include <stdint.h>
#include <stdio.h>
#include "platform.h"
#include "uart.h"
#include "util.h"
//#include "gpio.h"
void wait(uint32_t nOps) {
	for(uint32_t i = 0; i < nOps; i++) {
		asm("nop"); 
	}
}

int main(int argc, char **argv) {
	// var
	uint8_t pattern = 0x01;
	uint8_t input = 0x00;
	uint8_t pin_0 = 0x00;
	// setup gpio
	*GPIO_BANK_A_DIRECTION_ADDR = 0x00000000; // set all pins to input
	
	while(1) {
		input = *GPIO_BANK_A_INPUT_ADDR;
		//pin_0 = input;	
		// shift from right to left
		if(input == 0) {
			if(pattern == 0x80) {
				pattern = 0x01;	
			} else {
				pattern = pattern << 1;
			} 
		} else {
			if(pattern == 0x01) {
				pattern = 0x80;	
			} else {
				pattern = pattern >> 1;
			} 
		}
		*LED_ADDR = pattern;
		wait(70000);
	}

	return 0;
}
