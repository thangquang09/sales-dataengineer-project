COPY
(SELECT
	employee_name,
	SUM(revenue) as revenue,
	SUM(number_order) as number_order,
	SUM(profit) as profit
FROM
	view_store_city_employee_cus
GROUP BY
	employee_name,
	employee_id
ORDER BY
	employee_id)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/employee_rev_pro_num.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	city_name,
	SUM(revenue) as revenue,
	SUM(number_order) as number_order,
	SUM(profit) as profit
FROM
	view_store_city_employee_cus
GROUP BY
	city_name,
	city_id
ORDER BY
	city_id)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/city_rev_pro_num.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	store_name,
	SUM(revenue) as revenue,
	SUM(number_order) as number_order,
	SUM(profit) as profit
FROM
	view_store_city_employee_cus
GROUP BY
	store_name,
	store_id
ORDER BY
	store_id)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/store_rev_pro_num.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	customer_name,
	SUM(revenue) as revenue,
	SUM(number_order) as number_order,
	SUM(profit) as profit
FROM
	view_store_city_employee_cus
GROUP BY
	customer_name,
	customer_id
ORDER BY
	customer_id)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/customer_rev_pro_num.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	product_name,
	SUM(revenue) as revenue,
	SUM(profit) as profit
FROM
	view_quantity_cate_store_city
GROUP BY
	product_name,
	product_id
ORDER BY
	product_id)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/product_revenue_profit.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	city_name,
	SUM(quantity) as quantity
FROM
	view_quantity_cate_store_city
GROUP BY
	city_name,
	city_id
ORDER BY
	city_id)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/city_quantity_product.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	category_name,
	SUM(quantity) as quantity
FROM
	view_quantity_cate_store_city
GROUP BY
	category_name,
	category_id
ORDER BY
	category_id)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/category_quantity_product.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	store_name,
	SUM(quantity) as quantity
FROM
	view_quantity_cate_store_city
GROUP BY
	store_name,
	store_id
ORDER BY
	store_id)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/store_quantity_product.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	month_name,
	year,
	SUM(revenue_online) AS revenue_online,
	SUM(revenue_offline) AS revenue_offline,
	SUM(number_order_online) AS number_order_online,
	SUM(number_order_offline) AS number_order_offline,
	SUM(number_order_online + number_order_offline) as number_order,
	SUM(revenue_online) / SUM(revenue) as ratio_revenue_on,
	SUM(revenue_offline) / SUM(revenue) as ratio_revenue_off,
	SUM(number_order_online) / SUM(number_order_online + number_order_offline) as ratio_number_order_on,
	SUM(number_order_offline) / SUM(number_order_online + number_order_offline) as ratio_number_order_off
FROM
	view_online_offline_summary
GROUP BY
	month_id, year_id, month_name, year
ORDER BY
	year)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/ratio_on_off.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	link_name,
	SUM(number_order_online) as number_order,
	SUM(revenue_online) as revenue
FROM
	view_online_offline_summary
WHERE
	link_name != 'offline'
GROUP BY
	source_online_id, link_name)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/source_rev_numberoder.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	product_name,
	SUM(quantity) as quantity_sold
FROM
	view_quantity_cate_store_city
GROUP BY
	product_id, product_name
ORDER BY
	SUM(quantity) DESC
LIMIT 10)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/10_best_selling_prod.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	product_name,
	SUM(quantity) as quantity_sold
FROM
	view_quantity_cate_store_city
GROUP BY
	product_id, product_name
ORDER BY
	SUM(quantity)
LIMIT 10)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/10_worst_selling_prod.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	employee_name,
	SUM(revenue) as revenue
FROM
	view_store_city_employee_cus
GROUP BY
	employee_id, employee_name
ORDER BY
	SUM(revenue) DESC
LIMIT 10)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/10_best_selling_emp.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	employee_name,
	SUM(revenue) as revenue
FROM
	view_store_city_employee_cus
GROUP BY
	employee_id, employee_name
ORDER BY
	SUM(revenue)
LIMIT 10)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/10_worst_selling_emp.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	store_name,
	SUM(revenue) as revenue
FROM
	view_store_city_employee_cus
GROUP BY
	store_id, store_name
ORDER BY
	SUM(revenue) DESC
LIMIT 10)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/10_best_selling_store.csv' DELIMITER ',' CSV HEADER;

COPY
(SELECT
	store_name,
	SUM(revenue) as revenue
FROM
	view_store_city_employee_cus
GROUP BY
	store_id, store_name
ORDER BY
	SUM(revenue)
LIMIT 10)
TO '/home/thangquang/Documents/CODE/sales-dataengineer-project/csv_folder/10_worst_selling_store.csv' DELIMITER ',' CSV HEADER;