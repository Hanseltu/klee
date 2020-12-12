#include <stdio.h>
#include <string.h>
#include "klee/klee.h"

void bof(char *bof) {
    char buf[4194305];
    //strcpy(buf, bof);
    //printf("buf = %s\n", buf);
}

int main(int argc, char* argv[]) {
    int x = 0;
    char buf[20] = "daafasfsafaf";
    //klee_make_symbolic(&buf, sizeof(buf), "buf");
    //for (x = 0; x < sizeof(buf); x ++)
    //    klee_assume(buf[x] != '\x00');
    bof(buf);
    return 0;
}
