/*
 * Benchmark to generate fibonacci numbers
 */
#include <stdint.h>
// amount of fibonacci numbers generated
#define F_N_MAX 6000

int main() {
	// inital values
	uint64_t f_0 = 0;
	uint64_t f_1 = 1;
	uint64_t f_n = 1;
	uint64_t n = 0;
	uint64_t fn1, fn2;
	fn1 = f_0;
	fn2 = f_1;
	while(n <= F_N_MAX){
		f_n = fn1 + fn2;
		fn1 = fn2;
		fn2 = f_n;
		n++;
	}
	return 0;
}
