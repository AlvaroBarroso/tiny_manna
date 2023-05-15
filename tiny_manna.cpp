/*
Jueguito:

1) Sea h[i] el numero de granitos en el sitio i, 0<i<N-1.

2) Si h[i]>1 el sitio i esta "activo".

3) Al tiempo t, un sitio "activo" se "descarga" completamente tirando cada uno de sus granitos aleatoriamente y con igual probabilidad a la izquierda o a la derecha (el numero total de granitos entonces se conserva).

4) Los sitios se descargan sincronicamente. Entonces, a tiempo (t+1), el sitio activo i tendra h[i]=0 solo si sus vecinos no le tiraron granitos a tiempo t.

5) Se define la actividad A como el numero de sitios activos, es decir el numero de sitios que quieren descargarse.
Notar que si la densidad de granitos, [Suma_i h[i]/N] es muy baja, la actividad caera rapidamente a cero. Si la densidad es alta por otro lado, la actividad nunca cesara, ya que siempre habra sitios activos. En el medio hay una densidad "critica", para la cual la actividad decaera como una ley de potencia (pero se necesitaran sistemas grandes, y tiempos largos para verla bien definida).

*/

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
#include <immintrin.h>

const uint32_t avx2_mask[8] = {1, 2, 4, 8, 16, 32, 64, 128};

const __m256i avx2_shift[8] = {
    _mm256_set_epi32(0, 0, 0, 0, 0, 0, 0, 1),
    _mm256_set_epi32(0, 0, 0, 0, 0, 0, 1, 0),
    _mm256_set_epi32(0, 0, 0, 0, 0, 1, 0, 0),
    _mm256_set_epi32(0, 0, 0, 0, 1, 0, 0, 0),
    _mm256_set_epi32(0, 0, 0, 1, 0, 0, 0, 0),
    _mm256_set_epi32(0, 0, 1, 0, 0, 0, 0, 0),
    _mm256_set_epi32(0, 1, 0, 0, 0, 0, 0, 0),
    _mm256_set_epi32(1, 0, 0, 0, 0, 0, 0, 0)
};

const __m128i popCountMask = _mm_set1_epi16(0x5555);

void rotate_array_to_the_right(std::array<unsigned short, N>& arr, std::array<unsigned short, N>& dst)
{
    // Copy the last element to the first position
    std::memcpy(dst.data(), arr.data() + (N-1), sizeof(unsigned short));
    // Copy the rest of the elements to the shifted position
    std::memcpy(dst.data() + 1, arr.data(), (N-1) * sizeof(unsigned short));
}

void rotate_array_to_the_left(std::array<unsigned short, N>& arr, std::array<unsigned short, N>& dst)
{
    // Copy the first element to the last position
    std::memcpy(dst.data() + (N-1), arr.data(), sizeof(unsigned short));
    // Copy the rest of the elements to the shifted position
    std::memcpy(dst.data(), arr.data() + 1, (N-1) * sizeof(unsigned short));
}

