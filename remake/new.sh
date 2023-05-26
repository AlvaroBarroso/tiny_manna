REPETITIONS=5
PROGRAM_NAME="tiny_manna"
ORIGINAL_PROGRAM_NAME="tiny_manna_original"


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

compile_and_run_with_checkers(){
    echo "Running checker mode"
    
    # First, we complice tiny_manna with the STAT_TEST flag without console output
    echo "Compiling"

    g++ -O3 -DSTAT_TEST -DN=1024 tiny_manna.cpp -o tiny_manna_stat_test.out 
    
    echo "Running tiny manna"
    ./tiny_manna_stat_test.out
    
    echo "Running checker"
    python ../check_invariants.py pilas.dat
}

compile_and_run_with_checkers

# compile_and_run "O1" $PROGRAM_NAME
# compile_and_run "O2" $PROGRAM_NAME
# compile_and_run "O3" $PROGRAM_NAME
# compile_and_run "Ofast" $PROGRAM_NAME

# compile_and_run "O3" $ORIGINAL_PROGRAM_NAME