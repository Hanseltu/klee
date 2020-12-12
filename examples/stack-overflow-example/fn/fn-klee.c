#include <stdio.h>
#include "klee/klee.h"

int main(int argc, char* argv[]) {
    int i = 0;
    // 8M = 8388608 bytes
    char buf[8388608] = "I love DUT!\n";
    klee_make_symbolic(&buf, sizeof(buf), "buf");
    for (i = 0; i < sizeof(buf); i ++)
        klee_assume(buf[i] != '\x00');
    printf("%s", buf);
    return 0;
}
