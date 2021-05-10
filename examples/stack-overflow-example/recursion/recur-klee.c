#include <stdio.h>
#include "klee/klee.h"

int call_me(int a){
    return call_me(a);
}

int main(int argc, char* argv[]){
    int a;
    klee_make_symbolic(&a, sizeof(a), "a");
    int ret = call_me(a);
    printf("ret = %d\n", ret);
    return 0;
}
