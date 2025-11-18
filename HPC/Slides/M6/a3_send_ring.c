#include <stdio.h>
#include <mpi.h>

int main(int argc, char** argv) {
    int rank, size;
    int send_val, recv_val;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    send_val = rank * 10; // Each process sends its rank*10

    int next = (rank + 1) % size;
    int prev = (rank - 1 + size) % size;

    MPI_Send(&send_val, 1, MPI_INT, next, 0, MPI_COMM_WORLD);
    MPI_Recv(&recv_val, 1, MPI_INT, prev, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

    printf("Process %d received %d from process %d\n", rank, recv_val, prev);

    MPI_Finalize();
    return 0;
}
