## TP2
Notas:
- correr: `g++ -O3 -mavx2 -fopt-info-vec tiny_manna_tp2_rewrite.cpp && perf stat -r 5 ./a.out`
- tiempo total para NSTEPS viene de perf stat
- tiempo descarga promedio viene de usar timers dentro del codigo

Baseline TP1:
 tiempo total para NSTEPS = 8K: `0,32`s
 tiempo total para NSTEPS = 32K: `1,2`s
 tiempo descarga promedio: 36000 ns

Opt pero sin intrinsics:
 tiempo total para NSTEPS = 8K: `0,98`s
 tiempo total para NSTEPS = 32K: `3,8`s
 tiempo descarga promedio: 120000 ns

Opt con intrinsics pero incorrecto:
 tiempo total para NSTEPS = 8K: `0,34`s
 tiempo total para NSTEPS = 32K: `1,4`s
 tiempo descarga promedio: 40000 ns

Rewrite entero con intrinsics parcial:
 tiempo total para NSTEPS = 8K: `0,22`s
 tiempo total para NSTEPS = 32K: `0,86`s
 tiempo descarga promedio: 26000 ns


Problema principal:
Cuando hace la simulacion de tirar arena para los costados no encontramos forma de hacerlo vectorizable mas que usar `__builtin_popcount`. Y `__builtin_popcount` no tiene una version intrinseca para AVX2.
Por lo tanto, no pudimos vectorizar esa parte del codigo. Solo encontramos una version vectorizable hecha por alguien cualquiera pero no es rapida.