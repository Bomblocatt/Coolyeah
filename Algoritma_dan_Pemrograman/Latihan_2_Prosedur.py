#Masukkan sejumlah n bilangan kemudian program akan menghitung jumlah rata-rata dari bilangan yang dimasukkan user

def prosedur_rata_rata(n):
    total = 0
    
    for i in range(1, n + 1):
        bilangan = float(input(f"Masukkan bilangan ke-{i}: "))
        total += bilangan
        
    rata_rata = total / n
    print(f"\nJumlah total: {total}")
    print(f"Rata-rata dari {n} bilangan tersebut adalah: {rata_rata}")

print("Program Hitung Rata-rata")
jumlah_n = int(input("Masukkan banyaknya bilangan (n) yang ingin dihitung: "))

prosedur_rata_rata(jumlah_n)