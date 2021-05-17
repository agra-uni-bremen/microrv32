#include <stdio.h>
#include <stdlib.h>

#define ARRAY_SIZE 30

//#define ARRAY_SIZE 50000 // default size

int arr[ARRAY_SIZE];

int compare (const void *a, const void *b)
{
    const int *ia = (const int *)a;
    const int *ib = (const int *)b;
    return *ia  - *ib; 
}

int main()
{
	//return 0;
	int val = 1;
	for (size_t i = 0; i < ARRAY_SIZE; i++) {
		arr[i] = val;
		val = ((val * 8191) << 7) ^ val;
	}
	qsort(arr, ARRAY_SIZE, sizeof(int), compare);
	//printf("%u\n", arr[ARRAY_SIZE-1]);
	return 0;
}
