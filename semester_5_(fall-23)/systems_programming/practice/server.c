// Server process to send a response to client using FIFO.
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include<time.h>

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

    // 3. Read request from fifo and write response to fifo
    char buff[BUFFERSIZE];
    int bytesRead, bytesWrite;
    time_t t = time(NULL);
    char* response = ctime(&t);

    bytesRead = read(fifo, buff, BUFFERSIZE);
    if (bytesRead == -1)
    {
        fprintf(stderr, "[%ld]:failed to read from fifo: %s\n", (long)getpid(), strerror(errno));
        return 1;
    }
    printf("Content of FIFO read by server: %s\n", buff);
        
    bytesWrite = write(fifo, response, strlen(response) + 1);
    if (bytesWrite == -1)
    {
        fprintf(stderr, "[%ld]:failed to write to fifo: %s\n", (long)getpid(), strerror(errno));
        return 1;
    }
    printf("Content wrote to FIFO by SERVER: %s\n", response);

    return 0;
}