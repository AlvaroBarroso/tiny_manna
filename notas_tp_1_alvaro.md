# NOTAS TP 1 Alvaro
### CPU:
- AMD Ryzen 5 3600 6-Core Processor
- Thread(s) per core:  2
- Core(s) per socket:  6
- Socket(s):           1
- CPU max MHz:         4208,2031
- Caches (sum of all):     
  - L1d:                   192 KiB (6 instances)
  - L1i:                   192 KiB (6 instances)
  - L2:                    3 MiB (6 instances)
  - L3:                    32 MiB (2 instances)
- Empirical Roofline Toolkit: TODO

### Memoria (2x): 
- Size: 8 GB
- Type: DDR4
- Speed: 2133 MT/s
- Empirical Roofline Toolkit o STREAM: TODO

### Compiladores: `g++ (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0`.
### Sistema Operativo: `Ubuntu 22.04 LTS`

## Metrica: tiempo promedio que tarda de `descarga` en `ns`

##  Optimizacion parte 1 de `descarga`: OPTIMIZADOR + TIPOS
De `-O1` a `-O2` cambia como se blanquea `dh`:
```C++
dh.fill(0);
```
Ademas cambiamos de `int` a `unsigned short`

Pasamos de `17000` ns a `600` ns



## Optimizacion parte 3 de `descarga`: OPTIMIZADOR
De `-02` a `-03` cambia como se guarda:
```c++
unsigned int nroactivos = 0;
for (int i = 0; i < N; ++i) {
    h[i] += dh[i];
    nroactivos += (h[i] > 1);
}
```
de `22000` ns a `4000` ns



## Jugando con el RNG + Optimizacion parte 2 de `descarga`
Cambio de RNG, la parte 2:
Con rand(): `54000` ns
Con std::minstd_rand: `33000` ns

rand ~`10` ns, minstd_rand ~`3`ns
(medido en la metrica del TP)

Luego tratamos de optimizar esa parte cambiando el codigo:
- binomal distribution
- generar un numero aleatorio de 32bit y mirar bit por bit para 0 o 1
- usar `& 1` en vez de `% 2`. La opercion de mod es ligeramente mas costosa
- cambiar el generador de numeros aleatoreos rand() por otro mas rapido


Diferencias de tiempo en test artificial:
- mod %2: `573161` ns
- &1: `517458` ns
- getbit: `512247` ns (implementacion peligrosa)
- binom: `694297` ns
