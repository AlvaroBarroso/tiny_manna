/*
Jueguito:

1) Sea h[i] el numero de granitos en el sitio i, 0<i<N-1.

2) Si h[i]>1 el sitio i esta "activo".

3) Al tiempo t, un sitio "activo" se "descarga" completamente tirando cada uno de sus granitos aleatoriamente y con igual probabilidad a la izquierda o a la derecha (el numero total de granitos entonces se conserva).

4) Los sitios se descargan sincronicamente. Entonces, a tiempo (t+1), el sitio activo i tendra h[i]=0 solo si sus vecinos no le tiraron granitos a tiempo t.

5) Se define la actividad A como el numero de sitios activos, es decir el numero de sitios que quieren descargarse.
Notar que si la densidad de granitos, [Suma_i h[i]/N] es muy baja, la actividad caera rapidamente a cero. Si la densidad es alta por otro lado, la actividad nunca cesara, ya que siempre habra sitios activos. En el medio hay una densidad "critica", para la cual la actividad decaera como una ley de potencia (pero se necesitaran sistemas grandes, y tiempos largos para verla bien definida).

*/

#pragma GCC optimize("O3","unroll-loops","omit-frame-pointer","inline") //Optimization flags
#pragma GCC option("arch=native","tune=native","no-zero-upper") //Enable AVX
#pragma GCC target("avx")  //Enable AVX

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
#include <x86intrin.h>
#include <nmmintrin.h>
#include <omp.h>
#include "XoshiroCpp.hpp"

#define ull unsigned long long
#define ll long long

// std::minstd_rand generator;
const std::uint64_t OTHER_SEED = 12345;
XoshiroCpp::SplitMix64 generator(OTHER_SEED); // TODO: CHANGE TO 256 FOR SIMD
__m256i zeroVec = _mm256_setzero_si256();
__m256i oneVec = _mm256_set1_epi32(1);
__m256i shuffle_mask_32_to_16 = _mm256_setr_epi8(
    0, 2, 4, 6, 8, 10, 12, 14,
    1, 3, 5, 7, 9, 11, 13, 15,
    16, 18, 20, 22, 24, 26, 28, 30,
    17, 19, 21, 23, 25, 27, 29, 31
);

// IDEA OPT: Change to `unsigned` and use `short` instead of `int`
typedef std::array<unsigned short, NN> Manna_Array; // fixed-sized array

// CONDICION INICIAL ---------------------------------------------------------------
/*
Para generar una condicion inicial suficientemente uniforme con una densidad
lo mas aproximada (exacta cuando NN->infinito) al numero real DENSITY, podemos hacer asi:
*/
static void inicializacion(Manna_Array& h)
{
    for (int i = 0; i < NN; ++i) {
        h[i] = static_cast<unsigned short>((i + 1) * DENSITY) - static_cast<unsigned short>(i * DENSITY);
    }
}


#ifdef DEBUG
static void imprimir_array(const Manna_Array& h)
{
    int nrogranitos = 0;
    int nrogranitos_activos = 0;

    // esto dibuja los granitos en cada sitio y los cuenta
    for (int i = 0; i < NN; ++i) {
        std::cout << h[i] << " ";
        nrogranitos += h[i];
        nrogranitos_activos += (h[i] > 1);
    }
    std::cout << "\n";
    std::cout << "Hay " << nrogranitos << " granitos en total\n";
    std::cout << "De ellos " << nrogranitos_activos << " son activos\n";
    std::cout << "La densidad obtenida es " << nrogranitos * 1.0 / NN;
    std::cout << ", mientras que la deseada era " << DENSITY << "\n\n";
}
#endif


// CONDICION INICIAL ---------------------------------------------------------------
/*
El problema con la condicion inicial de arriba es que es estable, no tiene sitios activos
y por tanto no evolucionara. Hay que desestabilizarla de alguna forma.
Una forma es agarrar cada granito, y tirarlo a su izquierda o derecha aleatoriamente...
*/
static void desestabilizacion_inicial(Manna_Array& h)
{
    std::vector<int> index_a_incrementar;
    for (int i = 0; i < NN; ++i) {
        if (h[i] == 1) {
            h[i] = 0;
            int j = i + 2 * (generator() & 1) - 1; // izquierda o derecha

            // corrijo por condiciones periodicas
            if (j == NN) {
                j = 0;
            } else if (j == -1) {
                j = NN - 1;
            }

            index_a_incrementar.push_back(j);
        }
    }
    for (unsigned int i = 0; i < index_a_incrementar.size(); ++i) {
        h[index_a_incrementar[i]] += 1;
    }
}

#ifdef PROFILE
std::vector<ull> time_recorder_p1, time_recorder_p2, time_recorder_p3, time_recorder_p4;
#endif

#ifdef IPROFILE
std::vector<ull> time_recorder_p5, time_recorder_p6, time_recorder_p7, time_recorder_p8;
#endif

