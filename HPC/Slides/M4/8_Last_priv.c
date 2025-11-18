#include <stdio.h>
#include <omp.h>

int main() {
    int x = 10;  // Lastprivate variable

    #pragma omp parallel for lastprivate(x)
    for (int i = 0; i < 4; i++) {
        x = i;  // Each thread updates x
        printf("Iteration %d: x = %d\n", i, x);
    }

    printf("Final value of x: %d (from last iteration)\n", x);
    return 0;
}
