# include <iostream>
# include "XoshiroCpp.hpp"

const std::uint64_t OTHER_SEED = 12345;
XoshiroCpp::Xoshiro256PlusPlus generator(OTHER_SEED);


int main()
{
    for (int i = 0; i < 5; ++i)
    {
        std::cout << generator() << '\n';
    }

    for (int i = 0; i < 5; ++i)
    {
        std::cout << generator() << '\n';
    }

    for (int i = 0; i < 5; ++i)
    {
        std::cout << generator() << '\n';
    }
}