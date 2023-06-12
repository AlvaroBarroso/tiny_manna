#include <omp.h>
#include <stdio.h>
#include <chrono>
#include <iostream>

#include "XoshiroCpp.hpp"

#define N 4194304

void populate_array(short int *array, int size) {
    XoshiroCpp::SplitMix64 init_generator(12345);
    XoshiroCpp::SplitMix64* generators = new XoshiroCpp::SplitMix64[omp_get_max_threads()];
    for(int i = 0; i < omp_get_max_threads(); ++i) {
        generators[i] = XoshiroCpp::SplitMix64(init_generator());
    }
    int t;
    #pragma omp parallel for private(t)
    for(int i = 0; i < size; ++i) {
        t = omp_get_thread_num();
        array[i] = generators[i]();
    }
}

int main()
{   
    // Initilalize a vector A of size N
    alignas(64) short int* arr = new short int[N];

    // Fill arr with random numbers
    auto start = std::chrono::high_resolution_clock::now();
    populate_array(arr, N);
    std::cout << "Time:  ns" << std::endl;
    auto end = std::chrono::high_resolution_clock::now();
    unsigned long long dt = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
    
    std::cout << "Time: " << dt << " ns" << std::endl;
    std::cout << "A[0]" << arr[0] << std::endl;
    std::cout << "A[0]" << arr[1] << std::endl;
    // std::cout << "T" << generator() << " ns" << std::endl;
    return 0;
}