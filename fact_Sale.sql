
SELECT e.name as employee_name, st.name as store_name, city.name as city_name, src.link_name, m.month, y.name as year, revenue, revenue_online, revenue_offline, profit, number_order, number_order_online, number_order_offline
FROM fact_sales_order f
JOIN
	dim_store st ON st.store_id = f.store_id
JOIN
	dim_city city ON st.city_id = city.city_id
JOIN
	dim_employee e ON e.employee_id = f.employee_id
JOIN
	dim_date dd ON dd.date_id = f.date_id
JOIN
	dim_month m ON m.month_id = dd.month_id
JOIN
	dim_year y ON y.year_id = dd.year_id
JOIN
	dim_source_online src ON src.source_online_id = f.source_online_id;
