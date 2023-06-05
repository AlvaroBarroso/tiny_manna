#include <omp.h>
#include <stdio.h>
 
int main()
{
 
    #pragma omp parallel for// num_threads(4)
    for (int i = 1; i <= 16; i++) {
        int tid = omp_get_thread_num();
        #pragma omp critical
        {
            printf("The thread %d  executes i = %d\n", tid, i);
        }
    }
 
    return 0;
}