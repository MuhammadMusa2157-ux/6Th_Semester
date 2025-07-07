#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>

#define BUFFERSIZE 20

int main()
{
    char buffer[BUFFERSIZE] = "empty";
    // char bufferOut[] = "hello";
    int bytes;
    int fd[2];
    pid_t pid;

    if(pipe(fd) == -1){
        perror("Failed to create fork.\n");
        return -1;
    }

    if ((pid = fork()) == -1)
    {
        perror("Failed to fork.\n");
        return 1;
    }
    else if (pid == 0)
    {
        // Read from stdin via child and pass it to pipe.
        bytes = read(STDIN_FILENO, buffer, BUFFERSIZE);
        write(fd[0], buffer, bytes);

        sleep(3);

        bytes = read(fd[1], buffer, BUFFERSIZE);
        write(STDOUT_FILENO, buffer, bytes);

    }
    else
    {
        bytes = read(fd[1], buffer, BUFFERSIZE);
        write(STDOUT_FILENO, buffer, bytes);

        sleep(3);
        bytes = read(STDIN_FILENO, buffer, BUFFERSIZE);
        write(fd[0], buffer, bytes);
    }

    return 0;
}