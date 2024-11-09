SELECT p.name as product_name, b.name as brand, cate.name as category, revenue, quantity, profit, month, y.name as year
FROM
	fact_production fp
JOIN
	dim_date dd ON dd.date_id = fp.date_id
JOIN
	dim_month m ON m.month_id = dd.month_id
JOIN
	dim_year y ON y.year_id = dd.year_id
JOIN
	dim_product p ON p.product_id = fp.product_id
JOIN
	dim_brand b ON b.brand_id = p.brand_id
JOIN
	dim_category cate ON cate.category_id = p.category_id;