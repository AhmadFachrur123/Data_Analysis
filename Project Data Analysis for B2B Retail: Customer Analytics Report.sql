-- Menghitung Total Penjualan dan Revenue pada Quarter-1 (Jan, Feb, Mar) dan Quarter-2 (Apr,Mei,Jun)
SELECT SUM(quantity) AS total_penjualan, SUM(quantity * priceeach) AS revenue
FROM orders_1
WHERE status = 'Shipped' AND customerID IN 
(SELECT DISTINCT(customerID) FROM customer);
SELECT SUM(quantity) AS total_penjualan, SUM(quantity * priceeach) AS
revenue
FROM orders_2
WHERE status = 'Shipped' AND customerID IN
(SELECT DISTINCT(customerID) FROM customer);

-- Menghitung persentasi keseluruhan penjualan
SELECT quarter, SUM(quantity) AS total_penjualan, SUM(quantity * priceeach) AS revenue FROM
(SELECT customerID, status, quantity, priceeach, 1 AS quarter
FROM orders_1
UNION ALL
SELECT customerID, status, quantity, priceeach, 2 AS quarter
FROM orders_2) AS tabel_a
WHERE status = 'Shipped'
GROUP BY quarter;

-- Seberapa banyak customers tersebut yang sudah melakukan transaksi
SELECT quarter, COUNT(DiSTINCT(customerID)) AS total_customers
FROM(SELECT customerID, createDate, QUARTER(createDate) AS quarter 
FROM customer
WHERE createDate BETWEEN '2004-01-01' AND '2004-06-30') AS tabel_b
WHERE customerID IN
(SELECT DISTINCT(customerID) 
FROM orders_1
UNION
SELECT DISTINCT(customerID)
FROM orders_2)
GROUP BY quarter;

-- Category produk apa saja yang paling banyak di-order oleh customers di Quarter-2
SELECT * FROM (
SELECT categoryID, COUNT(DISTINCT orderNumber) AS total_order, SUM(quantity) AS total_penjualan
FROM
(SELECT productCode, orderNumber, quantity, status, LEFT(productCode,3) AS categoryID
FROM orders_2
WHERE status = 'shipped') AS tabel_c
GROUP BY categoryID) a
ORDER BY total_order DESC;

-- Seberapa banyak customers yang tetap aktif bertransaksi setelah transaksi pertamanya
SELECT COUNT(DISTINCT customerID) AS total_customers FROM orders_1;
SELECT '1' AS quarter, (COUNT(DISTINCT customerID) * 100) / 25  AS Q2 FROM orders_1
WHERE customerID IN (SELECT DISTINCT(customerID) FROM orders_2);
