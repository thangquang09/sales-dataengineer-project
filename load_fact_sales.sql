SELECT 
    store_id, employee_id, customer_id, orderdate, source_online_id,
    SUM(total) AS revenue,
	SUM(standardcost) AS standardcost,
    SUM(total - standardCost) AS profit,
    COUNT(order_id) AS number_order,
	SUM(CASE WHEN isOnline = true THEN total ELSE 0 END) AS revenue_online,
	SUM(CASE WHEN isOnline = false THEN total ELSE 0 END) AS revenue_offline,
    SUM(CASE WHEN isOnline = true THEN 1 ELSE 0 END) AS number_order_online,
    SUM(CASE WHEN isOnline = false THEN 0 ELSE 1 END) AS number_order_offline
FROM 
    sales.order
WHERE
    isProcessed = false
GROUP BY store_id, employee_id, customer_id, orderdate, source_online_id;