// A program that blocks and unblocks SIGINT
#include <math.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(void)
{
    int i, repeatFactor = 5;
    sigset_t intMask;
    double calc = 0.00;

    // Empty the set and then add SIGINT to mask
    if ((sigemptyset(&intMask) == -1) || (sigaddset(&intMask, SIGINT) == -1))
    {
        perror("Failed to initialize signal mask set.\n");
        return 1;
    }

    while (1)
    {
        if (sigprocmask(SIG_BLOCK, &intMask, NULL) == -1)
            break;
        fprintf(stderr, "SIGINT signal blocked\n");
        for (i = 0; i <= repeatFactor; i++)
            calc += i; //cos((double)i);
        fprintf(stderr, "Blocked calculation is finished, y = %f\n", calc);

        if (sigprocmask(SIG_UNBLOCK, &intMask, NULL) == -1)
            break;
        fprintf(stderr, "SIGINT signal unblocked\n");
        for (i = 0; i <= repeatFactor; i++)
            calc += i; //cos((double)i);
        fprintf(stderr, "Unblocked calculation is finished, y = %f\n", calc);
    }

    perror("Failed to change signal mask");
    return 1;
}