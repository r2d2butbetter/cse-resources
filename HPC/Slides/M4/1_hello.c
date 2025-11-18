



#include <stdio.h>
#include <omp.h>

int main() {
    int x = 0;

    #pragma omp parallel for
    for (int i = 0; i < 1000000; i++) {
       #pragma omp atomic
        
       

    printf("Final value of x = %d\n", x);
    return 0;
}





/* #include <stdio.h> #include <omp.h>

int main() {
    #pragma omp parallel num_threads(10)
    {
        int size=1000;
        int id = omp_get_thread_num();
        int d= omp_get_num_threads();
        int offset=size/d;
        int i = id*offset;
        int end = (id+1)*offset;
        for (int ii = i; ii <=end; ii++)
        {
        printf("Hello from thread %d-%d\n :%d\n ", id, d,ii);
        }
        
    }
    return 0;
}
*/