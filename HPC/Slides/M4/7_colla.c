#include <stdio.h>
#include <omp.h>

#define A 1000  // Loop size
#define B 1000  // Loop size

void without_collapse() {
    double start = omp_get_wtime();
    
    #pragma omp parallel for
    for (int i = 0; i < A; i++) {
        for (int j = 0; j < B; j++) {
            // Simulated work
            double temp = i * 0.5 + j * 0.3;
        }
    }
    
    double end = omp_get_wtime();
    printf("Time without collapse: %f seconds\n", end - start);
}

void with_collapse() {
    double start = omp_get_wtime();
    
    #pragma omp parallel for collapse(2)
    for (int i = 0; i < A; i++) {
        for (int j = 0; j < B; j++) {
            // Simulated work
            double temp =  j * 0.3;
        }
    }
    
    double end = omp_get_wtime();
    printf("Time with collapse(2): %f seconds\n", end - start);
}

int main() {
    printf("Running without collapse...\n");
    without_collapse();

    printf("Running with collapse(2)...\n");
    with_collapse();

    return 0;
}
