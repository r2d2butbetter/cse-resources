#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (rank == 0) {
        int i = 10;
        float f = 3.14;
        double d = 99.99;

        MPI_Send(&i, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
        MPI_Send(&f, 1, MPI_FLOAT, 1, 1, MPI_COMM_WORLD);
        MPI_Send(&d, 1, MPI_DOUBLE, 1, 2, MPI_COMM_WORLD);

        printf("Process 0 sent int, float, and double to process 1\n");
    } else if (rank == 1) {
        int i;
        float f;
        double d;

        MPI_Recv(&i, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        MPI_Recv(&f, 1, MPI_FLOAT, 0, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        MPI_Recv(&d, 1, MPI_DOUBLE, 0, 2, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

        printf("Process 1 received: int=%d, float=%.2f, double=%.2f\n", i, f, d);
    }

    MPI_Finalize();
    return 0;
}

/*
#include <stdio.h>
#include <mpi.h>

int main(int argc, char** argv) {
    int rank;
    int data[5];

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (rank == 0) {
        for (int i = 0; i < 5; i++)
            data[i] = i + 1;

        MPI_Send(data, 5, MPI_INT, 1, 0, MPI_COMM_WORLD);
        printf("Process 0 sent array to process 1\n");
    } 
    else if (rank == 1) {
        MPI_Recv(data, 5, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        printf("Process 1 received array: ");
        for (int i = 0; i < 5; i++)
            printf("%d ", data[i]);
        printf("\n");
    }

    MPI_Finalize();
    return 0;
}
*/