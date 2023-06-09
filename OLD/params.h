#pragma once

#include <ctime>

// number of sites
#ifndef N
#define N 32768
#endif

// number of sites
#ifndef DENSITY
#define DENSITY 0.8924
#endif

// number of temporal steps
#ifndef NSTEPS
#define NSTEPS 32000
#endif

#ifndef SEED
#define SEED time(nullptr)
#endif

// #ifndef PROFILE
// #define PROFILE
// #endif