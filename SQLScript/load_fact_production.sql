SELECT
	p.product_id, o.orderdate, o.store_id, 
	SUM(od.quantity) as quantity,
	SUM(p.price * od.quantity) as revenue,
	SUM(p.price * od.quantity - p.standardprice) as profit
FROM production.product p 
	JOIN sales.order_detail od ON p.product_id = od.product_id
	JOIN sales.order o ON od.order_id = o.order_id
WHERE
	o.isProcessed = false
GROUP BY
	p.product_id, o.orderdate, o.store_id;
