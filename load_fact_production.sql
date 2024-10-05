SELECT
	p.product_id, o.orderdate, o.store_id, 
	SUM(od.quantity) as quantity,
	SUM(p.price * od.quantity) as revenue
	
FROM production.product p 
	INNER JOIN sales.order_detail od ON p.product_id = od.product_id
	INNER JOIN sales.order o ON od.order_id = o.order_id
WHERE
	o.isProcessed = false
GROUP BY
	p.product_id, o.orderdate, o.store_id;
