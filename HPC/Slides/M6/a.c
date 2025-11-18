#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
    
    int world_size;
    MPI_Comm_size(MPI_COMM_WORLD, &world_size);

    printf("Hello from processor %d out of %d\n", world_rank, world_size);

    MPI_Finalize();
    return 0;
}
///sudo apt install openmpi-bin libopenmpi-dev
// mpirun --oversubscribe -np 4 ./a.out
