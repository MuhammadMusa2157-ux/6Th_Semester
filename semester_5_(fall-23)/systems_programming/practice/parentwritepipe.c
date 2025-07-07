#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>

#define BUFFERSIZE 20

int main()
{
    char bufferIn[BUFFERSIZE] = "empty";
    char bufferOut[] = "hello";
    int bytesIn;
    int fd[2];
    pid_t pid;

    if (pipe(fd) == -1)
    {
        perror("Error while creating pipe.\n");
        return 1;
    }
    bytesIn = strlen(bufferIn);

    if ((pid = fork()) == -1)
    {
        perror("Error while creating a process.\n");
        return 1;
    }
    else if (pid == 0)
        bytesIn = read(fd[0], bufferIn, BUFFERSIZE);
    else
        write(fd[1], bufferOut, strlen(bufferOut) + 1);

    fprintf(stdout, "[%ld]:my bufferIn is {%.*s}, my bufferOut is {%s}\n", (long)getpid(), bytesIn, bufferIn, bufferOut);

    return 0;
}