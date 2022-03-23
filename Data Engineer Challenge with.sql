-- Mengurutkan Nama Pelanggan
SELECT nama_pelanggan
FROM ms_pelanggan
ORDER BY nama_pelanggan ASC;

-- Mengurutkan Nama Pelanggan Tanpa Gelar
SELECT nama_pelanggan 
FROM ms_pelanggan
ORDER BY SUBSTRING_INDEX(nama_pelanggan, '. ', -1);

-- Nama Pelanggan yang Paling Panjang
SELECT nama_pelanggan
FROM ms_pelanggan
WHERE LENGTH(nama_pelanggan) IN
(SELECT MAX(LENGTH(nama_pelanggan))
FROM ms_pelanggan);

-- Nama Pelanggan yang Paling Panjang dengan Gelar dan yang pendek
SELECT nama_pelanggan
FROM ms_pelanggan 
WHERE LENGTH (nama_pelanggan) IN
((SELECT MAX(LENGTH(nama_pelanggan)) FROM ms_pelanggan),
(SELECT MIN(LENGTH(nama_pelanggan)) FROM ms_pelanggan))
ORDER BY LENGTH(nama_pelanggan) DESC;

-- Pelanggan Paling Tinggi Nilai Belanjanya
SELECT ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_pelanggan, 
SUM(tr_penjualan_detail.harga_satuan *tr_penjualan_detail.qty) as total_harga
FROM ms_pelanggan
INNER JOIN tr_penjualan
ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
INNER JOIN tr_penjualan_detail
ON tr_penjualan.kode_transaksi = tr_penjualan_detail.kode_transaksi
GROUP BY kode_pelanggan,
         nama_pelanggan
ORDER BY total_harga DESC LIMIT 1;

-- Pelanggan yang Belum Pernah Berbelanja
SELECT kode_pelanggan, nama_pelanggan, alamat
FROM ms_pelanggan
WHERE kode_pelanggan NOT IN (SELECT kode_pelanggan FROM tr_penjualan);

-- Transaksi Belanja dengan Daftar Belanja lebih dari 1
SELECT tr_penjualan.kode_transaksi, 
       tr_penjualan.kode_pelanggan,
	   ms_pelanggan.nama_pelanggan,
	   tr_penjualan.tanggal_transaksi,
	   COUNT(tr_penjualan_detail.kode_transaksi) AS jumlah_detail
FROM tr_penjualan
INNER JOIN ms_pelanggan
ON tr_penjualan.kode_pelanggan = ms_pelanggan.kode_pelanggan
INNER JOIN tr_penjualan_detail
ON tr_penjualan.kode_transaksi = tr_penjualan_detail.kode_transaksi
GROUP BY tr_penjualan.kode_transaksi,
         tr_penjualan.kode_pelanggan,
		 ms_pelanggan.nama_pelanggan,
		 tr_penjualan.tanggal_transaksi
HAVING jumlah_detail > 1;
                     
