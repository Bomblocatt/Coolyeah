#buat program perhitungan faktorial suatu bilangan dalam bahasa Python

def perhitungan_faktorial(bilangan_faktorial):
    hasil = 1
    for i in range(1, bilangan_faktorial + 1): 
        hasil *= i
    return hasil

angka_input = int(input("Masukkan bilangan: "))
hasil_akhir = perhitungan_faktorial(angka_input)
print(f"Hasil faktorial dari {angka_input} adalah {hasil_akhir}")