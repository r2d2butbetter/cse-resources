#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    
    for (int i = 0; i < count; i++)
    {
        /* code */
    }
    
    int number;
    if (rank == 0) {
        number = 42;
             MPI_Send
        printf("Process 0 sent number %d\n", number);
    } else if (rank == 1) {
        MPI_Recv(&number, 1, MPI_INT, 0, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        printf("Process 1 received number %d\n", number);
    }

    MPI_Finalize();
    return 0;
}
