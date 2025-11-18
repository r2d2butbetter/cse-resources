#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define NUM_THREADS 5
#define ITERATIONS 1000000

int final_sum = 0;  // Stores the total sum at the end
int partial_sums[NUM_THREADS]; // Each thread maintains its own sum

void *increment_counter(void *arg) {
    int thread_id = *(int *)arg;
    partial_sums[thread_id] = 0; // Initialize the thread's sum

    for (int i = 0; i < ITERATIONS; i++) {
        partial_sums[thread_id]++;  // Update local sum
    }
    
    return NULL;
}

int main() {
    pthread_t threads[NUM_THREADS];
    int thread_ids[NUM_THREADS];

    // Create threads
    for (int i = 0; i < NUM_THREADS; i++) {
        thread_ids[i] = i; // Assign thread IDs
        if (pthread_create(&threads[i], NULL, increment_counter, &thread_ids[i]) != 0) {
            printf("Thread creation failed\n");
            return 1;
        }
    }

    // Join threads
    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    // Compute final sum
    for (int i = 0; i < NUM_THREADS; i++) {
        final_sum += partial_sums[i];
    }

    // Print final result
    printf("Final Counter Value: %d (Expected: %d)\n", final_sum, NUM_THREADS * ITERATIONS);
    return 0;
}