uint8_t lookup8bit[256] = {
	/* 0 */ 0, /* 1 */ 1, /* 2 */ 1, /* 3 */ 2,
	/* 4 */ 1, /* 5 */ 2, /* 6 */ 2, /* 7 */ 3,
	/* 8 */ 1, /* 9 */ 2, /* a */ 2, /* b */ 3,
	/* c */ 2, /* d */ 3, /* e */ 3, /* f */ 4,
	/* 10 */ 1, /* 11 */ 2, /* 12 */ 2, /* 13 */ 3,
	/* 14 */ 2, /* 15 */ 3, /* 16 */ 3, /* 17 */ 4,
	/* 18 */ 2, /* 19 */ 3, /* 1a */ 3, /* 1b */ 4,
	/* 1c */ 3, /* 1d */ 4, /* 1e */ 4, /* 1f */ 5,
	/* 20 */ 1, /* 21 */ 2, /* 22 */ 2, /* 23 */ 3,
	/* 24 */ 2, /* 25 */ 3, /* 26 */ 3, /* 27 */ 4,
	/* 28 */ 2, /* 29 */ 3, /* 2a */ 3, /* 2b */ 4,
	/* 2c */ 3, /* 2d */ 4, /* 2e */ 4, /* 2f */ 5,
	/* 30 */ 2, /* 31 */ 3, /* 32 */ 3, /* 33 */ 4,
	/* 34 */ 3, /* 35 */ 4, /* 36 */ 4, /* 37 */ 5,
	/* 38 */ 3, /* 39 */ 4, /* 3a */ 4, /* 3b */ 5,
	/* 3c */ 4, /* 3d */ 5, /* 3e */ 5, /* 3f */ 6,
	/* 40 */ 1, /* 41 */ 2, /* 42 */ 2, /* 43 */ 3,
	/* 44 */ 2, /* 45 */ 3, /* 46 */ 3, /* 47 */ 4,
	/* 48 */ 2, /* 49 */ 3, /* 4a */ 3, /* 4b */ 4,
	/* 4c */ 3, /* 4d */ 4, /* 4e */ 4, /* 4f */ 5,
	/* 50 */ 2, /* 51 */ 3, /* 52 */ 3, /* 53 */ 4,
	/* 54 */ 3, /* 55 */ 4, /* 56 */ 4, /* 57 */ 5,
	/* 58 */ 3, /* 59 */ 4, /* 5a */ 4, /* 5b */ 5,
	/* 5c */ 4, /* 5d */ 5, /* 5e */ 5, /* 5f */ 6,
	/* 60 */ 2, /* 61 */ 3, /* 62 */ 3, /* 63 */ 4,
	/* 64 */ 3, /* 65 */ 4, /* 66 */ 4, /* 67 */ 5,
	/* 68 */ 3, /* 69 */ 4, /* 6a */ 4, /* 6b */ 5,
	/* 6c */ 4, /* 6d */ 5, /* 6e */ 5, /* 6f */ 6,
	/* 70 */ 3, /* 71 */ 4, /* 72 */ 4, /* 73 */ 5,
	/* 74 */ 4, /* 75 */ 5, /* 76 */ 5, /* 77 */ 6,
	/* 78 */ 4, /* 79 */ 5, /* 7a */ 5, /* 7b */ 6,
	/* 7c */ 5, /* 7d */ 6, /* 7e */ 6, /* 7f */ 7,
	/* 80 */ 1, /* 81 */ 2, /* 82 */ 2, /* 83 */ 3,
	/* 84 */ 2, /* 85 */ 3, /* 86 */ 3, /* 87 */ 4,
	/* 88 */ 2, /* 89 */ 3, /* 8a */ 3, /* 8b */ 4,
	/* 8c */ 3, /* 8d */ 4, /* 8e */ 4, /* 8f */ 5,
	/* 90 */ 2, /* 91 */ 3, /* 92 */ 3, /* 93 */ 4,
	/* 94 */ 3, /* 95 */ 4, /* 96 */ 4, /* 97 */ 5,
	/* 98 */ 3, /* 99 */ 4, /* 9a */ 4, /* 9b */ 5,
	/* 9c */ 4, /* 9d */ 5, /* 9e */ 5, /* 9f */ 6,
	/* a0 */ 2, /* a1 */ 3, /* a2 */ 3, /* a3 */ 4,
	/* a4 */ 3, /* a5 */ 4, /* a6 */ 4, /* a7 */ 5,
	/* a8 */ 3, /* a9 */ 4, /* aa */ 4, /* ab */ 5,
	/* ac */ 4, /* ad */ 5, /* ae */ 5, /* af */ 6,
	/* b0 */ 3, /* b1 */ 4, /* b2 */ 4, /* b3 */ 5,
	/* b4 */ 4, /* b5 */ 5, /* b6 */ 5, /* b7 */ 6,
	/* b8 */ 4, /* b9 */ 5, /* ba */ 5, /* bb */ 6,
	/* bc */ 5, /* bd */ 6, /* be */ 6, /* bf */ 7,
	/* c0 */ 2, /* c1 */ 3, /* c2 */ 3, /* c3 */ 4,
	/* c4 */ 3, /* c5 */ 4, /* c6 */ 4, /* c7 */ 5,
	/* c8 */ 3, /* c9 */ 4, /* ca */ 4, /* cb */ 5,
	/* cc */ 4, /* cd */ 5, /* ce */ 5, /* cf */ 6,
	/* d0 */ 3, /* d1 */ 4, /* d2 */ 4, /* d3 */ 5,
	/* d4 */ 4, /* d5 */ 5, /* d6 */ 5, /* d7 */ 6,
	/* d8 */ 4, /* d9 */ 5, /* da */ 5, /* db */ 6,
	/* dc */ 5, /* dd */ 6, /* de */ 6, /* df */ 7,
	/* e0 */ 3, /* e1 */ 4, /* e2 */ 4, /* e3 */ 5,
	/* e4 */ 4, /* e5 */ 5, /* e6 */ 5, /* e7 */ 6,
	/* e8 */ 4, /* e9 */ 5, /* ea */ 5, /* eb */ 6,
	/* ec */ 5, /* ed */ 6, /* ee */ 6, /* ef */ 7,
	/* f0 */ 4, /* f1 */ 5, /* f2 */ 5, /* f3 */ 6,
	/* f4 */ 5, /* f5 */ 6, /* f6 */ 6, /* f7 */ 7,
	/* f8 */ 5, /* f9 */ 6, /* fa */ 6, /* fb */ 7,
	/* fc */ 6, /* fd */ 7, /* fe */ 7, /* ff */ 8
};

