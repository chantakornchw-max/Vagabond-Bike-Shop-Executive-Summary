
WITH transactions AS (
	SELECT 
		s.order_number,
		s.order_date,
		s.customer_key,
		CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		c.gender,
		DATEDIFF(year, c.birthdate, '2013-12-31') AS age,
		c.marital_status,
		c.country,
		p.product_key,
		p.product_name,
		p.category,
		p.subcategory,
		p.product_line,
		s.sales_amount,
		s.quantity,
		s.price
	FROM [gold.fact_sales] s
	LEFT JOIN [gold.dim_customers] c
	ON s.customer_key = c.customer_key
	LEFT JOIN [gold.dim_products] p
	ON s.product_key = p.product_key
)
SELECT 
	order_number,
	order_date,
	customer_key,
	customer_name,
	gender,
	age,
	CASE
		WHEN age < 20 THEN 'Under 20'
		WHEN age BETWEEN 20 AND 29 THEN '20-29'
		WHEN age BETWEEN 30 AND 39 THEN '30-39'
		WHEN age BETWEEN 40 AND 49 THEN '40-49'
		WHEN age BETWEEN 50 AND 59 THEN '50-59'
		ELSE '60 and Above'
	END AS age_group,
	marital_status,
	country,
	product_key,
	product_name,
	category,
	subcategory,
	product_line,
	sales_amount,
	quantity,
	price
FROM transactions
WHERE order_date IS NOT NULL AND YEAR(order_date) BETWEEN 2011 AND 2013
ORDER BY order_date;