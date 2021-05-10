#include <stdio.h>

int main(int argc, char* argv[]) {
    // 8M = 8388608 bytes
    if (0) {
    char buf[8388608] = "I love SMU!\n";
    printf("%s", buf);
    return 1;
    }
    return 0;
}
