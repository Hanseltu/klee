#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "klee/klee.h"
int main(){

    //long long a;
    //klee_make_symbolic(&a, sizeof(a), "a");
    /*
    int b = a + 10;
    b = 100;

    //a = 0;
    if (a > 0)
        b = 999;
    else if (a == 0)
        a = 888;
    else
        b = 777;
        */

    //assert(klee_is_symbolic(a));
    klee_make_malloc_symbolic("sym_haoxin");
    int *p1 = (int*) malloc(8*100);
    //klee_make_symbolic(p1, sizeof(int*), "p");
    //assert(klee_is_symbolic(p1));
    int *p2 = (int*) malloc(8*100);
    //int *p3 = (int*) malloc(8*100);
    //*p1= 999;
    //*p3 = 1000;
    //long long *p2 = malloc(8*100);
    int *pp1 = p1 + 100;
   // *(p1+100) = 100;
    //*(pp1 + 100) = 200;
    if (p1 < 10000){
       printf("1th path\n");
    }else{
        printf("2th path\n");
        }
    //char *p3 = malloc(8*100);
    //double *p4 = malloc(8*100);
    //long  *p5 = malloc(8*100);
    assert(klee_is_symbolic(p1));
    assert(klee_is_symbolic(pp1));
    //assert(klee_is_symbolic(p1));
    //assert(klee_is_symbolic(p3));
    //assert(klee_is_symbolic(p4));
    //assert(klee_is_symbolic(p5));
    //int c = 0;
    //int d;
    //d = 10;
    //klee_make_symbolic(p1, 800, "test_sym");
    //*p5 = 100;
    //if (p1 < a + 100)
    //    printf("1\n");
    //else
    //    printf("2\n");
    //printf("sizeof(int) = %d\n", sizeof(int));
    //printf("the address of p1 is %d \n ", p1);
    //printf("the address of *p1 is %d \n ", *p1);
    //printf("the value of *p1 is %d\n", *(p1+199));
    //return b;
    //klee_print_expr("Expr:", a);
    return 0;
}
