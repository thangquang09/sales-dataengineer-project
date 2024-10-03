-- RDBMS: MySQL

-- vi du so luong khach hang tang truong moi nam la 10% thi chugn ta co 1 nam se tang 100000*0.1 = 10000 khach hang moi
-- vay moi ngay co 10000/365 = 27 khach hang
-- mot ngay co khoang 1000-2000 don hang moi

USE sales_db;

DELIMITER $$

CREATE PROCEDURE generate_daily_data(
    IN minCustomers INT,
    IN maxCustomers INT,
    IN minOrders INT,
    IN maxOrders INT
)
BEGIN
    DECLARE numCustomers INT;
    DECLARE numOrders INT;
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    DECLARE end_idx INT;
    DECLARE customer_id_ INT;
    DECLARE order_id_ INT;
    DECLARE today DATE;
    DECLARE min_detail_order INT;
    DECLARE max_detail_order INT;
    DECLARE numDetail INT;
    DECLARE product_id_ INT;
    DECLARE quantity_ INT;

    SET today = CURDATE();
    SET numCustomers = FLOOR(RAND() * (maxCustomers - minCustomers + 1) + minCustomers);
    SET numOrders = FLOOR(RAND() * (maxOrders - minOrders + 1) + minOrders);
    SET min_detail_order = 1;
    SET max_detail_order = 5;

    WHILE i <= numCustomers DO
        SELECT COALESCE(MAX(customer_id), 0) + 1 INTO customer_id_ FROM sales_customer;
        CALL insert_sales_customer(
            CONCAT('Customer ', CAST(customer_id_ AS CHAR)),
            CONCAT('customer', CAST(customer_id_ AS CHAR), '@example.com')
        );
        SET i = i + 1;
    END WHILE;

    -- get next index of order_id
    SELECT COALESCE(MAX(order_id), 0) + 1 INTO i FROM sales_order;
    SET end_idx = i + numOrders;
    
    WHILE i <= end_idx DO
        CALL insert_sales_order_data(1, today, today);
        SET numDetail = FLOOR(RAND() * (max_detail_order - min_detail_order + 1) + min_detail_order);
        SET j = 1;
        WHILE j <= numDetail DO
            SELECT product_id INTO product_id_ FROM production_product ORDER BY RAND() LIMIT 1;
            SET quantity_ = FLOOR(RAND() * (10 - 1 + 1) + 1); -- per product has 1 - 10 quantity
            CALL insert_sales_order_detail(i, product_id_, quantity_);
            SET j = j + 1;
        END WHILE;
        SET i = i + 1;
    END WHILE;

    CALL update_total_order();

END$$

DELIMITER ;

-- Để xóa thủ tục sau khi kiểm tra
CALL generate_daily_data(1, 2, 1, 2);
DROP PROCEDURE IF EXISTS generate_daily_data;
