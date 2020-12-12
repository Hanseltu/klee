#include <stdio.h>
#include <string.h>
#include "klee/klee.h"

void bof(char *bof) {
    char buf[10];
    strcpy(buf, bof);
    printf("buf = %s\n", buf);
}

int main(int argc, char* argv[]) {
    int i = 0;
    char buf[20] = "I love DUT!";
    klee_make_symbolic(&buf, sizeof(buf), "buf");
    for (i = 0; i < sizeof(buf); i ++)
        klee_assume(buf[i] != '\x00');
    bof(buf);
    return 0;
}
