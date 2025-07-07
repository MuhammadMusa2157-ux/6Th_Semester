// A program that multiply a large array as well as finding a number too by using task level parallelism approach using multi-threading

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include "./myUtils.h"

#define ARRAY_SIZE 100
#define THREADS_COUNT 3

int array[ARRAY_SIZE] = {};
long int globalProduct = 1;

// thread to find product of array element.
void *thread_product(void *arg)
{
    int index = *((int *)arg);
    long int *localProduct = malloc(sizeof(long int));
    *localProduct = 1;

    int start = index * 50;//ARRAY_SIZE / (THREADS_COUNT - 1);
    int end = start + 49; // * ARRAY_SIZE / (THREADS_COUNT - 1) -1;

    for (int i = start; i < end; i++)
        *localProduct += array[i];

    return (void *)localProduct;
}

// thread to find a key in array and return its index else -1.
void *thread_find(void *arg)
{
    int key = *((int *)arg);
    int *found = malloc(sizeof(int));
    *found = -1;

    for (int i = 0; i < ARRAY_SIZE; i++)
        if (array[i] == key)
        {
            *found = i;
            pthread_exit((void *)found);
        }

    pthread_exit((void *)found);
}

int main()
{
    pthread_t threadIds[THREADS_COUNT] = {};
    int *prod[THREADS_COUNT - 1];
    int *isFound;

    initializeRandomArray(array, ARRAY_SIZE);

    // create threads
    for (int i = 0; i < THREADS_COUNT - 1; i++)
        pthread_create(&threadIds[i], NULL, thread_product, (void *)&i);
    int key = 196; // The key you want to find
    pthread_create(&threadIds[2], NULL, thread_find, (void *)&key);

    // joining the threads and calculating the global product
    for (int i = 0; i < THREADS_COUNT - 1; i++)
    {
        pthread_join(threadIds[i], (void *)&prod[i]);
        globalProduct *= *prod[i];
        free(prod[i]); // Free memory allocated in thread_product
    }
    pthread_join(threadIds[2], (void *)&isFound);

    printf("The product of array is: %ld\n", globalProduct);
    printf("The key is found at index: %d\n", *isFound);
    free(isFound);

    return 0;
}
