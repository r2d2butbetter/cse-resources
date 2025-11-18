#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 100000000  // Large array size for comparison

int main(int argc, char* argv[]) {
    int rank, size;
    double start_time, end_time;
    int *arr, local_sum = 0, global_sum = 0;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    // Only rank 0 allocates and initializes the array
    if (rank == 0) {
        arr = (int*)malloc(N * sizeof(int));
        for (int i = 0; i < N; i++) {
            arr[i] = 1;  // Simple array where sum = N
        }

        // Sequential sum (for time comparison)
        start_time = MPI_Wtime();
        int seq_sum = 0;
        for (int i = 0; i < N; i++) {
            seq_sum += arr[i];
        }
        end_time = MPI_Wtime();
        printf("Sequential Sum: %d, Time: %f seconds\n", seq_sum, end_time - start_time);
    }

    // Parallel computation
    start_time = MPI_Wtime();
    
    int chunk_size = N / size;
    int *local_arr = (int*)malloc(chunk_size * sizeof(int));

    MPI_Scatter(arr, chunk_size, MPI_INT, local_arr, chunk_size, MPI_INT, 0, MPI_COMM_WORLD);

    // Compute local sum
    for (int i = 0; i < chunk_size; i++) {
        local_sum += local_arr[i];
    }

    // Manual summation without MPI_Reduce
    if (rank == 0) {
        global_sum = local_sum;
        for (int i = 1; i < size; i++) {
            int received_sum;
            MPI_Recv(&received_sum, 1, MPI_INT, i, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
            global_sum += received_sum;
        }
        end_time = MPI_Wtime();
        printf("Parallel Sum: %d, Time: %f seconds\n", global_sum, end_time - start_time);
    } else {
        MPI_Send(&local_sum, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }

    if (rank == 0) free(arr);
    free(local_arr);
    MPI_Finalize();
    return 0;
}
