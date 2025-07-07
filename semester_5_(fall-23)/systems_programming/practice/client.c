// Client process to make a request to server using FIFO.
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>

#define PERMISSIONS S_IRWXU | S_IRWXO | S_IRWXG
#define BUFFERSIZE 256

int main(void)
{
    // 1. Create a fifo if it is not created.
    int fifo = mkfifo("./fifo", PERMISSIONS);
    if (fifo == -1 && errno != EEXIST)
    {
        fprintf(stderr, "[%ld]:failed to create named pipe fifo: %s\n", (long)getpid(), strerror(errno));
        return 1;
    }

    // 2. Open the fifo
    fifo = open("fifo", O_RDWR);
    if (fifo == -1)
    {
        fprintf(stderr, "[%ld]:failed to open named pipe fifo for read/write: %s\n", (long)getpid(), strerror(errno));
        return 1;
    }

    // 3. Write request to fifo and read response from fifo
    char *request = "Time ?";
    char buff[BUFFERSIZE];
    int bytesRead, bytesWrite;

    bytesWrite = write(fifo, request, strlen(request) + 1);
    if (bytesWrite == -1)
    {
        fprintf(stderr, "[%ld]:failed to write to fifo: %s\n", (long)getpid(), strerror(errno));
        return 1;
    }
    printf("Content wrote to FIFO: %s\n", request);

    sleep(3);

    bytesRead = read(fifo, buff, BUFFERSIZE);
    if (bytesRead == -1)
    {
        fprintf(stderr, "[%ld]:failed to read from fifo: %s\n", (long)getpid(), strerror(errno));
        return 1;
    }

    printf("Content of FIFO: %s\n", buff);
    // 4. Close fifo
    if(close(fifo) == -1){
        perror("Error while closing the fifo.\n");
        return 1;
    }

    return 0;
}