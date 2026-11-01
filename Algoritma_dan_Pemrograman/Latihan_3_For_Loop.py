#Buatlah program menggunakan for loop yang menerima input bilangan dari pengguna sebanyak 10 kali dan mencari bilangan terkecil lalu tampilkan

bilangan_terkecil = int(input("Masukkan bilangan ke-1: "))

for i in range(2,11):
    bilangan = int(input(f"Masukkan bilangan ke-{i}: "))

    if bilangan < bilangan_terkecil:
        bilangan_terkecil = bilangan

print("-" * 30)
print(f"Bilangan terkecil adalah: {bilangan_terkecil}")