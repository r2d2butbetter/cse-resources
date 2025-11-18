
# Performance Analysis of Sorting & Matrix Operations
## Objective
  - Measure and compare the execution time of different algorithms.

  - Identify performance bottlenecks using GPROF.
  
  - Analyze how problem size affects performance.
  
  - Suggest possible optimizations.

# Task 1:  Performance Profiling with GPROF

## Files
- `time_example.c` C program for time understanding 
 `mysort.c` — C program that sorts 1 million random integers using Quick Sort
- `README.md` — This documentation
- Output files generated:
  - `gmon.out` — Profiling data from gprof
  - `myreport.txt` — Human-readable profiling report

## Requirements
- GCC compiler
- gprof tool (usually included with GCC on Linux/Unix)

## How to Compile, Run, and Profile

### 1. Compile with Profiling Enabled
gcc -pg mysort.c -o mysort

### 2. Run the Program
./mysort

This creates a `gmon.out` profiling data file.

### 3. Generate a Profile Report
gprof mysort gmon.out > myreport.txt


### 4. View the Report
cat myreport.txt


## Key Commands Recap
- **Time a Program** (optional quick check):
time ./mysort

- **Compile with gprof**:
gcc -pg mysort.c -o mysort

- **Run**:
./mysort

- **Analyze**:
gprof mysort gmon.out > myreport.txt


## Output
The profiling report (`myreport.txt`) shows:
- Functions taking the most CPU time
- Number of calls per function
- Call graph

# Use this data to find hot spots and optimize performance.

## . Performance improvemnt 

###  Apply Compiler Optimizations  and  Compare runtime and GPROF profile changes.
     a. gcc -O2 -pg sort_quick.c -o quick_opt
  
  #### o3
     b. gcc -O3 -pg sort_quick.c -o quick_opt3 

##  Distribute the Work (Parallelization) is possible ? 
 - give the solution  

# Submission 
- you need to submit the git repo of the work
- submit the screenshots of the output  and improvement
