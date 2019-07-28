#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "binarySearch.h"

int main() {
    int list[] = {
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
    };
    int length = sizeof(list) / sizeof(int);
    double total_time;
        clock_t start, end;
        start = clock();
        srand(time(NULL));
    int result = binarySearch(list, length, 3);
    end = clock();
    total_time = ((double) (end - start));
    printf("Index is: %d\n", result);
    printf("Time taken is: %f\n", total_time);
    return 0;
}