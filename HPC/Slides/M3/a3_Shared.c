#include <stdio.h>

#include <pthread.h>

int counter = 0;  // Shared data

void *increment(void *arg) {
    for (int i = 0; i < 100000; i++) {
        counter++;  
        printf("Thread %d: Counter = %d\n", *(int *)arg, counter);
    }
    return NULL;    
}

int main() {
    pthread_t t1, t2;
    int id1 = 1, id2 = 2;

    pthread_create(&t1, NULL, increment, &id1);
    pthread_create(&t2, NULL, increment, &id2);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("Final Counter Value: %d\n", counter);
    return 0;
}

//https://pubs.opengroup.org/onlinepubs/7908799/xsh/pthread.h.html