// DESCARGA DE ACTIVOS Y UPDATE --------------------------------------------------------
static void descargar(Manna_Array& h, Manna_Array& lh, Manna_Array& rh)
{
#ifdef PROFILE
    auto start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 1
    lh.fill(0);
    rh.fill(0);

#ifdef PROFILE
    auto end = std::chrono::high_resolution_clock::now();
    time_recorder_p1.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 2
#ifdef IPROFILE
    auto istart = std::chrono::high_resolution_clock::now();
#endif
    std::array<unsigned short, 8> rdy_popcnt;
    __uint64_t generado[4];
#ifdef IPROFILE
    auto iend = std::chrono::high_resolution_clock::now();
    time_recorder_p5.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(iend - istart).count());

    istart = std::chrono::high_resolution_clock::now();
#endif
    #pragma omp parallel for shared(h,lh,rh)
    for (int i = 0; i < NN; i+=8) {
        // si es activo lo descargo aleatoriamente
        // unsigned short h_i = h[i];
        // if (h_i <= 1) continue;
        // unsigned short rdy_popcnt = generator() & ((1 << h_i) - 1);

        // Generate random mask
        for(int j = 0; j < 4; ++j) generado[j] = generator();

        __m256i mask_random = _mm256_load_si256(reinterpret_cast<__m256i*>(&generado));

        // Loads 8 unsigned short (16) into `lo`, and convert it to 8 int (32) in `v`
        __m128i lo = _mm_loadu_si128(reinterpret_cast<const __m128i*>(&h[i]));
        __m256i v = _mm256_cvtepi16_epi32(lo);

        // Mask h_i > 1
        __m256i mask_h_i_greater_than_one = _mm256_cmpgt_epi32(v, oneVec);
        // v = mask_h_i_greater_than_one;

        // Mask (1 << h_i) - 1
        __m256i temp_mask_shift = _mm256_sllv_epi32(oneVec, v);
        __m256i mask_shift = _mm256_sub_epi32(temp_mask_shift, oneVec);
        // v = mask_shift;

        // generator() & ((1 << h_i) - 1) & (h_i > 1)
        __m256i vrdy_popcnt = _mm256_and_si256(mask_h_i_greater_than_one, mask_shift);
        vrdy_popcnt = _mm256_and_si256(vrdy_popcnt, mask_random);
        // v = temp_calc;
#ifdef IPROFILE
    iend = std::chrono::high_resolution_clock::now();
    time_recorder_p6.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(iend - istart).count());

    istart = std::chrono::high_resolution_clock::now();
#endif
        // STORE PARTIAL BEFORE POPCOUNT
        __m256i trunc_elements = _mm256_shuffle_epi8(vrdy_popcnt, shuffle_mask_32_to_16);
        __m256i ordered = _mm256_permute4x64_epi64(trunc_elements, 0x58);
        __m128i result  = _mm256_castsi256_si128(ordered);
        _mm_storeu_si128(reinterpret_cast<__m128i*>(&rdy_popcnt), result);

        // CALCULATE POPCOUNT
        for(int j = 0; j < 8; ++j) rdy_popcnt[j] = static_cast<unsigned short>(_mm_popcnt_u32(rdy_popcnt[j]));
        
        // LOAD AFTER POPCOUNT
        __m128i plo = _mm_loadu_si128(reinterpret_cast<const __m128i*>(&rdy_popcnt));
        __m256i pv = _mm256_cvtepi16_epi32(plo);

#ifdef IPROFILE
    iend = std::chrono::high_resolution_clock::now();
    time_recorder_p7.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(iend - istart).count());

    istart = std::chrono::high_resolution_clock::now();
#endif
        // STORE lh
        trunc_elements = _mm256_shuffle_epi8(pv, shuffle_mask_32_to_16);
        ordered = _mm256_permute4x64_epi64(trunc_elements, 0x58);
        result  = _mm256_castsi256_si128(ordered);
        _mm_storeu_si128(reinterpret_cast<__m128i*>(&lh[i]), result);


        // Calculate values of lr
        __m256i vrh = _mm256_sub_epi32(v, pv);
        vrh = _mm256_and_si256(vrh, mask_h_i_greater_than_one);


        // STORE rh
        trunc_elements = _mm256_shuffle_epi8(vrh, shuffle_mask_32_to_16);
        ordered = _mm256_permute4x64_epi64(trunc_elements, 0x58);
        result  = _mm256_castsi256_si128(ordered);
        _mm_storeu_si128(reinterpret_cast<__m128i*>(&rh[i]), result);
#ifdef IPROFILE
    iend = std::chrono::high_resolution_clock::now();
    time_recorder_p8.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(iend - istart).count());
