// Question # 07: Write a program for parallel array addition. The program must create 3 child processes and each child should calculate the sum of the one-third (1/3) of arrayelements. Parent process shall receive the sum calculated by each child, add them to get final sum and then display it. Make sure there are no orphan child processes.You can use pipes, fifos or return value of child processes for Inter Process Communication.

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>
#include <time.h>

#define ARRAY_SIZE 99
#define PROCS_COUNT 3
#define BUFF_SIZE 128

void initArray(int *array, const int length)
{
    srand(time(NULL)); // used before rand to generate random numbers.
    for (int i = 0; i < length; i++)
        array[i] = rand() % 100;
}

int main(void)
{
    int sum = 0, list[ARRAY_SIZE], fd[2], readBytes;
    pid_t pid;
    char buff[BUFF_SIZE];

    if (pipe(fd) == -1)
    {
        perror("Error while creating pipe.\n");
        return 1;
    }

    initArray(list, ARRAY_SIZE);

    for (int i = 0; i < PROCS_COUNT; i++)
    {
        pid = fork();
        if (pid == -1)
        {
            perror("Error while creating the process.\n");
            return 1;
        }
        else if (pid == 0)
        {
            int localSum = 0;
            int start = i * ARRAY_SIZE / PROCS_COUNT;
            int end = (i + 1) * ARRAY_SIZE / PROCS_COUNT;
            for (int j = start; j < end; j++)
                localSum += list[j];
            printf("\tThe local sum of child %d is: %d\n", i, localSum);
            // write local sum to pipe.
            sprintf(buff, "%d", localSum);
            if (write(fd[1], buff, strlen(buff)) == -1)
            {
                perror("Error while writing to pipe.\n");
                return 1;
            }
            return 0;
        }
        else
        {
            wait(NULL);

            // read sum from pipe
            readBytes = read(fd[0], buff, BUFF_SIZE);
            if (readBytes == -1)
            {
                perror("Error while reading from pipe.\n");
                return 1;
            }
            buff[readBytes] = '\0';
            sum += atoi(buff);
        }
    }
    printf("The sum of array is: %d\n", sum);

    if ((close(fd[0]) == -1) || (close(fd[1]) == -1))
    {
        perror("Error while closing the pipe.\n");
        return 1;
    }
    return 0;
}

// Coded with ❤ by Aimal Khan.