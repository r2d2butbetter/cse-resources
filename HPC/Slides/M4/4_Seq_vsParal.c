#include <stdio.h>
#include <omp.h>
#include <time.h>

#define N 100000000  // Large array size

int main() {
    int i;
    long long sum_seq = 0, sum_parallel = 0;
    int arr[N];

    // Initialize array
    for (i = 0; i < N; i++) arr[i] = i + 1;

    // Measure sequential execution time
    clock_t start_seq = clock();
    for (i = 0; i < N; i++)
        sum_seq += arr[i];
    clock_t end_seq = clock();
    double time_seq = (double)(end_seq - start_seq) / CLOCKS_PER_SEC;

    // Measure parallel execution time
    double start_parallel = omp_get_wtime();
    #pragma omp parallel for reduction(+:sum_parallel)
    for (i = 0; i < N; i++)
        sum_parallel += arr[i];
    double end_parallel = omp_get_wtime();
    double time_parallel = end_parallel - start_parallel;

    // Print results
    printf("Sequential Sum: %lld, Time: %.6f sec\n", sum_seq, time_seq);
    printf("Parallel Sum:   %lld, Time: %.6f sec\n", sum_parallel, time_parallel);

    return 0;
}
