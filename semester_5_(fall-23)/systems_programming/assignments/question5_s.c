// Question # 05:  Write a program that implements a simple FTP Server. Client requests for a file and server responds with the contents of the file. Client shall receive the contents and display on STD_OUT.
// Server code

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/select.h>
#include <dirent.h>

int main()
{
    int mkffo = mkfifo("fifo", S_IRWXU);
    int fd = open("fifo", O_RDWR, S_IRWXU);
    char buff[20], message[100];
    int rd = read(fd, buff, 20);
    int fd2 = open(buff, O_RDONLY);
    int rd1 = read(fd2, message, 100);
    write(fd, message, rd);
}

// Coded with ❤ by Aimal Khan.