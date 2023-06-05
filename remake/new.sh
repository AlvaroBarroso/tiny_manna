REPETITIONS=5
PROGRAM_NAME="tiny_manna"
ORIGINAL_PROGRAM_NAME="tiny_manna_original"
OMP_NUM_THREADS=8

# compile_and_run takes one argument, which is the optimization level, complies the code, runs it 5 times and saves the perf stat output to a file.
compile_and_run() {
    # filename i.e: "tiny_manna_O1"
    filename=$2"_"$1
    
    echo "Running $filename"

    # Remove files from previous runs
    rm $filename-perf-stat.txt $filename-out.txt

    g++ -$1 -save-temps -o $filename.out $2.cpp && perf stat -r $REPETITIONS ./$filename.out 2> $filename-perf-stat.txt >> $filename-out.txt
    
    # Remove .ii and .o files
    rm $filename.out $filename.out-$2.ii $filename.out-$2.o
}

run_checkers(){
    echo "Running checker mode. 3 steps"
    
    # First, we complice tiny_manna with the STAT_TEST flag without console output
    echo "Step 1/3: Compiling"

    g++ -O3 -march=native -fopt-info-vec-optimized -fopenmp -mavx2 -DSTAT_TEST -DNN=1024 tiny_manna.cpp -o tiny_manna_stat_test.out 
    
    echo "Step 2/3: Running tiny manna"
    OMP_NUM_THREADS=$OMP_NUM_THREADS ./tiny_manna_stat_test.out #> /dev/null 2>&1 
    
    echo "Step 3/3: Running checker"
    python ../check_invariants.py pilas.dat
}


profile_detalle_descarga(){
    echo "Running DETALLE profile mode. 2 steps"
    
    echo "Step 1/2: Compiling"

    g++ -O3 -march=native -fopt-info-vec-optimized -fopenmp -mavx2 -DPROFILE -DNN=32768 tiny_manna.cpp -o tiny_manna_profile.out 
    
    echo "Step 2/2: Running tiny manna"
    OMP_NUM_THREADS=$OMP_NUM_THREADS ./tiny_manna_profile.out

}

profile_descarga(){
    echo "Running profile mode. 2 steps"
    
    echo "Step 1/2: Compiling"

    clang++ -O3 -march=native -fopenmp -mavx2 -DNN=32768 tiny_manna.cpp -o tiny_manna_profile.out 
    
    echo "Step 2/2: Running tiny manna"
    # OMP_NUM_THREADS=$OMP_NUM_THREADS ./tiny_manna_profile.out
    OMP_NUM_THREADS=$OMP_NUM_THREADS perf stat -r 1 ./tiny_manna_profile.out

}

profile_descarga_simd(){
    echo "Running SIMD profile mode. 2 steps"
    
    echo "Step 1/2: Compiling"

    g++ -O3 -march=native -fopt-info-vec-optimized -fopenmp -mavx2 -DNN=32768 tiny_manna_simd.cpp -o tiny_manna_profile_simd.out 
    
    echo "Step 2/2: Running tiny manna"
    # OMP_NUM_THREADS=$OMP_NUM_THREADS ./tiny_manna_profile_simd.out
    OMP_NUM_THREADS=$OMP_NUM_THREADS perf stat -r 5 ./tiny_manna_profile_simd.out
}


# TODO: hacer el que corre con perf stat


# Descomentar para correr los checkers
# run_checkers

# Descomentar para correr el profile CON DETALLE
# profile_detalle_descarga
# 
profile_descarga

# profile_descarga_simd

# Esto de abajo es viejo
# compile_and_run "O1" $PROGRAM_NAME
# compile_and_run "O2" $PROGRAM_NAME
# compile_and_run "O3" $PROGRAM_NAME
# compile_and_run "Ofast" $PROGRAM_NAME

# compile_and_run "O3" $ORIGINAL_PROGRAM_NAME