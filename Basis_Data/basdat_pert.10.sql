-- 1. Buat & Gunakan Database
CREATE DATABASE IF NOT EXISTS db_apotek;
USE db_apotek;

-- 2. Hapus tabel lama jika ada (urutan hapus dari child ke parent agar tidak bentrok foreign key)
DROP TABLE IF EXISTS transaksi_resep;
DROP TABLE IF EXISTS obat;
DROP TABLE IF EXISTS kategori_obat;

-- 3. Buat Tabel Kategori Obat
CREATE TABLE kategori_obat (
    id_kategori INT PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(50) NOT NULL
);

-- 4. Buat Tabel Obat (Terhubung ke kategori_obat)
CREATE TABLE obat (
    id_obat INT PRIMARY KEY AUTO_INCREMENT,
    nama_obat VARCHAR(100) NOT NULL,
    id_kategori INT,
    harga_satuan DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL,
    keterangan VARCHAR(100),
    FOREIGN KEY (id_kategori) REFERENCES kategori_obat(id_kategori) ON DELETE SET NULL
);

-- 5. Buat Tabel Transaksi Resep (Terhubung ke obat)
CREATE TABLE transaksi_resep (
    id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    nama_pasien VARCHAR(100) NOT NULL,
    id_obat INT,
    jumlah_beli INT NOT NULL,
    tanggal_transaksi DATE NOT NULL,
    FOREIGN KEY (id_obat) REFERENCES obat(id_obat) ON DELETE SET NULL
);

-- 6. Masukkan Data Sampel Kategori
INSERT INTO kategori_obat (id_kategori, nama_kategori) VALUES
(1, 'Analgesik'),
(2, 'Antibiotik'),
(3, 'Suplemen'),
(4, 'Pencernaan'),
(5, 'Herbal'); -- Kategori 5 sengaja dibuat tanpa obat untuk Tugas 2

-- 7. Masukkan Data Sampel Obat
INSERT INTO obat (id_obat, nama_obat, id_kategori, harga_satuan, stok, keterangan) VALUES
(1, 'Paracetamol 500mg', 1, 5000.00, 120, 'Penurun demam'),
(2, 'Amoxicillin 500mg', 2, 15000.00, 45, 'Wajib resep dokter'),
(3, 'Vitamin C 1000mg', 3, 25000.00, 200, NULL),
(4, 'Ibuprofen 400mg', 1, 12000.00, 80, 'Pereda nyeri'),
(5, 'Antasida Doen', 4, 8000.00, 5, 'Obat maag kunyah'),
(6, 'Obat Batuk Hitam', NULL, 10000.00, 15, 'Obat batuk'); -- Obat 6 sengaja tidak pernah dibeli untuk Tugas 4

-- 8. Masukkan Data Sampel Transaksi
INSERT INTO transaksi_resep (nama_pasien, id_obat, jumlah_beli, tanggal_transaksi) VALUES
('Budi Santoso', 1, 2, '2026-11-01'),
('Siti Rahma', 2, 1, '2026-11-02'),
('Ahmad Dahlan', 3, 3, '2026-11-03'),
('Dewi Lestari', 4, 2, '2026-11-04'),
('Eko Prasetyo', 1, 1, '2026-11-05');


-- =========================================================
-- JAWABAN TANTANGAN LAB: RELASI TIGA TABEL (elDirU)
-- =========================================================

-- Tugas 1: Validasi Transaksi
SELECT 
    t.id_transaksi,
    t.nama_pasien,
    o.nama_obat,
    o.harga_satuan
FROM transaksi_resep t
INNER JOIN obat o ON t.id_obat = o.id_obat;

-- Tugas 2: Audit Kategori Obat
SELECT 
    k.nama_kategori,
    o.nama_obat
FROM kategori_obat k
LEFT JOIN obat o ON k.id_kategori = o.id_kategori;

-- Tugas 3: Laporan Penjualan Lengkap
SELECT 
    t.id_transaksi,
    t.nama_pasien,
    o.nama_obat,
    k.nama_kategori,
    t.jumlah_beli,
    o.harga_satuan,
    (t.jumlah_beli * o.harga_satuan) AS subtotal_bayar
FROM transaksi_resep t
INNER JOIN obat o ON t.id_obat = o.id_obat
INNER JOIN kategori_obat k ON o.id_kategori = k.id_kategori;

-- Tugas 4: Deteksi Obat Tidak Laku
SELECT 
    o.id_obat,
    o.nama_obat
FROM obat o
LEFT JOIN transaksi_resep t ON o.id_obat = t.id_obat
WHERE t.id_transaksi IS NULL;