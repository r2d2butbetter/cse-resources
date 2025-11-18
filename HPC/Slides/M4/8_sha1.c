#include <stdio.h>
#include <omp.h>

int x = 10;  // Shared variable

int main() {
    #pragma omp parallel shared(x)
    {
        x += omp_get_thread_num();  // All threads modify the same `x`
        printf("Thread %d: x = %d\n", omp_get_thread_num(), x);
    }
    printf("Final value of x: %d\n", x);
    return 0;
}
