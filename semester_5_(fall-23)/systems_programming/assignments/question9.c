// Question # --:

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{

    if (argc != 3)
    {
        fprintf(stderr, "Need -- arguments. Usage:\n%s [OPTIONAL] [-l | FILE_NAME]\n", argv[0]);
        return 1;
    }

    return 0;
}

// Coded with ❤ by Aimal Khan.