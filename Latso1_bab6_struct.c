#include <stdio.h>

struct jam
{
    int jam;
    int menit;
    int detik;
};

struct jam jumlahjam(struct jam a, struct jam b)
{
    struct jam hasil;
    hasil.jam = a.jam + b.jam;
    hasil.menit = a.menit + b.menit;
    hasil.detik = a.detik + b.detik;
    
    while (hasil.detik >= 60 ){
        hasil.menit += 1;
        hasil.detik -= 60;
    }
    while (hasil.menit >= 60){
        hasil.jam += 1;
        hasil.menit -= 60;
    }
    return hasil;
}

int main(){
    struct jam j1, j2, total;

    printf ("Jam pertama (jam menit detik): ");
    scanf("%d %d %d", &j1.jam, &j1.menit, &j1.detik);

    printf ("Jam kedua (jam menit detik): ");
    scanf("%d %d %d", &j2.jam, &j2.menit, &j2.detik);

    total = jumlahjam(j1, j2);

    printf("Hasil penjumalahan: %d jam %d menit %d detik\n", total.jam, total.menit, total.detik);

    return 0;
}