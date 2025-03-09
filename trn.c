#include <stdint.h>
#include <string.h>

void trn_int(char* source) {
    size_t lenght = strlen(source);
    source[lenght] = '\0';
    for (size_t i=0;i < lenght;++i) {
        if (source[i] >= '0' && source[i] <= '9')
            source[i] -= '0';
    }
}

void trn_str(int64_t* source, char* result) {
    if (source == NULL || *source == 0) {
        strcpy(result, "0");
        return;
    }

    int index = 0;
    while (*source > 0) {
        int digit = *source % 10;
        result[index++] = digit + '0';
        *source /= 10;
    }

    result[index] = '\0';


    for (int i = 0; i < index / 2; ++i) {
        char temp = result[i];
        result[i] = result[index - i - 1];
        result[index - i - 1] = temp;
    }
}
