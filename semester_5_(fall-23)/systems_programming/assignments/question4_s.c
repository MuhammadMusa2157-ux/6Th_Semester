// Question # 04:  Write a program that implements FTP Server. Client requests for the contents of a specific directory. Server responds with the list of files/directories.
// Server Code...

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/select.h>
#include <dirent.h>

#define BUFF_SIZE 128

int main()
{
    int mkffo = mkfifo("fifo", S_IRWXU);
    int fd = open("fifo", O_RDWR, S_IRWXU);
    if ((fifo == -1) && (errno != EEXIST))
    {
        perror("Error: While creating the fifo.\n");
        return 1;
    }
    char buff[BUFF_SIZE];
    int rd = read(fd, buff, BUFF_SIZE);
    struct dirent *entry;
    DIR *folder;
    folder = opendir(buff);
    while ((entry = readdir(folder)))
    {
        write(fd, entry->d_name, strlen(entry->d_name));
        write(fd, "\n", 1);
    }
}

// Coded with ❤ by Aimal Khan.