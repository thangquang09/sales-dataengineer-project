SELECT 
    order_id,
    orderdate,
    source_online_id,
    customer_id,
    employee_id,
    store_id,
    total as revenue,
    SUM(CASE WHEN isOnline = TRUE THEN total ELSE 0 END) AS revenue_online,
    SUM(CASE WHEN isOnline = FALSE THEN total ELSE 0 END) AS revenue_offline,
	COUNT(*) AS number_order,
	COUNT(CASE WHEN isOnline = TRUE THEN 1 ELSE 0 END) AS number_order_online,
	COUNT(CASE WHEN isOnline = FALSE THEN 1 ELSE 0 END) AS number_order_offline,
	SUM(standardCost) AS standardCost,
	SUM(total) - SUM(standardCost) AS profit
	
FROM
    sales.order
WHERE
    isProcessed = FALSE
GROUP BY
	order_id, orderdate, source_online_id, customer_id, employee_id, store_id, total