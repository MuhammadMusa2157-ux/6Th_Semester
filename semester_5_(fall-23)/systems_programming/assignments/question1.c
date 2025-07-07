// Question # 01: Write a program that searches for a file passed to it as a command line argument in all the provided paths. Take paths as CLA.
// Mostly same to Lab-9 Task-3.

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/stat.h>
#include <string.h>

void searchFile(const char *target, const char *path)
{
    struct stat entryStatistics;
    struct dirent *directoryEntry;
    DIR *dp;

    // open path(directory)
    if ((dp = opendir(path)) == NULL)
    {
        perror("Error while opening directory.\n");
        return;
    }

    // read the directory entries one by one
    while ((directoryEntry = readdir(dp)) != NULL)
    {
        char newPath[1024];

        // skip . and ..
        if ((!strcmp(directoryEntry->d_name, ".")) || (!strcmp(directoryEntry->d_name, "..")))
            continue;

        // S_ISDIR(entryStatistics.st_mode) ? printf("%s:\n", directoryEntry->d_name) : printf("%s\n", directoryEntry->d_name);
        // update the path by appending the file name with it.
        snprintf(newPath, sizeof(newPath), "%s/%s", path, directoryEntry->d_name);

        if (stat(newPath, &entryStatistics) == -1)
        {
            perror("Error while traversing statistics.\n");
            return;
        }

        if (S_ISDIR(entryStatistics.st_mode)) // if directory search for file in subdirectories.
            searchFile(target, newPath);
        else if (S_ISREG(entryStatistics.st_mode)) // if regular file compare the name of entry and target.
            if (!strcmp(target, directoryEntry->d_name))
                printf("%s/%s\n", path, directoryEntry->d_name);
    }

    if (closedir(dp) == -1)
    {
        perror("Error while opening directory.\n");
        return;
    }

    return;
}

int main(int argc, char *argv[])
{

    if (argc < 3)
    {
        fprintf(stderr, "Need atleast two arguments. Usage:\n%s FILE_NAME DIRECTORY_PATH [DIRECTORY_PATH ...]\n", argv[0]);
        return 1;
    }

    for (int i = 2; i < argc; i++)
    {
        printf("Searching the file '%s' in directory '%s'\n", argv[1], argv[i]);
        searchFile(argv[1], argv[i]);
    }

    return 0;
}

// Coded with ❤ by Aimal Khan.