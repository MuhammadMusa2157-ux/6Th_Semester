// Question # 04:  Write a program that implements FTP Server. Client requests for the contents of a specific directory. Server responds with the list of files/directories.
// Client Code...

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/select.h>

#define BUFF_SIZE 128

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf(stderr, "Need one arguments. Usage:\n%s DIRECTORY_PATH\n", argv[0]);
        return 1;
    }
    int fifo = mkfifo("fifo", S_IRWXU);
    int fd = open("fifo", O_RDWR, S_IRWXU);
    if ((fifo == -1) && (errno != EEXIST))
    {
        perror("Error: While creating the fifo.\n");
        return 1;
    }
    char buff[BUFF_SIZE];
    strcpy(buff, argv[1]);
    int wd = write(fd, buff, strlen(buff));
    sleep(4);
    fd_set readSet;
    FD_ZERO(&readSet);
    FD_SET(fd, &readSet);
    int nrfd = select(fd + 1, &readSet, NULL, NULL, NULL);
    while (1)
    {
        FD_ZERO(&readSet);
        FD_SET(fd, &readSet);
        if (FD_ISSET(fd, &readSet))
        {
            for (;;)
            {
                int rd = read(fd, buff, BUFF_SIZE);
                if (rd == 0)
                    break;
                int wr = write(STDOUT_FILENO, buff, rd);
            }
            break;
        }
    }
}

// Coded with ❤ by Aimal Khan.