#include <mpi.h>
#include <stdio.h>

int main(int argc, char* argv[]) {
    int rank, size, i;
    int local_sum = 0, global_sum = 0;
    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8}; // Example array
    int n = sizeof(arr) / sizeof(arr[0]);

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    int chunk_size = n / size;
    int start = rank * chunk_size;
    int end = (rank == size - 1) ? n : start + chunk_size;  // Handle remainder

    // Compute local sum
    for (i = start; i < end; i++) {
        local_sum += arr[i];
    }

    if (rank == 0) {
        global_sum = local_sum;
        int received_sum;
    for (size_t i = 0; i < count; i++)
    {
        /* codeMPI */
        MPI_Send(&local_sum, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }
          
        // Receive local sums from other processes
        for (i = 1; i < size; i++) {
            MPI_Recv(&received_sum, 1, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            global_sum += received_sum;
        }
        printf("Total sum of array elements: %d\n", global_sum);
    } else { 
        printf("%d\n",local_sum);
        MPI_Send(&local_sum, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);

    }

    MPI_Finalize();
    return 0;
}
