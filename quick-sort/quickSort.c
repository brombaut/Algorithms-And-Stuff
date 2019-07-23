#include "quickSort.h"
#include <stdio.h>

int* quickSort(int *list, int low, int high) {
  if (low < high) { 
    int partitionIndex = partition(list, low, high);
    quickSort(list, low, partitionIndex - 1); // Quicksort lower portion of array
    quickSort(list, partitionIndex + 1, high); // Quicksort higher portion of array
  }
  return list;
}

int partition(int *list, int low, int high) {
  int pivot = list[high]; // Select the last element to be the pivot
  int i = (low - 1);
  for(int j = low; j < high; j++) { // Loop through the array from low to high index
    // If value is less than pivot, swap the value with the value at the index
    // that is 1 above the lower portion of the array
    if (list[j] <= pivot) {
      i++;
      swap(list, i, j); 
    }
  } 
  swap(list, i + 1, high); // Put the pivot value in the middle of the array
  return (i + 1); // Return the index of the pivots
}

void swap(int *list, int x, int y) {
  int temp = list[x];
  list[x] = list[y];
  list[y] = temp;
}