std::uint64_t popcnt_AVX2_lookup(const uint8_t* data, const size_t n) {

    size_t i = 0;

    const __m256i lookup = _mm256_setr_epi8(
        /* 0 */ 0, /* 1 */ 1, /* 2 */ 1, /* 3 */ 2,
        /* 4 */ 1, /* 5 */ 2, /* 6 */ 2, /* 7 */ 3,
        /* 8 */ 1, /* 9 */ 2, /* a */ 2, /* b */ 3,
        /* c */ 2, /* d */ 3, /* e */ 3, /* f */ 4,

        /* 0 */ 0, /* 1 */ 1, /* 2 */ 1, /* 3 */ 2,
        /* 4 */ 1, /* 5 */ 2, /* 6 */ 2, /* 7 */ 3,
        /* 8 */ 1, /* 9 */ 2, /* a */ 2, /* b */ 3,
        /* c */ 2, /* d */ 3, /* e */ 3, /* f */ 4
    );

    const __m256i low_mask = _mm256_set1_epi8(0x0f);

    __m256i acc = _mm256_setzero_si256();

#define ITER { \
        const __m256i vec = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(data + i)); \
        const __m256i lo  = _mm256_and_si256(vec, low_mask); \
        const __m256i hi  = _mm256_and_si256(_mm256_srli_epi16(vec, 4), low_mask); \
        const __m256i popcnt1 = _mm256_shuffle_epi8(lookup, lo); \
        const __m256i popcnt2 = _mm256_shuffle_epi8(lookup, hi); \
        local = _mm256_add_epi8(local, popcnt1); \
        local = _mm256_add_epi8(local, popcnt2); \
        i += 32; \
    }

    while (i + 8*32 <= n) {
        __m256i local = _mm256_setzero_si256();
        ITER ITER ITER ITER
        ITER ITER ITER ITER
        acc = _mm256_add_epi64(acc, _mm256_sad_epu8(local, _mm256_setzero_si256()));
    }

    __m256i local = _mm256_setzero_si256();

    while (i + 32 <= n) {
        ITER;
    }

    acc = _mm256_add_epi64(acc, _mm256_sad_epu8(local, _mm256_setzero_si256()));

#undef ITER

    uint64_t result = 0;

    result += static_cast<uint64_t>(_mm256_extract_epi64(acc, 0));
    result += static_cast<uint64_t>(_mm256_extract_epi64(acc, 1));
    result += static_cast<uint64_t>(_mm256_extract_epi64(acc, 2));
    result += static_cast<uint64_t>(_mm256_extract_epi64(acc, 3));

    for (/**/; i < n; i++) {
        result += lookup8bit[data[i]];
    }

    return result;
}


std::minstd_rand generator;

// IDEA OPT: Change to `unsigned` and use `short` instead of `int`
// typedef std::array<unsigned short, N> Manna_Array; // fixed-sized array

// CONDICION INICIAL ---------------------------------------------------------------
/*
Para generar una condicion inicial suficientemente uniforme con una densidad
lo mas aproximada (exacta cuando N->infinito) al numero real DENSITY, podemos hacer asi:
*/
static void inicializacion(std::array<unsigned short, N>& h)
{
    for (int i = 0; i < N; ++i) {
        h[i] = static_cast<unsigned short>((i + 1) * DENSITY) - static_cast<unsigned short>(i * DENSITY);
    }
}


#ifdef DEBUG
static void imprimir_array(const std::array<unsigned short, N>& h)
{
    int nrogranitos = 0;
    int nrogranitos_activos = 0;

    // esto dibuja los granitos en cada sitio y los cuenta
    for (int i = 0; i < N; ++i) {
        std::cout << h[i] << " ";
        nrogranitos += h[i];
        nrogranitos_activos += (h[i] > 1);
    }
    std::cout << "\n";
    std::cout << "Hay " << nrogranitos << " granitos en total\n";
    std::cout << "De ellos " << nrogranitos_activos << " son activos\n";
    std::cout << "La densidad obtenida es " << nrogranitos * 1.0 / N;
    std::cout << ", mientras que la deseada era " << DENSITY << "\n\n";
}
#endif


