// Question # 08: Write a program that creates a child process. Child process shall send “N” SIGUSR1 or SIGUSR2 to parent process. Parent process shall count the number of SIGUSR2 received.

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

int count = 0;

void signalHandler(int signo)
{
    // printf("%d signal received.\n", signo);
    if (signo == SIGUSR1)
    {
        count++;
    }
}

int main(void)
{
    struct sigaction act;
    act.sa_handler = signalHandler;
    act.sa_flags = 0;

    if ((sigemptyset(&act.sa_mask) == -1) || (sigdelset(&act.sa_mask, SIGUSR1) == -1) || (sigdelset(&act.sa_mask, SIGINT) == -1))
    {
        perror("Error in setting up mask.\n");
        return 1;
    }

    sigaction(SIGUSR1, &act, NULL);

    pid_t pid = fork();
    if (pid == -1)
    {
        perror("Error while creating the process.\n");
        return 1;
    }
    else if (pid == 0)
    {
        for (int i = 1; i < 12; i++)
        {

            kill(getppid(), SIGUSR1);
            sleep(1);
        }

        exit(0);
    }

    wait(NULL);

    printf("count = %d\n", count);

    return 0;
}

// Coded with ❤ by Aimal Khan.