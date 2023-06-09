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

std::minstd_rand generator;

// IDEA OPT: Change to `unsigned` and use `short` instead of `int`
typedef std::array<unsigned short, N> Manna_Array; // fixed-sized array

// CONDICION INICIAL ---------------------------------------------------------------
/*
Para generar una condicion inicial suficientemente uniforme con una densidad
lo mas aproximada (exacta cuando N->infinito) al numero real DENSITY, podemos hacer asi:
*/
static void inicializacion(Manna_Array& h)
{
    for (int i = 0; i < N; ++i) {
        h[i] = static_cast<unsigned short>((i + 1) * DENSITY) - static_cast<unsigned short>(i * DENSITY);
    }
}


#ifdef DEBUG
static void imprimir_array(const Manna_Array& h)
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
static void desestabilizacion_inicial(Manna_Array& h)
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
static void descargar(Manna_Array& h, Manna_Array& dh)
{
#ifdef PROFILE
    auto start = std::chrono::high_resolution_clock::now();
    // PARTE 1
#endif

    dh.fill(0); // IDEA OPT: Ineficiente?

#ifdef PROFILE
    auto end = std::chrono::high_resolution_clock::now();
    time_recorder_p1.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 2
    for (unsigned short i = 0; i < N; ++i) {

        // si es activo lo descargo aleatoriamente
        if (h[i] > 1) {
            for (int j = 0; j < h[i]; ++j) {
                // sitio receptor a la izquierda o derecha teniendo en cuenta condiciones periodicas
                int k = (i + 2 * (generator() & 1) - 1 + N) % N;
                ++dh[k];
            }
        }
    }

#ifdef PROFILE
    end = std::chrono::high_resolution_clock::now();
    time_recorder_p2.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());

    start = std::chrono::high_resolution_clock::now();
#endif
    // PARTE 3
    for (int i = 0; i < N; ++i) {
        h[i] = dh[i] + ((h[i] == 1) ? 1 : 0);
    }
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
    Manna_Array h, dh;

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
        
        descargar(h, dh);
        
        auto end = std::chrono::high_resolution_clock::now(); // Stop measuring time
        time_recorder.push_back(std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count());
        // std::cout<<h[0]<<" "<<h[1]<<" "<<h[2]<<" "<<h[3]<<" "<<h[4]<<" "<<h[5]<<" "<<h[6]<<std::endl;

        for(int i = 0; i < N; ++i) if (h[i] > 1) activity += 1;
        activity_out << activity << "\n";
#ifdef DEBUG
        imprimir_array(h);
#endif
        ++t;
    } while (activity > 0 && t < NSTEPS); // si la actividad decae a cero, esto no evoluciona mas...

    std::cout << "LISTO: " << ((activity > 0) ? ("se acabo el tiempo\n") : ("la actividad decayo a cero\n")) << std::endl;
    
    int pt = std::accumulate(time_recorder.begin(), time_recorder.end(), 0) / time_recorder.size();
    std::cout << "Tiempo promedio de ejecucion: " << pt << " ns" << std::endl;

#ifdef PROFILE
    int p1 = std::accumulate(time_recorder_p1.begin(), time_recorder_p1.end(), 0) / time_recorder_p1.size();
    int p2 = std::accumulate(time_recorder_p2.begin(), time_recorder_p2.end(), 0) / time_recorder_p2.size();
    int p3 = std::accumulate(time_recorder_p3.begin(), time_recorder_p3.end(), 0) / time_recorder_p3.size();

    std::cout << "Tiempo promedio de ejecucion de la parte 1: " << p1 << " ns represents" << float(p1)/float(pt) << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 2: " << p2 << " ns represents" << float(p2)/float(pt) << "%" << std::endl;
    std::cout << "Tiempo promedio de ejecucion de la parte 3: " << p3 << " ns represents" << float(p3)/float(pt) << "%" << std::endl;
#endif


    return 0;
}
