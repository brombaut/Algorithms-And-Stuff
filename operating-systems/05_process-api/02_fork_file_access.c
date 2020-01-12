#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>

/**
 * Write a program that opens a file (with the open() system call) and then calls fork() 
 * to create a new process. Can both the child and parent access the file descriptor 
 * returned by open()? What happens when they are writing to the file concurrently, 
 * i.e., at the same time?
 */

int main() {
    int rc = fork();
    FILE *fp;
    fp = fopen("./02_file.txt", "a+");
    if (rc < 0) {
        fprintf(stderr, "fork failed\n");
        exit(1);
    } else if (rc == 0) {
        printf("Child (pid:%d)\n", (int) getpid());
        fprintf(fp, "Testing Child...\n");
    } else {              // parent goes down this path (main)
        printf("Parent of %d (pid:%d)\n", rc, (int) getpid());
        fprintf(fp, "Testing Parent...\n");
    }
}