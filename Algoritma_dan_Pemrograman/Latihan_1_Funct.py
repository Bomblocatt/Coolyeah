#Buat program yang menghitung faktorial dari suatu bilangan dalam python

angka = int(input("Masukkan angka: "))

hasil = 1
for i in range(1, angka+1):
    hasil = hasil * i

print(angka, "! = ", hasil,sep="")