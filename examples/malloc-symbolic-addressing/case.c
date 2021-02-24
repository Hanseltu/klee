#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "klee/klee.h"
int main(){
    int x;
    klee_make_symbolic(&x, sizeof(x), "x");
    int *buff1;
    int *buff2;
    if (x > 100){
        buff1 = (int*) malloc(16);
    }
    else {
        buff2 = (int*) malloc(1600);
    }

    int *buff3 = (int*) malloc(4*64);
    klee_make_symbolic(buff3, 4*64, "buff3");

    if (buff3 == buff1 + 16) {
        buff3[32] = 16;
    }
    else {
        buff3[32] = 1600;
    }

    assert(buff3 == buff1 + 16 && buff3[32] == 1600);
    return 0;
}
