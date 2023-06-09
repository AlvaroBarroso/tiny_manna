REPETITIONS=5
PROGRAM_NAME="tiny_manna"
ORIGINAL_PROGRAM_NAME="tiny_manna_original"

# Para PROFILE, ir a params.h y agregar:
#ifndef PROFILE
#define PROFILE
#endif

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

compile_and_run "O1" $PROGRAM_NAME
compile_and_run "O2" $PROGRAM_NAME
compile_and_run "O3" $PROGRAM_NAME
compile_and_run "Ofast" $PROGRAM_NAME

compile_and_run "O3" $ORIGINAL_PROGRAM_NAME