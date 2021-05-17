/*
 * Simple fibonacci sequence for 8 leds on hx8k devboard for microrv32
 */
unsigned long *led_periph = (unsigned long *)0x81000000;

// 8 binary digits at LED
#define F_MAX 233

int main() {
	// inital values
	unsigned int f_0 = 0;
	unsigned int f_1 = 1;
	unsigned int f_n = 1;
	unsigned int fn1, fn2;
	fn1 = f_0;
	fn2 = f_1;
	while(f_n < F_MAX){
		f_n = fn1 + fn2;
		*led_periph = f_n;
		fn1 = fn2;
		fn2 = f_n;
	}
	*led_periph = 0xff;
	*led_periph = 0x00;
	*led_periph = 0xff;
	*led_periph = 0x00;
	return 0;
}
