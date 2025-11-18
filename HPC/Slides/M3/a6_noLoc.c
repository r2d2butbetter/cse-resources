#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define NUM_THREADS 5
#define ITERATIONS 1000000

int shared_counter = 0; // Shared resource

void *increment_counter(void *arg) {
    for (int i = 0; i < ITERATIONS; i++) {
        shared_counter++;  // Critical section without protection
    }
    return NULL;
}

int main() {
    pthread_t threads[NUM_THREADS];

    // Create threads
    for (int i = 0; i < NUM_THREADS; i++) {
        if (pthread_create(&threads[i], NULL, increment_counter, NULL) != 0) {
            printf("Thread creation failed\n");
            return 1;
        }
    }

    // Join threads
    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    // Print final result
    printf("Final Counter Value: %d (Expected: %d)\n", shared_counter, NUM_THREADS * ITERATIONS);
    return 0;
}
