//buat prosedur bernama hitungLuasKeliling yang menerima dua parameter input (panjang dan lebar)
//serta dua parameter output (luas dan keliling) yang menggunakan pointer. 
//prosedur ini akan menghitung luas dan keliling persegi panjang berdasarkan panjang dan lebar yang diberikan

#include <stdio.h>

void hitungLuasKeliling(int panjang, int lebar, int *luas, int *keliling){
    *luas = panjang * lebar;
    *keliling = 2 * (panjang + lebar);
}

int main()
{
    int keliling, luas, panjang, lebar;

    printf("Masukkan panjang: ");
    scanf("%d", &panjang);

    printf("Masukkan lebar: ");
    scanf("%d", &lebar);

    hitungLuasKeliling(panjang, lebar, &luas, &keliling);

    printf("Luas: %d\n", luas);
    printf("Keliling: %d\n", keliling);

    return 0;
}