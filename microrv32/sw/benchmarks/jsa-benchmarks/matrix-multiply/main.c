#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "platform.h"

#define DEBUG 0
#include "test.h"

int main() {
	int32_t res[MATSIZE][MATSIZE] = {{ 0 }};
	memset(res, 0, sizeof(res));
	for(int i=0; i<MATSIZE; i++){
		for(int j=0; j<MATSIZE; j++){
			res[i][j] = 0;
			for(int k=0; k<MATSIZE; k++){
				res[i][j] += matA[i][k] * matB[k][j];
			}
		}
	}

	return 0;
}