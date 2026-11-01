#include <stdio.h>

int ages[100];

int main() {
    // isi data ke array
    for (int i = 0; i < 100; i++) {
        ages[i] = i;
    }

    // cetak isi data
    for (int j = 0; j < 100; j++) {
        printf("%d \n", ages[j]);
    }

    return 0;
}