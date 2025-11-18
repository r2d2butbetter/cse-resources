#include <stdio.h>
#include <omp.h>

int main() {
    int sum = 0;

    #pragma omp parallel
    {
        int local_sum = omp_get_thread_num();  // Each thread has a unique value
    
        #pragma omp critical
        sum += local_sum;  // Ensures only one thread updates `sum` at a time
    }

    printf("Final sum = %d\n", sum);
    return 0;
}
