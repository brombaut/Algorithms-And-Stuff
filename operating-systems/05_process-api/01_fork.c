#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

/**
 * Write a program that calls fork(). Before calling fork(), have the main process access a variable (e.g., x) 
 * and set its value to some- thing (e.g., 100). What value is the 
 * variable in the child process? What happens to the 
 * variable when both the child and parent change the value of x?
 */

int main() {
    int x = 100;
    int rc = fork();
    if (rc < 0) {
        fprintf(stderr, "fork failed\n");
        exit(1);
    } else if (rc == 0) {
        printf("Child (pid:%d)\n", (int) getpid());
        printf("Child x=%d\n", x);
        x = 110;
        printf("Child x=%d\n", x);
    } else {              // parent goes down this path (main)
        // int rc_wait = wait(NULL);
        // printf("Parent of %d (rc_wait:%d) (pid:%d)\n", rc, rc_wait, (int) getpid());
        printf("Parent of %d (pid:%d)\n", rc, (int) getpid());
        printf("Parent x=%d\n", x);
        x = 90;
        printf("Parent x=%d\n", x);
    }
}