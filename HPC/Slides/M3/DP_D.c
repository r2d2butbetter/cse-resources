#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

#define N 5

pthread_mutex_t chopsticks[N];

void* philosopher(void* num) {
    int id = *(int*)num;
    while (1) {
        printf("Philosopher %d is thinking...\n", id);
        sleep(1);

        printf("Philosopher %d is hungry\n", id);

        // Pick left chopstick
        pthread_mutex_lock(&chopsticks[id]);
        printf("Philosopher %d picked up left chopstick\n", id);

        // Pick right chopstick
        pthread_mutex_lock(&chopsticks[(id+1)%N]);
        printf("Philosopher %d picked up right chopstick\n", id);

        printf("Philosopher %d is eating...\n", id);
        sleep(1);

        // Put down chopsticks
        pthread_mutex_unlock(&chopsticks[id]);
        pthread_mutex_unlock(&chopsticks[(id+1)%N]);

        printf("Philosopher %d finished eating\n", id);
    }
    return NULL;
}

int main() {
    pthread_t philo[N];
    int ids[N];

    for (int i = 0; i < N; i++)
        pthread_mutex_init(&chopsticks[i], NULL);

    for (int i = 0; i < N; i++) {
        ids[i] = i;
        pthread_create(&philo[i], NULL, philosopher, &ids[i]);
    }

    for (int i = 0; i < N; i++)
        pthread_join(philo[i], NULL);

    return 0;
}
