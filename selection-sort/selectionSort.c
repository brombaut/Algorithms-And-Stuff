#include "selectionSort.h"
#include <stdio.h>

int* selectionSort(int *list, int n) {
    for (int i = 0; i < n; i++) {
        int smallestIndex = i;
        for (int j = i + 1; j < n; j++) {
        if (list[j] < list[smallestIndex]) {
            smallestIndex = j;
        }
        }
        swap(list, i, smallestIndex);
    }
    return list;
}

void swap(int *list, int x, int y) {
    int temp = list[x];
    list[x] = list[y];
    list[y] = temp;
}