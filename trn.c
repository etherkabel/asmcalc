#include <stdint.h>

void trn_int(char* source) {
    *(source + (sizeof(source))) = '\0';
    for (int i=0;*(source + i) != '\0';++i) {
        *(source + i) -= 48;
    }
}

void trn_str(int64_t* source, char* result) {
    int source_rem = 0;
    for (int i=0;*source != 0;++i) {
        source_rem = *source % 10;
        *(result + i) = source_rem += 48;
        *source /= 10;
    }
}
