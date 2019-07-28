#include <stdio.h>

int binarySearch(int list[], int length, int item) {
    int iLow = 0;
    int iHigh = length - 1;
    int iMid;
    while (iLow <= iHigh) {
        iMid = (iLow + iHigh) / 2;
        int guess = list[iMid];
        if (guess == item) return iMid;
        if (guess > item) iHigh = iMid - 1;
        else iLow = iMid + 1;
    }
    return -1;
}