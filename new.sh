REPETITIONS=5
PROGRAM_NAME="tiny_manna"

# Para PROFILE, ir a params.h y agregar:
#ifndef PROFILE
#define PROFILE
#endif

# compile_and_run takes one argument, which is the optimization level, complies the code, runs it 5 times and saves the perf stat output to a file.
compile_and_run() {
    # filename i.e: "tiny_manna_O1"
    filename=$PROGRAM_NAME"_"$1
    
    echo "Running $filename"

    # Remove files from previous runs
    rm $filename-perf-stat.txt $filename-out.txt

    g++ -$1 -save-temps -o $filename.out $PROGRAM_NAME.cpp && perf stat -r $REPETITIONS ./$filename.out 2> $filename-perf-stat.txt >> $filename-out.txt
    
    # Remove .ii and .o files
    rm $filename.out $filename.out-$PROGRAM_NAME.ii $filename.out-$PROGRAM_NAME.o
}

compile_and_run "O1"
compile_and_run "O2"
compile_and_run "O3"
compile_and_run "Ofast"