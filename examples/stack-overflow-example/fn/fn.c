#include <stdio.h>

int main(int argc, char* argv[]) {
    // 8M = 8388608 bytes
    char buf[8388608] = "I love DUT!\n";
    printf("%s", buf);
    return 0;
}
