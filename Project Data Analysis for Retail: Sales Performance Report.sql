-- Overall Performance by Year
SELECT year(order_date) AS years, SUM(sales) AS sales, COUNT(DISTINCT(order_id)) AS number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years;

-- Overall Performance by Product Sub Category
ELECT year(order_date) AS years, product_sub_category, SUM(sales) AS sales
FROM dqlab_sales_store
WHERE order_status = 'Order Finished' AND 
year(order_date) >= 2011 and year(order_date) <= 2012
GROUP BY product_sub_category, years
ORDER BY year(order_date) , SUM(sales) DESC;

-- Promotion Effectiveness and Efficiency by Years
SELECT year(order_date) AS years, SUM(sales) AS sales,
SUM(discount_value) AS promotion_value, 
ROUND(SUM(discount_value)/ SUM(sales) * 100,2) AS burn_rate_percentage
FROM dqlab_sales_store
WhERE order_status = 'Order Finished'
GROUP BY years;
 
 -- Promotion Effectiveness and Efficiency by Product Sub Category
 SELECT year(order_date) AS years, product_sub_category, product_category,
SUM(sales) AS sales, SUM(discount_value) AS promotion_value, 
ROUND(SUM(discount_value) / SUM(sales) * 100,2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = 'Order Finished' AND year(order_date) = 2012
GROUP BY years, product_sub_category, product_category 
ORDER BY sales DESC, promotion_value DESC;

-- Customers Transactions per Year
SELECT year(order_date) AS years, COUNT(DISTINCT(customer))
AS number_of_customer
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years;

