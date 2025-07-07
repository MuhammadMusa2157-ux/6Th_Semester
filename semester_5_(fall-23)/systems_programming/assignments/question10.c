// Question # 10: Write a program that creates 2 threads. Thread 1: Find sum of array elements. Thread 2: Searches for a key in array

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

#define ARRAY_SIZE 100
#define THREADS_COUNT 3

int sum = 0;
int list[ARRAY_SIZE];

void initArray(int *array, const int length)
{
    srand(time(NULL)); // used before rand to generate random numbers.
    for (int i = 0; i < length; i++)
        array[i] = rand() % 100;
}

void *threadSum(void *arg)
{
    int index = *((int *)arg);
    int start = index * ARRAY_SIZE / (THREADS_COUNT - 1);
    int end = start + index * (ARRAY_SIZE / (THREADS_COUNT - 1) - 1);

    int lsum = 0;

    for (int i = start; i < end; i++)
        lsum += list[i];

    sum += lsum;
}

void *threadSearch(void *arg)
{
    int target = *((int *)arg);
    int *found = malloc(sizeof(int));
    *found = -1;
    for (int i = 0; i < ARRAY_SIZE; i++)
        if (list[i] == target)
        {
            *found = i;
            pthread_exit((void *)found);
        }
    pthread_exit((void *)found);
}

int main(int argc, char *argv[])
{
    pthread_t tid[THREADS_COUNT];

    initArray(list, ARRAY_SIZE);

    for (int i = 0; i < THREADS_COUNT - 1; i++)
        pthread_create(&tid[i], NULL, threadSum, (void *)&i);

    int key = rand() % 200;
    pthread_create(&tid[2], NULL, threadSearch, (void *)&key);

    for (int i = 0; i < THREADS_COUNT - 1; i++)
        pthread_join(tid[i], NULL);

    int *isFound;
    pthread_join(tid[2], (void *)&isFound);

    printf("The Sum is: %d.\n", sum);
    (*isFound == -1)
        ? printf("The key: %d is not found\n", key)
        : printf("The key: %d is found at: %d\n", key, *isFound);

    return 0;
}

// Coded with ❤ by Aimal Khan.