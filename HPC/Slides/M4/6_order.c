#include <stdio.h>
#include <omp.h>

int main() {
    #pragma omp parallel
    {
    #pragma omp ordered
        printf("Thread %d processed", omp_get_thread_num() );
    }

    return 0;
}
