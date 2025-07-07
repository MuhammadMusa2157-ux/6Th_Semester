// Question # 11:  Write a multithreaded program for parallel file copying. Open both source files in master thread before creating threads.

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <pthread.h>
#include <sys/stat.h>

#define MAX_CHAR 256

struct threadCopyFileArgs
{
    int srcFile;
    int destFile;
};

void *threadCopyFile(void *arg)
{
    struct threadCopyFileArgs myArgs = *((struct threadCopyFileArgs *)arg);

    char buff[MAX_CHAR];
    int readBites, writeBites;

    while (1)
    {
        if ((readBites = read(myArgs.srcFile, buff, MAX_CHAR)) == -1)
        {
            fprintf(stderr, "Something went wrong while reading from the src file: %d due to %s\n", myArgs.srcFile, strerror(errno));
            return NULL;
        }

        if ((writeBites = write(myArgs.destFile, buff, readBites)) == -1)
        {
            fprintf(stderr, "Something went wrong while writing to the dist file: %d due to %s\n", myArgs.destFile, strerror(errno));
            return NULL;
        }

        if (readBites == 0)
            break;
    }

    printf("Copy completed from %d to %d\n", myArgs.srcFile, myArgs.destFile);
}

int main(int argc, char *argv[])
{

    if ((argc % 2 == 0) || (argc == 1))
    {
        fprintf(stderr, "Usage:\n%s SRC_FILE DST_FILE [SRC_FILE DST_FILE...]", argv[0]);
        return 1;
    }

    int fds[argc - 1];

    // open the files:
    for (int i = 1; i < argc; i++)
    {
        if (i % 2 != 0)
        { // 1. open sourc file (for reading only)
            if ((fds[i - 1] = open(argv[i], O_RDONLY)) == -1)
            {
                fprintf(stderr, "Something went wrong while opening the source file: %s due to %s\n", argv[1], strerror(errno));
                return 1;
            }
        }
        else
        { // 2. open destination file if not present create it (for writing only)
            if ((fds[i - 1] = open(argv[i], O_WRONLY | O_CREAT | O_APPEND, S_IRWXU | S_IRWXG | S_IRWXO)) == -1)
            {
                fprintf(stderr, "Something went wrong while opening the destination file: %s due to %s\n", argv[2], strerror(errno));
                return 1;
            }
        }
    }

    // create threads for each pair...
    int threadsCount = (argc - 1) / 2;
    pthread_t tid[threadsCount];
    struct threadCopyFileArgs thArgs;

    for (int i = 0; i < threadsCount; i++)
    {
        thArgs.srcFile = fds[2 * i];
        thArgs.destFile = fds[2 * i + 1];

        pthread_create(&tid[i], NULL, threadCopyFile, (void *)&thArgs);
    }

    for (int i = 0; i < threadsCount; i++)
    {
        pthread_join(tid[i], NULL);
    }

    // close all files:
    for (int i = 0; i < argc - 1; i++)
        if (close(fds[i]) == -1)
        {
            perror("error while closing the file.");
            return 1;
        }

    return 0;
}

// Coded with ❤ by Aimal Khan.