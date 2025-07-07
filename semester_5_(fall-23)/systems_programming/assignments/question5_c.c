// Question # 05:  Write a program that implements a simple FTP Server. Client requests for a file and server responds with the contents of the file. Client shall receive the contents and display on STD_OUT.
// Client code

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/select.h>

int main(int argc, char *argv[])
{
    int mkffo = mkfifo("fifo", S_IRWXU);
    int fd = open("fifo", O_RDWR, S_IRWXU);
    if (mkffo == -1 && errno != EEXIST)
        perror("Error: ");
    char buff[20], message[100];
    strcpy(buff, "f0.txt");
    int wd = write(fd, buff, 20);
    sleep(1);
    int rd = read(fd, message, 100);

    int wr = write(1, message, rd);
}

// Coded with ❤ by Aimal Khan.