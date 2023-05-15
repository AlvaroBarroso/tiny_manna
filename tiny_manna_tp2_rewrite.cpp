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

#include <x86intrin.h>
#include <iostream>
#include <iomanip>

// #include <immintrin.h>
#include <algorithm>
#include <array>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <vector>
#include <chrono>
#include <numeric>
#include <cstring>
#include <random>

std::minstd_rand generator;

// IDEA OPT: Change to `unsigned` and use `short` instead of `int`
typedef std::array<unsigned short, N> Manna_Array; // fixed-sized array

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
std::vector<unsigned long long int> time_recorder_p1, time_recorder_p2, time_recorder_p3;
#endif

// DESCARGA DE ACTIVOS Y UPDATE --------------------------------------------------------
static void descargar(std::array<unsigned short, N>& h, std::array<unsigned short, N>& ldh, std::array<unsigned short, N>& rdh)
{
#ifdef PROFILE
    auto start = std::chrono::high_resolution_clock::now();
    // PARTE 1
#endif

    ldh.fill(0);
    rdh.fill(0);

#ifdef PROFILE
    auto end = std::chrono::high_resolution_clock::now();
    time_recorder_p1.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 2.1
    // activos es un vector con los indices de los sitios activos
    std::vector<unsigned short> activos;
    for (unsigned short i = 0; i < N; ++i) {
        if (h[i] <= 1) continue;  // skip elements with h[i] <= 1
        activos.push_back(i);
    }

    
    const size_t numberOfActivos = activos.size();

    std::vector<uint32_t> randoms(numberOfActivos);
    std::generate(randoms.begin(), randoms.end(), generator);

    std::vector<std::pair<unsigned short,unsigned short>> updates(numberOfActivos);

    // PARTE 2.2
    unsigned short i = 0;
    for(; i < (numberOfActivos - (numberOfActivos % 16)); i+=16) {
        // original line: const uint16_t arenas = h[activos[i]];
        __m256i arenas = _mm256_set1_epi16(h[activos[i]]);
        
        // original line: const uint16_t tmp = arenas;
        __m256i tmp = arenas;

        // original line: const uint16_t left = __builtin_popcount(randoms[i] & ((1 << arenas) - 1));
        __m256i mask = _mm256_set1_epi16((1 << h[activos[i]]) - 1);
        __m256i random = _mm256_set1_epi16(randoms[i]);
        random = _mm256_and_si256(random, mask);

        __m128i lo = _mm256_castsi256_si128(random);
        __m128i hi = _mm256_extracti128_si256(random, 1);

        // Count the number of 1 bits in each 64-bit integer using the _mm_popcnt_u64 intrinsic
        unsigned long long popcnt_lo = _mm_popcnt_u64(_mm_extract_epi64(lo, 0));
        unsigned long long popcnt_hi = _mm_popcnt_u64(_mm_extract_epi64(lo, 1));
        unsigned long long popcnt_lo2 = _mm_popcnt_u64(_mm_extract_epi64(hi, 0));
        unsigned long long popcnt_hi2 = _mm_popcnt_u64(_mm_extract_epi64(hi, 1));

        // Combine the results back into a single 256-bit vector
        __m256i popcnt = _mm256_set_epi64x(popcnt_hi2, popcnt_lo2, popcnt_hi, popcnt_lo);

        __m256i left = popcnt;

        // original line: const uint16_t right = tmp - left;
        __m256i right = _mm256_sub_epi16(tmp, left);

        // original line: updates[i].first = left;
        // original line: updates[i].second = right;
        __m128i left_low = _mm256_extracti128_si256(left, 0);
        __m128i left_high = _mm256_extracti128_si256(left, 1);
        __m128i right_low = _mm256_extracti128_si256(right, 0);
        __m128i right_high = _mm256_extracti128_si256(right, 1);
        uint16_t* updates_ptr = &(updates[i].first);
        _mm_storeu_si128((__m128i*)updates_ptr, left_low);
        _mm_storeu_si128((__m128i*)(updates_ptr + 4), left_high);
        updates_ptr = &(updates[i].second);
        _mm_storeu_si128((__m128i*)updates_ptr, right_low);
        _mm_storeu_si128((__m128i*)(updates_ptr + 4), right_high);
    }

    // PARTE 2.2 para el resto
    for (; i < numberOfActivos; i++) {
        const uint16_t arenas = h[activos[i]];
        const uint16_t tmp = arenas;
        const uint16_t left = __builtin_popcount(randoms[i] & ((1 << arenas) - 1));
        const uint16_t right = tmp - left;

        updates[i].first = left;
        updates[i].second = right;
    }
    // std::cout << "numberOfActivos" << numberOfActivos << std::endl;

#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p2.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // Nueva parte 3
    for(unsigned short i = 0; i < numberOfActivos; i++) ldh[(activos[i] - 1 + N) % N] += updates[i].first;
    for(unsigned short i = 0; i < numberOfActivos; i++) rdh[(activos[i] + 1 + N) % N] += updates[i].second;
    
    for(unsigned short i = 0; i < N; i++) h[i] = (((h[i] - 1) >> 15) & 1) + ldh[i] + rdh[i];

#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p3.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());
#endif

}


unsigned long long int get_avg(std::vector<unsigned long long int> time_recorder) {
    double pt = 0;
    unsigned long long recorder_size = time_recorder.size();
    for(int i = 0; i < recorder_size; ++i) pt +=((double)time_recorder[i])/((double) recorder_size);
    return (unsigned long long int)pt;
}


//===================================================================
int main()
{

    srand(SEED);
    generator.seed(SEED);

    // nro granitos en cada sitio, y su update
    alignas(32) std::array<unsigned short, N> h, ldh, rdh;
    
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
    std::vector<unsigned long long int> time_recorder;
    do {
        activity = 0;
        auto start = std::chrono::high_resolution_clock::now(); // Start measuring time

        descargar(h, ldh, rdh);

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
    
    std::cout << std::fixed;
    std::cout << std::setprecision(2);
    unsigned long long pt = get_avg(time_recorder);
    std::cout << "Tiempo total de ejecucion: " << std::accumulate(time_recorder.begin(), time_recorder.end(), 0) << " ns" << std::endl;
    std::cout << "Tiempo promedio de ejecucion: " << pt << " ns" << std::endl;

#ifdef PROFILE

    unsigned long long int p1 = get_avg(time_recorder_p1);
    unsigned long long int p2 = get_avg(time_recorder_p2);
    unsigned long long int p3 = get_avg(time_recorder_p3);

    std::cout << "Tiempo promedio de ejecucion de la parte 1: " << p1 << " ns represents " << float(p1)*100/float(pt) << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 2: " << p2 << " ns represents " << float(p2)*100/float(pt) << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 3: " << p3 << " ns represents " << float(p3)*100/float(pt) << "%" << std::endl;
#endif
    return 0;
}