#include <stdint.h>
#include <stdio.h>
#include "platform.h"
#include "uart.h"
#include "util.h"
#include "init.h"

void wait(uint32_t nOps) {
	for(uint32_t i = 0; i < nOps; i++) {
		asm("nop"); 
	}
}

void printInfo(uint8_t ptn, uint8_t input) {
	char state[3];
	char switches[3];
	const char st[] = "Current state of LEDs: "; 
	const char io[] = "Input on GPIO: "; 
	itoa(ptn, state, 16);
	itoa(input, switches, 16);
	sendString(st, sizeof st);
	sendString(state, 3);
	putChr('\r');putChr('\n');
	sendString(io, sizeof io);
	sendString(switches, 3);
	putChr('\r');putChr('\n');
}

int main(int argc, char **argv) {
	// print header
	initText();
	// vars
	uint8_t pattern = 0x01;
	uint8_t input = 0x00;
	uint8_t pin_0 = 0x00;
	// setup gpio
	*GPIO_BANK_A_DIRECTION_ADDR = 0x00000000; // set all pins to input
	// print init pattern and info
	*LED_ADDR = pattern;
	printInfo(pattern, input);
	wait(70000);
	// run LED loop
	while(1) {
		// read all GPIO pins
		input = *GPIO_BANK_A_INPUT_ADDR;
		// shift from right to left if all pins are 0
		// shift from left to right if any pin is set 1
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
		// output the pattern to the LEDs
		*LED_ADDR = pattern;
		// print the state and inputs onto the UART
		printInfo(pattern, input);
		// wait to slow down execution
		wait(70000);
	}

	return 0;
}
