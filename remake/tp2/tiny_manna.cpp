/*
Jueguito:

1) Sea h[i] el numero de granitos en el sitio i, 0<i<N-1.

2) Si h[i]>1 el sitio i esta "activo".

3) Al tiempo t, un sitio "activo" se "descarga" completamente tirando cada uno de sus granitos aleatoriamente y con igual probabilidad a la izquierda o a la derecha (el numero total de granitos entonces se conserva).

4) Los sitios se descargan sincronicamente. Entonces, a tiempo (t+1), el sitio activo i tendra h[i]=0 solo si sus vecinos no le tiraron granitos a tiempo t.

5) Se define la actividad A como el numero de sitios activos, es decir el numero de sitios que quieren descargarse.
Notar que si la densidad de granitos, [Suma_i h[i]/N] es muy baja, la actividad caera rapidamente a cero. Si la densidad es alta por otro lado, la actividad nunca cesara, ya que siempre habra sitios activos. En el medio hay una densidad "critica", para la cual la actividad decaera como una ley de potencia (pero se necesitaran sistemas grandes, y tiempos largos para verla bien definida).

*/

// #pragma GCC optimize("O3","unroll-loops","omit-frame-pointer","inline") //Optimization flags
// #pragma GCC option("arch=native","tune=native","no-zero-upper") //Enable AVX
// #pragma GCC target("avx")  //Enable AVX

#include "params.h"

#include <array>
// #include <cstdlib>
#include <fstream>
#include <iostream>
// #include <vector>
#include <chrono>
// #include <numeric>
#include <cstring>
#include <random>
// #include <x86intrin.h>
#include <omp.h>
#include "XoshiroCpp.hpp"

// #define NUM_THREADS 4
#define ull unsigned long long
#define ll long long

// std::minstd_rand generator;
const std::uint64_t OTHER_SEED = 12345;
XoshiroCpp::SplitMix64 initial_generator(OTHER_SEED); // TODO: CHANGE TO 256 FOR SIMD

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
            int j = i + 2 * (initial_generator() & 1) - 1; // izquierda o derecha

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

// DESCARGA DE ACTIVOS Y UPDATE --------------------------------------------------------
static void descargar(Manna_Array& h, Manna_Array& dh, Manna_Array& rh)
{
#ifdef PROFILE
    auto start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 1
    dh.fill(0);

#ifdef PROFILE
    auto end = std::chrono::high_resolution_clock::now();
    time_recorder_p1.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 2
    unsigned short lindex, rindex, lh_i, h_i, rh_i, l, r;
    #pragma omp parallel for schedule(static) private(lindex, rindex, lh_i, h_i, rh_i, l, r) shared(h, dh, rh)
    for (int i = 0; i < NN; ++i){
        lindex = (i + NN - 1) % NN;
        rindex = (i + 1)      % NN;

        lh_i = h[lindex], h_i = h[i], rh_i = h[rindex];

        l = lh_i <= 1 ? 0 :        __builtin_popcount(rh[lindex] & ((1 << lh_i) - 1));
        r = rh_i <= 1 ? 0 : rh_i - __builtin_popcount(rh[rindex] & ((1 << rh_i) - 1));
 
        dh[i] = (h_i == 1 ? 1 : 0) + l + r ;
    }
#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p2.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 3
    // unsigned short last = rh[NN - 1];
    // std::memmove(rh.data() + 1, rh.data(), (NN - 1) * sizeof(unsigned short));
    // rh[0] = last;

    // unsigned short first = dh[0];
    // std::memmove(dh.data(), dh.data() + 1, (NN - 1) * sizeof(unsigned short));
    // dh[NN - 1] = first;
    
#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p3.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif

    // for (int i = 0; i < NN; ++i) {
    //     h[i] = dh[i] + rh[i] + (h[i] == 1 ? 1 : 0);
    // }
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
    alignas(64) Manna_Array h, dh, rh, *ph, *pdh, *prh, *ptmp;
    ph = &h;
    pdh = &dh;
    prh = &rh;

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

    std::ofstream activity_out("pilas.dat");
    int activity;
    int t = 0;
    std::vector<ull> time_recorder;
    // Print amount of threads omp
    int threads = omp_get_max_threads();
    // XoshiroCpp::SplitMix64* generators;
    // for (int i = 0; i < threads; ++i) generators[i] = XoshiroCpp::SplitMix64(initial_generator());

    // # pragma omp parallel for schedule(static) shared(rh)
    for (int i = 0; i < NN; ++i) rh[i] = initial_generator(); //generators[omp_get_thread_num()]();

    // omp_set_num_threads(NUM_THREADS);
    std::cout << std::endl << "omp_get_max_threads() = " << threads << std::endl;
    // Assert threads is a power of 2
    // assert((threads & (threads - 1)) == 0);
    do {
        activity = 0;
        // TODO: Maybe pragma?
        // #pragma omp parallel for schedule(static)
        if (t % 2 == 0) {
            ph = &h;
            pdh = &dh;
            prh = &rh;
        } else {
            ph = &dh;
            pdh = &h;
            prh = &rh;
        }
        auto start = std::chrono::high_resolution_clock::now(); // Start measuring time
        
        descargar(*ph, *pdh, *prh);
        
        auto end = std::chrono::high_resolution_clock::now(); // Stop measuring time

        time_recorder.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());
        for(int i = 0; i < NN; ++i) if ((*ph)[i] > 1) activity += 1;
#ifdef STAT_TEST
        save_array(&activity_out, *ph);
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


    return 0;
}
