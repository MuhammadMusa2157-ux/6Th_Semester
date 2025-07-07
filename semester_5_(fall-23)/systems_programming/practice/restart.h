#include <errno.h>
#include <sys/wait.h>

// A function that restarts wait if interrupted by a signal.
pid_t r_wait(int *stat_loc)
{
    int retval;
    while (((retval = wait(stat_loc)) == -1) && (errno == EINTR))
        ;
    return retval;
}

// The r_close.c function is similar to close except that it restarts itself if interrupted by a signal.
int r_close(int fd)
{
    int retval;
    while (retval = close(fd), retval == -1 && errno == EINTR)
        ;
    return retval;
}