#include <stdio.h>
#include <omp.h>

#define N 16          // Number of iterations (array size)
#define CHUNK_SIZE 4  // Chunk size for scheduling

void execute_static() {
    printf("\nStatic Schedule:\n");
    #pragma omp parallel for schedule(static, CHUNK_SIZE)
    for (int i = 0; i < N; i++) {
        printf("Iteration %d executed by thread %d\n", i, omp_get_thread_num());
    }
}

void execute_dynamic() {
    printf("\nDynamic Schedule:\n");
    #pragma omp parallel for schedule(dynamic, 1)
    for (int i = 0; i < N; i++) {
        printf("Iteration %d executed by thread %d\n", i, omp_get_thread_num());
    }
}

void execute_guided() {
    printf("\nGuided Schedule:\n");
    #pragma omp parallel for schedule(guided, 2)
    for (int i = 0; i < N; i++) {
        printf("Iteration %d executed by thread %d\n", i, omp_get_thread_num());
    }
}

void execute_auto() {
    printf("\nAuto Schedule:\n");
    #pragma omp parallel for schedule(auto)
    for (int i = 0; i < N; i++) {
        printf("Iteration %d executed by thread %d\n", i, omp_get_thread_num());
    }
}

int main() {
    omp_set_num_threads(4);  // Set number of threads

    execute_static();
    execute_dynamic();
    execute_guided();
    execute_auto();

    return 0;
}
