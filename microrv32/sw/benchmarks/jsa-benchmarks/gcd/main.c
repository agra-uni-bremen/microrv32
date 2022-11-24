/*
 * Benchmark with greatest common divisor
 */
#include <stdint.h>

int gcd(int a, int b);

int gcd(int a, int b) {
	int res;
	if(a == 0) {
		res = b;
	}
	while(b != 0) {
		if(a > b) {
			a = a - b;
		}
		else {
			b = b - a;
		}
	}
	return res;
}

int main() {
	// a big value difference causes lots of iterations
	uint32_t a1 = 1000000;
	uint32_t b1 = 1;
	uint32_t result;
	result = gcd(a1, b1);
	return 0;
}
