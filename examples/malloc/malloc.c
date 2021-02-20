#include <stdio.h>
#include <stdlib.h>
#include "klee/klee.h"
int main(){
    int a = 0,b;
    klee_make_symbolic(&a, sizeof(a), "a");
    //a = 0;
    if (a > 0)
        b = 999;
    else if (a == 0)
        b = 888;
    else
        b = 777;

    int *p1 = (int*) malloc(8*100);
    //klee_make_symbolic(p1, sizeof(16), "test_sym");
    *(p1 + 199) = 100;
    int *p2 = p1;
    if (p2 < p1 + 100)
        printf("1\n");
    else
        printf("2\n");
    //printf("sizeof(int) = %d\n", sizeof(int*));
    printf("the address of p1 is %d \n ", p1);
    printf("the value of *p1 is %d\n", *(p1+199));
    //return b;
    //klee_print_expr("Expr:", a);
    return 0;
}
