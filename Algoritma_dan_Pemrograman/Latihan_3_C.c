//buat program untuk memasukkan angka, cek jika angka input itu positif, negatif, atau nol, kemudian tampilkan pesan yang sesuai
    #include <stdio.h>

    int main(){
        int nilai;
        printf("Masukkan nilai: ");
        scanf("%d", &nilai);
        if (nilai < 0 ){
        printf("Nilai: %d terdeteksi negatif\n", nilai);
        }   else if (nilai == 0){
            printf("Nilai: %d terdeteksi nol\n", nilai);
        }   else{
            printf("Nilai: %d terdeteksi positif\n", nilai);
        }

        return 0;
    }