-- Fungsi Skalar Matematika - ABS()
SELECT StudentID, FirstName, LastName, Semester1, Semester2, ABS(MarkGrowth) AS MarkGrowth
FROM students;

-- Fungsi Skalar Matematika - CEILING()
SELECT StudentID, Firstname, LastName, CEILING(Semester1) AS Semester1, CEILING(Semester2) AS Semester2, MarkGrowth
FROM students;

-- Fungsi Skalar Matematika - FLOOR()
SELECT StudentID, FirstName, LastName, FLOOR(Semester1) AS Semester1, FLOOR(Semester2) AS Semester2, MarkGrowth
FROM students;

-- Fungsi Skalar Matematika - ROUND()
SELECT StudentID, FirstName, LastName, ROUND(Semester1,1) AS Semester1, ROUND(Semester2,0) AS Semester2, MarkGrowth
FROM students;

-- Fungsi Skalar Matematika - SQRT()
SELECT StudentID, FirstName, LastName, SQRT(Semester1) AS Semester1, Semester2, MarkGrowth
FROM students;

-- Fungsi Text - CONCAT()
SELECT StudentID, CONCAT(FirstName, LastName) AS Name, Semester1, Semester2, MarkGrowth
FROM students;

-- Fungsi Text - SUBSTRING_INDEX()
SELECT StudentID, SUBSTRING_INDEX(Email,'@',1) AS Name 
FROM students;

-- Fungsi Text - SUBSTR()
SELECT StudentID, SUBSTR(FirstName,2,3) AS Initial 
FROM students;

-- Fungsi Text - LENGTH()
SELECT StudentID, FirstName, LENGTH(Firstname) AS Total_Char
FROM  students;

-- Fungsi Text - REPLACE()
SELECT StudentID, Email, REPLACE(Email,'yahoo','gmail') AS New_Email
FROM  students;

-- Fungsi Aggregate - SUM()
SELECT SUM(Semester1) AS Total_1, SUM(Semester2) AS Total_2
FROM  students;

-- Fungsi Aggregate - COUNT()
SELECT COUNT(FirstName) AS Total_Student
FROM students;

-- Fungsi Aggregate - AVG()
SELECT AVG(Semester1) AS AVG_1, AVG(Semester2) AS AVG_2
FROM students;

-- Group by Single Column
SELECT province,
COUNT(DISTINCT order_id) AS total_order,
SUM(item_price) AS total_price
FROM sales_retail_2019
GROUP BY province;

-- Group by Multiple Column
SELECT province,
brand,
COUNT(DISTINCT order_id) AS total_order,
SUM(item_price) AS total_price
FROMsales_retail_2019
GROUP BY province, brand;

-- Fungsi Aggregate dengan Grouping
SELECT province,
COUNT(DISTINCT order_id) AS total_unique_order,
SUM(item_price) AS revenue FROM sales_retail_2019
GROUP BY province;
