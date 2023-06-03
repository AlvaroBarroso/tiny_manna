#include <array>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <vector>
#include <chrono>
#include <numeric>
#include <cstring>
#include <random>
# include "XoshiroCpp.hpp"

const std::uint64_t OTHER_SEED = 12345;
XoshiroCpp::Xoshiro256PlusPlus generator(OTHER_SEED);


int main()
{
    // for (int i = 0; i < 5; ++i)
    // {
    //     std::cout << generator() << '\n';
    // }

    // for (int i = 0; i < 5; ++i)
    // {
    //     std::cout << generator() << '\n';
    // }

    // for (int i = 0; i < 5; ++i)
    // {
    //     std::cout << generator() << '\n';
    // }

    std::array<unsigned short, 10> arr;
    for (int i = 0; i < 10; ++i)
    {
        arr[i] = i;
    }
    // Print arr
    for (int i = 0; i < 10; ++i)
    {
        std::cout << arr[i] << ' ';
    }
    std::cout << '\n';

    unsigned short last = arr[10 - 1];
    std::memmove(arr.data() + 1, arr.data(), (10 - 1) * sizeof(unsigned short));
    arr[0] = last;

    // Print arr
    for (int i = 0; i < 10; ++i)
    {
        std::cout << arr[i] << ' ';
    }
    std::cout << '\n';

    unsigned short first = arr[0];
    std::memmove(arr.data(), arr.data() + 1, (10 - 1) * sizeof(unsigned short));
    arr[10 - 1] = first;
    
    // Print arr
    for (int i = 0; i < 10; ++i)
    {
        std::cout << arr[i] << ' ';
    }
    std::cout << '\n';
}