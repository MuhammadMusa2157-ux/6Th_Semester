// Question # 06: Write a program for continuous communication (2-Way) between parent & child process using pipes

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#define BUFF_SIZE 256

int main(void)
{
    int fd1[2], fd2[2];
    pid_t pid;
    int again = 1;
    int readBytes, writeBytes;
    char buff[BUFF_SIZE];

    if ((pipe(fd1) == -1) || (pipe(fd2) == -1))
    {
        perror("Error while creating a pipe\n");
        return 1;
    }

    pid = fork();
    if (pid == -1)
    {
        perror("Error while creating a process.\n");
        return 1;
    }

    while (again)
    {
        if (pid == 0)
        {
            // process 1 (child) should send a message
            printf("\t CHILD-[%ld]\t", (long)getpid());
            readBytes = read(STDIN_FILENO, buff, BUFF_SIZE);
            if (readBytes == -1)
            {
                fprintf(stderr, "C-[%ld]: Error while reading from STDIN.\n", (long)getpid());
                return 1;
            }
            writeBytes = write(fd1[1], buff, readBytes);
            if (writeBytes == -1)
            {
                fprintf(stderr, "C-[%ld]: Error while writing to pipe.\n", (long)getpid());
                return 1;
            }

            // It should receive a reply.
            readBytes = read(fd2[0], buff, BUFF_SIZE);
            if (readBytes == -1)
            {
                fprintf(stderr, "C-[%ld]: Error while reading from pipe.\n", (long)getpid());
                return 1;
            }
            writeBytes = write(STDOUT_FILENO, buff, readBytes);
            if (writeBytes == -1)
            {
                fprintf(stderr, "C-[%ld]: Error while writing to STDOUT.\n", (long)getpid());
                return 1;
            }

            // should continue?
            printf("Do you want to continue chat? Enter a number!\n 1. YES\n 2. NO\n");
            scanf("%d", &again);
            if (again != 1)
                break;
        }

        else
        {
            // process 2 (parent) should reply to the a message
            // It should receive a reply.
            printf("PARENT-[%ld]\t", (long)getpid());
            readBytes = read(fd1[0], buff, BUFF_SIZE);
            if (readBytes == -1)
            {
                fprintf(stderr, "P-[%ld]: Error while reading from pipe.\n", (long)getpid());
                return 1;
            }
            writeBytes = write(STDOUT_FILENO, buff, readBytes);
            if (writeBytes == -1)
            {
                fprintf(stderr, "P-[%ld]: Error while writing to STDOUT.\n", (long)getpid());
                return 1;
            }

            readBytes = read(STDIN_FILENO, buff, BUFF_SIZE);
            if (readBytes == -1)
            {
                fprintf(stderr, "P-[%ld]: Error while reading from STDIN.\n", (long)getpid());
                return 1;
            }
            writeBytes = write(fd2[1], buff, readBytes);
            if (writeBytes == -1)
            {
                fprintf(stderr, "C-[%ld]: Error while writing to pipe.\n", (long)getpid());
                return 1;
            }

            // should continue?
            printf("Do you want to continue chat? Enter a number!\n 1. YES\n 2. NO\n");
            scanf("%d", &again);
            if (again != 1)
                break;
        }
    }

    if (pid != 0)
        wait(NULL);
    printf("Process [%ld] leaved the chat....", (long)getpid());
    return 0;
}

// Coded with ❤ by Aimal Khan.