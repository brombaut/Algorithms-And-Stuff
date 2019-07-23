#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include "quickSort.h"


void printList(int *list, int n) {
  printf("List: ");
  for (int i = 0; i < n; i++) {
    printf("%d ", list[i]);
  }
  printf("\n");
}


int main() {
  int list[] = {
    4,
    7,
    2,
    9,
    1,
    2,
    0,
    8,
    4,
    2
  };
  int n = sizeof(list) / sizeof(list[0]);
  double total_time;
	clock_t start, end;
  printList(list, n);
	start = clock();
	srand(time(NULL));
  quickSort(list, 0, n - 1);
  end = clock();
  total_time = ((double) (end - start));
  printList(list, n);
  printf("Time taken is: %f\n", total_time);
  return 0;
}