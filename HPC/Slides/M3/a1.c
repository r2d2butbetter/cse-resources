#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *thread_function(void *arg) {
    printf("Thread executing...\n");
    int *result = malloc(sizeof(int));
    *result = 42;  // Some return value
    pthread_exit(result);  // Return dynamically allocated memory
}

int main() {
    pthread_t thread;
    int *thread_result;

    // Create a thread
    if (pthread_create(&thread, NULL, thread_function, NULL) != 0) {
        perror("pthread_create failed");
        return 1;
    }

    // Wait for the thread to terminate
    if (pthread_join(thread, (void **)&thread_result) != 0) {
        perror("pthread_join failed");
        return 1;
    }

    printf("Thread finished with result: %d\n", *thread_result);
    free(thread_result);  // Free allocated memory

    return 0;
}

///gcc matrix_pthread.c -o matrix_pthread -pthread