#endif

        // for(int j = i; j < i+8; j++) {
        //     std::cout << "h["<< j <<"]:" << h[j] <<" l:" << lh[j] <<" r:" << rh[j] << " rdy_popcnt:" << rdy_popcnt[j-i] << "\n";
        //     // lh[j] = l;
        //     // rh[j] = r;
        // }

        // unsigned short l = __builtin_popcount(rdy_popcnt);
        // lh[i] = l;
        // rh[i] = h_i - l;
        // unsigned short l, r;
        // std::cout<< "\n";
        // for(int j = i; j < i+8; j++) {
        //     l = _mm_popcnt_u32(rdy_popcnt[j-i]);
            // r = h[j] <= 1 ? 0 : h[j] - l;
            // std::cout << "h["<< j <<"]:" << h[j] <<" l:" << l <<" r:" << r << " rdy_popcnt:" << rdy_popcnt[j-i] << "\n";
        //     lh[j] = l;
        //     rh[j] = r;
        // }
    }
#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p2.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 3
    unsigned short last = rh[NN - 1];
    std::memmove(rh.data() + 1, rh.data(), (NN - 1) * sizeof(unsigned short));
    rh[0] = last;

    unsigned short first = lh[0];
    std::memmove(lh.data(), lh.data() + 1, (NN - 1) * sizeof(unsigned short));
    lh[NN - 1] = first;
    
#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p3.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif

    for (int i = 0; i < NN; ++i) {
        h[i] = lh[i] + rh[i] + (h[i] == 1 ? 1 : 0);
    }
#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p4.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());
#endif
}

//===================================================================
#ifdef STAT_TEST
void save_array(std::ofstream* activity_out, Manna_Array h){
    for(int i = 0; i < NN; ++i) *activity_out << h[i] << ",";
    *activity_out << "\n";
}
#endif

//===================================================================
int main()
{

    // nro granitos en cada sitio, y su update
    alignas(32) Manna_Array h, lh, rh;

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
#ifdef STAT_TEST
    std::ofstream activity_out("pilas.dat");
#endif
    int activity;
    int t = 0;
    std::vector<ull> time_recorder;
    do {
        activity = 0;
        auto start = std::chrono::high_resolution_clock::now(); // Start measuring time
        
        descargar(h, lh, rh);

        auto end = std::chrono::high_resolution_clock::now(); // Stop measuring time

        time_recorder.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());
        for(int i = 0; i < NN; ++i) if (h[i] > 1) activity += 1;
#ifdef STAT_TEST
        save_array(&activity_out, h);
#endif
        ++t;
    } while (activity > 0 && t < NSTEPS); // si la actividad decae a cero, esto no evoluciona mas...

    std::cout << "LISTO: " << ((activity > 0) ? ("se acabo el tiempo\n") : ("la actividad decayo a cero\n")) << std::endl;
    

    double pt = std::accumulate(time_recorder.begin(), time_recorder.end(), static_cast<ull>(0)) / time_recorder.size();
    std::cout << "Tiempo promedio de ejecucion: " << pt << " ns" << std::endl;

#ifdef PROFILE
    ull p1 = std::accumulate(time_recorder_p1.begin(), time_recorder_p1.end(), static_cast<ull>(0)) / time_recorder_p1.size();
    ull p2 = std::accumulate(time_recorder_p2.begin(), time_recorder_p2.end(), static_cast<ull>(0)) / time_recorder_p2.size();
    ull p3 = std::accumulate(time_recorder_p3.begin(), time_recorder_p3.end(), static_cast<ull>(0)) / time_recorder_p3.size();
    ull p4 = std::accumulate(time_recorder_p4.begin(), time_recorder_p4.end(), static_cast<ull>(0)) / time_recorder_p4.size();


    std::cout << "Tiempo promedio de ejecucion de la parte 1: " << p1 << " ns\t represents\t" << float(int((double(p1)/pt)*100*100))/100 << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 2: " << p2 << " ns\t represents\t" << float(int((double(p2)/pt)*100*100))/100 << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 3: " << p3 << " ns\t represents\t" << float(int((double(p3)/pt)*100*100))/100 << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 4: " << p4 << " ns\t represents\t" << float(int((double(p4)/pt)*100*100))/100 << "%" << std::endl;
#endif
#ifdef IPROFILE
    ull p5 = std::accumulate(time_recorder_p5.begin(), time_recorder_p5.end(), static_cast<ull>(0)) / time_recorder_p5.size();
    ull p6 = std::accumulate(time_recorder_p6.begin(), time_recorder_p6.end(), static_cast<ull>(0)) / time_recorder_p6.size();
    ull p7 = std::accumulate(time_recorder_p7.begin(), time_recorder_p7.end(), static_cast<ull>(0)) / time_recorder_p7.size();
    ull p8 = std::accumulate(time_recorder_p8.begin(), time_recorder_p8.end(), static_cast<ull>(0)) / time_recorder_p8.size();
    std::cout << "Tiempo promedio de ejecucion de la parte 5: " << p5 << " ns\t represents\t" << float(int((double(p5)/pt)*100*100))/100 << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 6: " << p6 << " ns\t represents\t" << float(int((double(p6)/pt)*100*100))/100 << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 7: " << p7 << " ns\t represents\t" << float(int((double(p7)/pt)*100*100))/100 << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 8: " << p8 << " ns\t represents\t" << float(int((double(p8)/pt)*100*100))/100 << "%" << std::endl;
#endif


    return 0;
}