// CONDICION INICIAL ---------------------------------------------------------------
/*
El problema con la condicion inicial de arriba es que es estable, no tiene sitios activos
y por tanto no evolucionara. Hay que desestabilizarla de alguna forma.
Una forma es agarrar cada granito, y tirarlo a su izquierda o derecha aleatoriamente...
*/
static void desestabilizacion_inicial(std::array<unsigned short, N>& h)
{
    std::vector<int> index_a_incrementar;
    for (int i = 0; i < N; ++i) {
        if (h[i] == 1) {
            h[i] = 0;
            int j = i + 2 * (rand() & 1) - 1; // izquierda o derecha

            // corrijo por condiciones periodicas
            if (j == N) {
                j = 0;
            } else if (j == -1) {
                j = N - 1;
            }

            index_a_incrementar.push_back(j);
        }
    }
    for (unsigned int i = 0; i < index_a_incrementar.size(); ++i) {
        h[index_a_incrementar[i]] += 1;
    }
}

#ifdef PROFILE
std::vector<unsigned int> time_recorder_p1, time_recorder_p2, time_recorder_p3;
#endif

// DESCARGA DE ACTIVOS Y UPDATE --------------------------------------------------------
static void descargar(std::array<unsigned short, N>& h, std::array<unsigned short, N>& ldh, std::array<unsigned short, N>& rdh, std::array<unsigned short, N>& aldh, std::array<unsigned short, N>& ardh)
{
#ifdef PROFILE
    auto start = std::chrono::high_resolution_clock::now();
    // PARTE 1
#endif
for (int i = 0; i < N; i += 8) {

    // Load 8 values of h[i] into a 128-bit vector
    __m128i hVec = _mm_loadu_si128((__m128i*)&h[i]);

    // Compute CCmask for each value of h[i] and store in a 128-bit vector
    __m128i AAmaskVec = _mm_sub_epi16(hVec, _mm_set1_epi16(1));
    __m128i BBmaskVec = _mm_sub_epi16(_mm_slli_epi32(_mm_cvtepu16_epi32(hVec), 1), _mm_set1_epi16(1));
    __m128i CCmaskVec = _mm_xor_si128(_mm_and_si128(AAmaskVec, BBmaskVec), BBmaskVec);

    // Generate 8 random numbers at once and mask them with CCmaskVec
    
    __m256i randNumVec = _mm256_set1_epi32(generator());

    // Broadcast the random numbers to all elements of a 256-bit vector
    __m256i randNumBroadcastVec = _mm256_broadcastsi128_si256(_mm_castps_si128(_mm_broadcast_ss((const float*)(&randNumVec))));

    __m256i maskedRandNumVec = _mm256_and_si256(randNumBroadcastVec, _mm256_cvtepi16_epi32(BBmaskVec));


    __m128i loDataVec = _mm256_extractf128_si256(maskedRandNumVec, 0);
    __m128i hiDataVec = _mm256_extractf128_si256(maskedRandNumVec, 1);
    uint64_t popcntLoVec1 = popcnt_AVX2_lookup(reinterpret_cast<const uint8_t*>(&loDataVec), 8);
    uint64_t popcntHiVec1 = popcnt_AVX2_lookup(reinterpret_cast<const uint8_t*>(&hiDataVec), 8);
    __m128i popcntLoVec = _mm_set1_epi64x(popcntLoVec1);
    __m128i popcntHiVec = _mm_set1_epi64x(popcntHiVec1);

    // Compute the left and right values using subtraction and bitwise NOT instructions
    __m128i leftVec = _mm_sub_epi16(_mm_set1_epi16(8), popcntHiVec);
    __m128i rightVec = _mm_sub_epi16(popcntLoVec, _mm_set1_epi16(8));
    // __m128i rightVec = _mm_sub_epi16(hVec, leftVec); // ????

    // uint16_t left[8], right[8];
    // _mm_storeu_si128((__m128i*)left, leftVec);
    // _mm_storeu_si128((__m128i*)right, rightVec);
    _mm_storeu_si128(reinterpret_cast<__m128i*>(&ldh[i]), leftVec);
    _mm_storeu_si128(reinterpret_cast<__m128i*>(&rdh[i]), rightVec);

    // for (int j = 0; j < 8; j++) {
    //     ldh[i+j] = left[j];
    //     rdh[i+j] = right[j];
    // }
}
    // ORIGINAL:
    // for (unsigned short i = 0; i < N; ++i) {
    //     unsigned short arenas = h[i];

    //     const uint16_t randNum = generator();    

    //     // C = ((A - 1) & ((1 << B) - 1)) ^ ((1 << B) - 1);
    //     // CC =(   AA   &        BB     ) ^        BB     ;
    //     const uint16_t AAmask = arenas - 1;
    //     const uint16_t BBmask = (1 << arenas) - 1;
    //     const uint16_t CCmask = (AAmask & BBmask) ^ BBmask;

    //     const uint16_t maskedRandNum = randNum & CCmask;

    //     const unsigned short left = __builtin_popcount(maskedRandNum);
    //     const unsigned short right = arenas - left;

    //     ldh[i] = left;
    //     rdh[i] = right;
    // }

#ifdef PROFILE
    auto end = std::chrono::high_resolution_clock::now();
    time_recorder_p1.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 2

    rotate_array_to_the_left(ldh, aldh);
    rotate_array_to_the_right(rdh, ardh);

#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p2.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // Nueva parte 3
    for (unsigned short i = 0; i < N; ++i) {
        h[i] = aldh[i] + ardh[i] + ((h[i] == 1) ? 1 : 0);
    }
    // std::cout<<h[99]<<" "<<h[100]<<" "<<h[101]<<" "<<h[102]<<" "<<h[103]<<std::endl;
    // PARTE 3
    // for (int i = 0; i < N; ++i) {
    //     h[i] = dh[i] + ((h[i] == 1) ? 1 : 0);
    // }
#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p3.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());
#endif

}


