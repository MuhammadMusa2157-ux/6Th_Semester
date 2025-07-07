// A program that sum a large array by using data level parallelism approach using multi-threading

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <sys/types.h>
#include "./myUtils.h"

#define ARRAY_SIZE 100
#define THREADS_COUNT ARRAY_SIZE / 10

int array[ARRAY_SIZE] = {};
int globalSum = 0;

void *thread_sum(void *arg)
{
    int localSum = 0, index = *((int *)arg);
    int start = index * ARRAY_SIZE / THREADS_COUNT;
    int end = start + 10;

    for (int i = start; i < end; i++)
        localSum += array[i];

    globalSum += localSum;
}

int main()
{

    pthread_t threadIds[THREADS_COUNT] = {};

    initializeRandomArray(array, ARRAY_SIZE);

    // create threads
    for (int i = 0; i < THREADS_COUNT; i++)
        pthread_create(&threadIds[i], NULL, thread_sum, (void *)&i);

    // joining the threads
    for (int i = 0; i < THREADS_COUNT; i++)
        pthread_join(threadIds[i], NULL);

    printf("The sum of array is: %d\n", globalSum);

    return 0;
}