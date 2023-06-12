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
// #include <cstdio>
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
const std::uint64_t OTHER_SEED = 123456;
XoshiroCpp::SplitMix64 initial_generator(OTHER_SEED); // TODO: CHANGE TO 256 FOR SIMD

// IDEA OPT: Change to `unsigned` and use `short` instead of `int`
typedef std::array<unsigned short, NN> Manna_Array; // fixed-sized array
typedef unsigned short* Small_Manna_Array;

class UnboundedMannaProblem {
private:
public:
    Small_Manna_Array h, dh;
    XoshiroCpp::SplitMix64 generator;
    unsigned short spill_left, spill_right;
    int size;

    // Constructor
    UnboundedMannaProblem(int ssize)
    :spill_left(0), spill_right(0), generator(initial_generator()), size(ssize){
        try {
            h = new unsigned short[ssize];
            dh = new unsigned short[ssize];
        } catch (const std::bad_alloc&) {
            throw std::runtime_error("Failed to allocate memory");
        }
    }

    // Swap ph y pdh
    void Swap() {
        Small_Manna_Array tmp;
        tmp = h;
        h = dh;
        dh = tmp;
    }
    ~UnboundedMannaProblem() {
        delete[] h;
        delete[] dh;
    }
    
};


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
static void descargar(UnboundedMannaProblem* ump)
{
#ifdef PROFILE
    auto start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 1
    Small_Manna_Array& h = ump->h;
    Small_Manna_Array& dh = ump->dh;
    // std::cout<<"aa"<<std::endl;
    std::fill_n(dh, ump->size, 0);
    // std::cout<<"bb"<<std::endl;

#ifdef PROFILE
    auto end = std::chrono::high_resolution_clock::now();
    time_recorder_p1.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    unsigned short spill_left, spill_right;
    unsigned short prev_right;
    unsigned short curr_left, curr_reminder ,curr_right;
    unsigned short next_left, next_reminder ,next_right;
    XoshiroCpp::SplitMix64 g = ump->generator;
    
    prev_right = 0;
    if (h[0] <= 1) {
        curr_left = 0;
        curr_reminder = h[0];
        curr_right = 0;
    } else {
        curr_left = __builtin_popcount(g() & ((1 << h[0]) - 1));
        curr_reminder = 0;
        curr_right = h[0] - curr_left;
    }

    if (h[1] <= 1) {
        next_left = 0;
        next_reminder = h[1];
        next_right = 0;
    } else {
        next_left = __builtin_popcount(g() & ((1 << h[1]) - 1));
        next_reminder = 0;
        next_right = h[1] - next_left;
    }

    dh[0] = curr_reminder + next_left; // No prev right
    spill_left = curr_left;

    prev_right = curr_right;

    curr_left = next_left;
    curr_reminder = next_reminder;
    curr_right = next_right;

    for(int i = 1; i < ump->size - 1; ++i){
        if (h[i+1] <= 1) {
            next_left = 0;
            next_reminder = h[i+1];
            next_right = 0;
        } else {
            next_left = __builtin_popcount(g() & ((1 << h[i+1]) - 1));
            next_reminder = 0;
            next_right = h[i+1] - next_left;
        }

        dh[i] = prev_right + curr_reminder + next_left;
        prev_right = curr_right;
        
        curr_left = next_left;
        curr_reminder = next_reminder;
        curr_right = next_right;
    }

    dh[ump->size - 1] = prev_right + curr_reminder;
    spill_right = curr_right;

    ump->spill_left = spill_left;
    ump->spill_right = spill_right;
}

//===================================================================
#ifdef STAT_TEST
void save_array(std::ofstream* activity_out, UnboundedMannaProblem** umps, int threads){
    for(int i = 0; i < threads; ++i){
        for(int j = 0; j < NN/threads ; ++j){
            *activity_out << umps[i]->h[j] << ",";
        }
    }
    *activity_out << "\n";
}
#endif

//===================================================================
int main()
{

    // nro granitos en cada sitio, y su update
    alignas(64) Manna_Array h;

    std::cout << "estado inicial estable de la pila de arena...";
    inicializacion(h);
    std::cout << "LISTO" << std::endl;

    std::cout << "estado inicial desestabilizado de la pila de arena...";
    desestabilizacion_inicial(h);
    std::cout << "LISTO" << std::endl;

    std::cout << "evolucion de la pila de arena...\n";
    std::cout.flush();

#ifdef STAT_TEST
    std::ofstream activity_out("pilas.dat");
#endif
    int activity;
    int t = 0;
    std::vector<ull> time_recorder;
    // Print amount of threads omp
    int threads = omp_get_max_threads(); ;
    UnboundedMannaProblem** umps = new UnboundedMannaProblem*[threads];

    for (int i = 0; i < threads; ++i) {
        umps[i] = new UnboundedMannaProblem(NN/threads);

        // Access and modify the Manna arrays of the i-th problem
        Small_Manna_Array& hArray = umps[i]->h;

        // Example usage: assign values to the arrays
        for (int j = 0; j < NN/threads; ++j) {
            hArray[j] = h[(i * (NN/threads))+j];
        }
    }

    std::cout << std::endl << "omp_get_max_threads() = " << threads << std::endl;
#ifdef STAT_TEST
        save_array(&activity_out, umps, threads); // TODO: CHANGE
#endif
    do {
        activity = 0;
        auto start = std::chrono::high_resolution_clock::now();
        # pragma omp parallel for num_threads(threads)
        for(int i = 0; i < threads; ++i){
            descargar(umps[i]);
        }

        // std::cout<<"entro a correccion" << std::endl;
        for(int i = 0; i < threads; ++i){
            UnboundedMannaProblem* next_ump = umps[(i + 1) % threads];
            UnboundedMannaProblem* prev_ump = umps[(i - 1 + threads) % threads];

            umps[i]->dh[0]    += prev_ump->spill_right;
            umps[i]->dh[(NN/threads) - 1] += next_ump->spill_left;
        }
        // std::cout<<"salio a correccion" << std::endl;

        
        // std::cout<<"entro a swaps" << std::endl;
        for(int i = 0; i < threads; ++i){
            // std::cout<< "h tiene valor "<< (umps[i]->h) <<std::flush;
            // std::cout<< " y apunta " << *(umps[i]->h) << std::endl;
            umps[i]->Swap(); // TODO: Ojo
            // std::cout<< "h tiene valor "<< (umps[i]->h) <<std::flush;
            // std::cout<< " y apunta " << *(umps[i]->h) << std::endl;
        }
        // std::cout<<"salio a swaps" << std::endl;

        auto end = std::chrono::high_resolution_clock::now();

        time_recorder.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());


        // std::cout<<"entro a actividad" << std::endl;
        for(int i = 0; i < threads; ++i) {
            // std::cout<< "h tiene valor "<< (umps[i]->h) <<std::flush;
            // std::cout<< " y apunta " << *(umps[i]->h) << std::endl;
            for(int j = 0; j < NN/threads; ++j){
                // std::cout<<"i: "<< i << " and j: "<<j << std::endl;
                if (umps[i]->h[j] > 1) activity += 1;
            }
        }
        // std::cout<<"salio a actividad" << std::endl;

        // std::cout << "\r Activity" << t << " " << activity << std::endl;
#ifdef STAT_TEST
        save_array(&activity_out, umps, threads); // TODO: CHANGE
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
