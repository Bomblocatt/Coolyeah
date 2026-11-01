#buat program untuk memasukkan angka, cek jika angka input itu positif, negatif, atau nol, kemudian tampilkan pesan yang sesuai
input_angka = int(input("Masukkan angka: "))

if input_angka == 0:
    print("Angka tersebut adalah nol")
elif input_angka > 0:
    print("Angka tersebut adalah positif")
else:
    print("Angka tersebut adalah negatif")