//===================================================================
int main()
{

    srand(SEED);

    // nro granitos en cada sitio, y su update
    alignas(32) std::array<unsigned short, N> h, ldh, rdh, aldh, ardh;

    std::cout << "estado inicial estable de la pila de arena...";
    inicializacion(h);
    std::cout << "LISTO" << std::endl;
#ifdef DEBUG
    imprimir_array(h);
#endif

    std::cout << "estado inicial desestabilizado de la pila de arena...";
    desestabilizacion_inicial(h);
    std::cout << "LISTO" << std::endl;
#ifdef DEBUG
    imprimir_array(h);
#endif

    std::cout << "evolucion de la pila de arena...";
    std::cout.flush();

    std::ofstream activity_out("activity.dat");
    int activity;
    int t = 0;
    std::vector<unsigned int> time_recorder;
    do {
        activity = 0;
        auto start = std::chrono::high_resolution_clock::now(); // Start measuring time
        
        descargar(h, ldh, rdh, aldh, ardh);
        
        auto end = std::chrono::high_resolution_clock::now(); // Stop measuring time
        time_recorder.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());
        for(int i = 0; i < N; ++i) if (h[i] > 1) activity += 1;
        activity_out << activity << "\n";
#ifdef DEBUG
        imprimir_array(h);
#endif
        ++t;
    } while (activity > 0 && t < NSTEPS); // si la actividad decae a cero, esto no evoluciona mas...

    std::cout << "LISTO: " << ((activity > 0) ? ("se acabo el tiempo\n") : ("la actividad decayo a cero\n")) << std::endl;
    
    unsigned int pt = std::accumulate(time_recorder.begin(), time_recorder.end(), 0) / time_recorder.size();
    std::cout << "Tiempo promedio de ejecucion: " << pt << " ns" << std::endl;

#ifdef PROFILE
    unsigned int p1 = std::accumulate(time_recorder_p1.begin(), time_recorder_p1.end(), 0) / time_recorder_p1.size();
    unsigned int p2 = std::accumulate(time_recorder_p2.begin(), time_recorder_p2.end(), 0) / time_recorder_p2.size();
    unsigned int p3 = std::accumulate(time_recorder_p3.begin(), time_recorder_p3.end(), 0) / time_recorder_p3.size();

    std::cout << "Tiempo promedio de ejecucion de la parte 1: " << p1 << " ns represents" << double(p1)/double(pt) << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 2: " << p2 << " ns represents" << double(p2)/double(pt) << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 3: " << p3 << " ns represents" << double(p3)/double(pt) << "%" << std::endl;
#endif


    return 0;
}
