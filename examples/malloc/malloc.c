#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "klee/klee.h"
int main(int argc, char** argv){

    if (argc < 2) {
        printf("please give an input\n");
        exit(1);
    }
    int a;
    //klee_make_symbolic(&a, sizeof(a), "a");
    //int b = a + 100;
    //b = 1;
    int b;

    int c = argv[1];
    printf("input is %s\n", c);

    //a = 0;
    if (a > 0)
        b = 999;
    else
        b = 777;

    struct str {
        int a;
        int *p;
        int c;
    };
    //int c;
    //klee_make_symbolic(&c, sizeof(c), "c");
    //assert(klee_is_symbolic(a));
    //klee_make_malloc_symbolic("sym_address");
    int *p1 = (int*) malloc(8*100);
    //int *p2 = (int*) malloc(8*100);
    //int *p3 = (int*) malloc(8*100);
    struct str * p_str = (struct str*)malloc(sizeof(struct str*)*100);
    //int p1[800];
    //klee_make_symbolic(&p1, 8, "p");
    //assert(klee_is_symbolic(p1));
    //klee_make_malloc_symbolic("sym_haoxin_new");
    //int *p2 = (int*) malloc(8*100);
    //int *p3 = (int*) malloc(8*100);
    p_str->a = 100;
    p_str->c = 200;
    //*(p1+1)= 999;
    //*(p1+99)= 888;
    //*p2 = 999;
    if (p_str > 16) {
    //    p1[32] = 999;
        //int aa = p1[32];
        //printf("aa = %d\n", aa);
        ;
    }
    else{
     ;//    p1[33] = 888;
    }
    //*p3 = 1000;
    //long long *p2 = malloc(8*100);
    // load symbolic (p1+100) first then write to pp1
    //int *pp1 = p1 + 1;
    // load concrete (p1+100) first then write 2 to concrete address
    //*(pp1 + 100+ 100) = 2 + a;
    //if (0 < 10000){
    //   printf("1th path\n");
    //}else{
    //    printf("2th path\n");
    //    }
    //for (;;){
    //    break;
    //}
    //char *p3 = malloc(8*100);
    //double *p4 = malloc(8*100);
    //long  *p5 = malloc(8*100);
    //assert(klee_is_symbolic(p1));
    //assert(klee_is_symbolic(pp1));
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
    //printf("aa = %d\n", aa);
    //printf("the address of p1 is %d \n ", p1);
    //printf("the address of *p1 is %d \n ", *p1);
    //printf("the value of *p1+99 is %d\n", *(p1+99));
    //printf("the value of *p1+1 is %d\n", *(p1+1));
    printf("the value of p_str.a is %d\n", p_str->a);
    printf("the value of p_str.c is %d\n", p_str->c);
    printf("%p\n", p_str);
    free(p1);
    //free(p1);
    //return b;
    //klee_print_expr("Expr:", a);
    return 0;
}
