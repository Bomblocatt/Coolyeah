-- 1. Buat & Gunakan Database
CREATE DATABASE IF NOT EXISTS db_apotek;
USE db_apotek;

-- 2. Hapus tabel lama jika ada (agar tidak bentrok)
DROP TABLE IF EXISTS inventaris_obat;
DROP TABLE IF EXISTS obat;

-- 3. Buat Tabel Obat Baru (Sesuai Soal)
CREATE TABLE obat (
    id_obat INT PRIMARY KEY AUTO_INCREMENT,
    nama_obat VARCHAR(100) NOT NULL,
    kategori VARCHAR(50) NOT NULL,
    harga_satuan DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL,
    keterangan VARCHAR(100)
);

-- 4. Masukkan Data Sampel
INSERT INTO obat (nama_obat, kategori, harga_satuan, stok, keterangan) VALUES
('Paracetamol 500mg', 'Analgesik', 5000.00, 120, 'Penurun demam'),
('Amoxicillin 500mg', 'Antibiotik', 15000.00, 45, 'Wajib resep dokter'),
('Vitamin C 1000mg', 'Suplemen', 25000.00, 200, NULL),
('Ibuprofen 400mg', 'Analgesik', 12000.00, 80, 'Pereda nyeri'),
('Antasida Doen', 'Pencernaan', 8000.00, 5, 'Obat maag kunyah');


-- JAWABAN TANTANGAN LAB: INVENTARIS KLINIK

-- Soal 1: Filter & Urutan (Stok < 50 dari terkecil)
SELECT nama_obat, stok, harga_satuan, keterangan
FROM obat
WHERE stok < 50 
ORDER BY stok ASC;

-- Soal 2: Pola & NULL (Keterangan NULL atau mengandung kata 'nyeri')
SELECT nama_obat, kategori, keterangan
FROM obat
WHERE keterangan IS NULL OR keterangan LIKE '%nyeri%';

-- Soal 3: Ringkasan Kategori (Harga termahal & total aset per kategori)
SELECT kategori, 
       MAX(harga_satuan) AS harga_termahal, 
       SUM(stok * harga_satuan) AS total_aset
FROM obat 
GROUP BY kategori;

-- Soal 4: Seleksi HAVING (Rata-rata harga > 12000)
SELECT kategori, 
       AVG(harga_satuan) AS rata_rata_harga
FROM obat 
GROUP BY kategori 
HAVING AVG(harga_satuan) > 12000;