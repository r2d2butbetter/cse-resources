#include <stdio.h>
#include <pthread.h>

//Thread with Private Data

int data=0;

void *print_data(void *arg) {
    data = *(int *)arg;  // Each thread gets its own private data
    printf("Thread %d: Private data = %d\n", data, data * 2);
    return NULL;
}

int main() {
    pthread_t t1, t2;
    int data1 = 10, data2 = 20;

    pthread_create(&t2, NULL, print_data, &data2);
   pthread_create(&t1, NULL, print_data, &data1);
   
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    printf("%d",data);
 
    return 0;
}
