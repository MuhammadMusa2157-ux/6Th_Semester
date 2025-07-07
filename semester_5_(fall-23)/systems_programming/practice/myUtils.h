#include <unistd.h>
#include "./restart.h"

#define BLKSIZE 1024

// A simplified implementation of copyfile that uses r_read and r_write.
/* int copyfile(int fromfd, int tofd)
{
    char buf[BLKSIZE];
    int bytesread, byteswritten;
    int totalbytes = 0;
    for (;;)
    {
        if ((bytesread = r_read(fromfd, buf, BLKSIZE)) <= 0)
            break;
        if ((byteswritten = r_write(tofd, buf, bytesread)) == -1)
            break;
        totalbytes += byteswritten;
    }
    return totalbytes;
} 
*/

void initializeRandomArray(int* array, int length){
    srand(time(NULL)); // used before rand to generate random numbers.

    // initialize the array with random numbers. (can also be done with multi threads).
    for (int i = 0; i < length; i++)
        array[i] = rand() % 1000;
}