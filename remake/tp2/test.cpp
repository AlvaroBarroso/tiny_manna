#pragma GCC optimize("O3","unroll-loops","omit-frame-pointer","inline") //Optimization flags
#pragma GCC option("arch=native","tune=native","no-zero-upper") //Enable AVX
#pragma GCC target("avx")  //Enable AVX
#include <array>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <vector>
#include <chrono>
#include <numeric>
#include <cstring>
#include <random>
#include <x86intrin.h>
#include "XoshiroCpp.hpp"

const std::uint64_t OTHER_SEED = 12345;
XoshiroCpp::SplitMix64 generator(OTHER_SEED);

void printM256i(__m256i value) {
    alignas(32) int32_t result[8];
    _mm256_store_si256((__m256i*)result, value);

    for (int i = 0; i < 8; ++i) {
        std::cout << result[i] << " ";
    }
    std::cout << std::endl;
}

const size_t N = 64;
int main()
{
    __m256i zeroVec = _mm256_setzero_si256();
    __m256i oneVec = _mm256_set1_epi32(1);
    __m256i allBitSets = _mm256_set1_epi32(0xFFFFFFFF); 
    std::array<unsigned short, N> arr, arr2;
    std::array<int, N> arr32;
    for (int i = 0; i < N; ++i)
    {
        arr[i] = i%8;
        // arr[i] = i % 2 == 0 ? (i/2) : (i % 4 == 0 ? 0 : 1);
    }

    // Print arr
    for (int i = 0; i < N; ++i)
    {
        std::cout << arr[i] << ' ';
    }
    std::cout << '\n';

    int i = 0;
    for(; i < N; i+=8)
    {
        // Generate random mask
        __uint64_t generado[4] = {generator(), generator(), generator(), generator()};
        // print generado
        // std::cout << generado[0] << '\n';
        // std::cout << generado[1] << '\n';
        // std::cout << generado[2] << '\n';
        // std::cout << generado[3] << '\n';
        __m256i mask_random = _mm256_load_si256(reinterpret_cast<__m256i*>(&generado));

        // // // Unload r
        // __uint64_t interpretado[4];
        // _mm256_store_si256(reinterpret_cast<__m256i*>(&interpretado), mask_random);
        // std::cout << interpretado[0] << '\n';
        // std::cout << interpretado[1] << '\n';
        // std::cout << interpretado[2] << '\n';
        // std::cout << interpretado[3] << '\n';

        // Loads 8 unsigned short (16) into `lo`, and convert it to 8 int (32) in `v`
        __m128i lo = _mm_loadu_si128(reinterpret_cast<const __m128i*>(&arr[i]));
        __m256i v = _mm256_cvtepi16_epi32(lo);

        // if v_i % 2 == 0 ? 1 : 0
        // __m256i a = _mm256_and_si256(v, oneVec);
        // __m256i b = _mm256_cmpeq_epi32(a, zeroVec);
        // __m256i c = _mm256_xor_si256(b, oneVec);
        // __m256i d = _mm256_and_si256(c, oneVec);
        // v = d;

        // Mask h_i > 1
        __m256i temp_mask_h_i_greater_than_one = _mm256_cmpgt_epi32(v, oneVec);
        __m256i mask_h_i_greater_than_one = _mm256_and_si256(temp_mask_h_i_greater_than_one, allBitSets);
        // v = mask_h_i_greater_than_one;

        // Mask (1 << h_i) - 1
        __m256i temp_mask_shift = _mm256_sllv_epi32(oneVec, v);
        __m256i mask_shift = _mm256_sub_epi32(temp_mask_shift, oneVec);
        // v = mask_shift;

        // generator() & ((1 << h_i) - 1) & (h_i > 1)
        __m256i temp_calc = _mm256_and_si256(mask_h_i_greater_than_one, mask_shift);
        temp_calc = _mm256_and_si256(temp_calc, mask_random);
        // v = temp_calc;

        // POP COUNT


        // Convert 8x32 -> 8x16 and Store!
        // TEMP STORE BEFORE CONV 8x32 -> 8x16
        _mm256_storeu_si256(reinterpret_cast<__m256i*>(&arr32[i]), v);
        __m256i shuffle_mask_32_to_16 = _mm256_setr_epi8(
            0, 2, 4, 6, 8, 10, 12, 14,
            1, 3, 5, 7, 9, 11, 13, 15,
            16, 18, 20, 22, 24, 26, 28, 30,
            17, 19, 21, 23, 25, 27, 29, 31
        );
        __m256i trunc_elements = _mm256_shuffle_epi8(v, shuffle_mask_32_to_16);
        __m256i ordered = _mm256_permute4x64_epi64(trunc_elements, 0x58);
        __m128i result  = _mm256_castsi256_si128(ordered);

        _mm_storeu_si128(reinterpret_cast<__m128i*>(&arr2[i]), result);
    }

    std::cout << "Print arr2" << '\n';
    for (int i = 0; i < N; ++i) {
        std::cout << arr2[i] << " ";
    }
    std::cout << std::endl;

    std::cout << "Print arr32" << '\n';
    for (int i = 0; i < N; ++i) {
        std::cout << arr32[i] << " ";
    }
    std::cout << std::endl;
    // std::cout << "Print arr vs arr2" << '\n';
    // // Print arr vs arr2
    // for (int i = 0; i < N; ++i)
    // {
    //     std::cout << arr[i] << "\t " << arr2[i] << "\n";
    // }
    // std::cout << '\n';
}