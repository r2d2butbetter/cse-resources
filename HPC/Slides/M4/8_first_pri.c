#include <stdio.h>
#include <omp.h>

int main() {
    int x = 10;  // Firstprivate variable

    #pragma omp parallel firstprivate(x)
    {
        x += omp_get_thread_num();  // Each thread gets `x=10` initially
        printf("Thread %d: x = %d\n", omp_get_thread_num(), x);
    }

    printf("Final value of x: %d (unchanged in main)\n", x);
    return 0;
}
