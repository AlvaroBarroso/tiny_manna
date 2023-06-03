#include "params.h"

#include <array>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <vector>
#include <chrono>
#include <numeric>
#include <cstring>
#include <random>
#include <bits/stdc++.h>
#include <immintrin.h>

std::minstd_rand generator;

void printNumber(uint16_t a)
{
    std::cout << "a bits: ";
    for (int i = 0; i < 16; ++i) {
        std::cout << ((a >> i) & 1);
    }
    std::cout << std::endl;
    std::cout << "a: " << a << std::endl;
}

void rotate_array_to_the_right(std::array<unsigned short, 32768>& arr, std::array<unsigned short, 32768>& dst)
{
    // Copy the last element to the first position
    std::memcpy(dst.data(), arr.data() + 32767, sizeof(unsigned short));
    // Copy the rest of the elements to the shifted position
    std::memcpy(dst.data() + 1, arr.data(), 32767 * sizeof(unsigned short));
}

void rotate_array_to_the_left(std::array<unsigned short, 32768>& arr, std::array<unsigned short, 32768>& dst)
{
    // Copy the first element to the last position
    std::memcpy(dst.data() + 32767, arr.data(), sizeof(unsigned short));
    // Copy the rest of the elements to the shifted position
    std::memcpy(dst.data(), arr.data() + 1, 32767 * sizeof(unsigned short));
}

void rotate_array(std::array<unsigned short, 32768>& arr, std::array<unsigned short, 32768>& dst)
{
    for(int i = 0; i < 32768; ++i)
    {
        dst[i] = arr[(i + 1) % 32768];
    }
}
void printt(std::array<unsigned short, 32768>& arr)
{
    std::cout<< "arr0: " << arr[0] << std::endl;
    std::cout<< "arr1: " << arr[1] << std::endl;
    std::cout<< "arr2: " << arr[2] << std::endl;
    std::cout<< "arr3: " << arr[3] << std::endl;
    std::cout<< "arr4: " << arr[4] << std::endl;
    std::cout<< "arr5: " << arr[5] << std::endl;
    std::cout<< "arr6: " << arr[6] << std::endl;
    std::cout<< "arr7: " << arr[7] << std::endl;
    std::cout<< "arr8: " << arr[8] << std::endl;
    std::cout<< "arr9: " << arr[9] << std::endl;
    std::cout<< "arr32767: " << arr[32767] << std::endl;
}

//===================================================================
int main()
{
    // initialize random
    generator.seed(SEED);

    // int b = 12;
    // uint16_t a = generator();

    // printNumber(a);
    // Count the number of 1's in A using bitwise ops
    // https://stackoverflow.com/questions/109023/how-to-count-the-number-of-set-bits-in-a-32-bit-integer
    // https://stackoverflow.com/questions/109023/how-to-count-the-number-of-set-bits-in-a-32-bit-integer
    // std::cout<< "A" <<__builtin_popcount(a) << std::endl;
    // // mask with 0's everything but 12 numbers
    // uint16_t mask = (1 << b) - 1;
    // printNumber(mask);
    // printNumber(a & mask);

    alignas(32) std::array<unsigned short, 32768> arr, rd, ld;
    for(int i = 0; i<32768;i++){
        arr[i] = i;
    }
    auto start = std::chrono::high_resolution_clock::now();
    rotate_array_to_the_left(arr, ld);
    rotate_array_to_the_right(arr, rd);
    auto end = std::chrono::high_resolution_clock::now();
    std::cout<<"elapsed " << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count() << std::endl;

    return 0;
}
