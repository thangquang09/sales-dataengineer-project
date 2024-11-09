DELIMITER $$

-- Stored Procedure to insert into production_product
CREATE PROCEDURE InsertProductionProduct(
    IN p_name VARCHAR(255),
    IN p_description VARCHAR(255),
    IN p_size FLOAT,
    IN p_color VARCHAR(50),
    IN p_brand_id INT,
    IN p_category_id INT,
    IN p_standardPrice DECIMAL(15, 2),
    IN p_price DECIMAL(15, 2),
    IN p_createdDate DATE
)
BEGIN
    INSERT INTO production_product (name, description, size, color, brand_id, category_id, standardPrice, price, createdDate)
    VALUES (p_name, p_description, p_size, p_color, p_brand_id, p_category_id, p_standardPrice, p_price, p_createdDate);
END $$

-- Stored Procedure to insert into production_brand
CREATE PROCEDURE InsertProductionBrand(
    IN p_name VARCHAR(255),
    IN p_createdDate DATE
)
BEGIN
    INSERT INTO production_brand (name, createdDate)
    VALUES (p_name, p_createdDate);
END $$

-- Stored Procedure to insert into production_category
CREATE PROCEDURE InsertProductionCategory(
    IN p_name VARCHAR(255),
    IN p_createdDate DATE
)
BEGIN
    INSERT INTO production_category (name, createdDate)
    VALUES (p_name, p_createdDate);
END $$

-- Stored Procedure to insert into sales_store
CREATE PROCEDURE InsertSalesStore(
    IN p_name VARCHAR(255),
    IN p_city_id INT,
    IN p_createdDate DATE
)
BEGIN
    INSERT INTO sales_store (name, city_id, createdDate)
    VALUES (p_name, p_city_id, p_createdDate);
END $$

-- Stored Procedure to insert into sales_city
CREATE PROCEDURE InsertSalesCity(
    IN p_name VARCHAR(255),
    IN p_createdDate DATE
)
BEGIN
    INSERT INTO sales_city (name, createdDate)
    VALUES (p_name, p_createdDate);
END $$

-- Stored Procedure to insert into sales_employee
CREATE PROCEDURE InsertSalesEmployee(
    IN p_name VARCHAR(255),
    IN p_dob DATE,
    IN p_identityNumber VARCHAR(20),
    IN p_store_id INT,
    IN p_createdDate DATE,
    IN p_address VARCHAR(255)
)
BEGIN
    INSERT INTO sales_employee (name, dob, identityNumber, store_id, createdDate, address)
    VALUES (p_name, p_dob, p_identityNumber, p_store_id, p_createdDate, p_address);
END $$

-- Stored Procedure to insert into sales_customer
CREATE PROCEDURE InsertSalesCustomer(
    IN p_name VARCHAR(255),
    IN p_email VARCHAR(50),
    IN p_phone VARCHAR(20),
    IN p_createdDate DATE
)
BEGIN
    INSERT INTO sales_customer (name, email, phone, createdDate)
    VALUES (p_name, p_email, p_phone, p_createdDate);
END $$

-- Stored Procedure to insert into sales_order
CREATE PROCEDURE InsertSalesOrder(
    IN p_orderDate DATE,
    IN p_total DECIMAL(15, 2),
    IN p_standardCost DECIMAL(15, 2),
    IN p_status SMALLINT,
    IN p_isOnline TINYINT(1),
    IN p_source_online_id INT,
    IN p_customer_id INT,
    IN p_employee_id INT,
    IN p_store_id INT,
    IN p_createdDate DATE
)
BEGIN
    INSERT INTO sales_order (orderDate, total, standardCost, status, isOnline, source_online_id, customer_id, employee_id, store_id, createdDate)
    VALUES (p_orderDate, p_total, p_standardCost, p_status, p_isOnline, p_source_online_id, p_customer_id, p_employee_id, p_store_id, p_createdDate);
END $$

-- Stored Procedure to insert into sales_order_detail
CREATE PROCEDURE InsertSalesOrderDetail(
    IN p_product_id INT,
    IN p_quantity INT,
    IN p_price DECIMAL(15, 2),
    IN p_total DECIMAL(15, 2),
    IN p_order_id INT,
    IN p_createdDate DATE
)
BEGIN
    INSERT INTO sales_order_detail (product_id, quantity, price, total, order_id, createdDate)
    VALUES (p_product_id, p_quantity, p_price, p_total, p_order_id, p_createdDate);
END $$

-- Stored Procedure to insert into sales_source_online
CREATE PROCEDURE InsertSalesSourceOnline(
    IN p_link_name VARCHAR(255),
    IN p_createdDate DATE
)
BEGIN
    INSERT INTO sales_source_online (link_name, createdDate)
    VALUES (p_link_name, p_createdDate);
END $$

CREATE PROCEDURE update_total_order()
BEGIN
    WITH sdPrice(order_id, totalStandardPricePerProduct, totalPrice) AS
    (
        SELECT od.order_id, p.standardPrice * od.quantity AS totalStandardPricePerProduct, od.total
        FROM sales_order_detail od 
        INNER JOIN production_product p ON od.product_id = p.product_id
    ),
    AggregatedPrices AS
    (
        SELECT order_id, SUM(totalStandardPricePerProduct) AS standardCost, SUM(totalPrice) AS total
        FROM sdPrice
        GROUP BY order_id
    )
    UPDATE sales_order so
    JOIN AggregatedPrices ap ON so.order_id = ap.order_id
    SET so.standardCost = ap.standardCost, 
        so.total = ap.total
    WHERE so.standardCost <> ap.standardCost OR so.total <> ap.total;
END$$

DELIMITER ;

-- INSERT CITY FIRST FOR VISUALIZATION
CALL InsertSalesCity("Ha Noi", "2024-10-4");
CALL InsertSalesCity("Ho Chi Minh", "2024-10-4");
CALL InsertSalesCity("Hai Phong", "2024-10-4");
CALL InsertSalesCity("Can Tho", "2024-10-4");
CALL InsertSalesCity("Da Nang", "2024-10-4");
CALL InsertSalesCity("Bien Hoa", "2024-10-4");
CALL InsertSalesCity("Hai Duong", "2024-10-4");
CALL InsertSalesCity("Hue", "2024-10-4");
CALL InsertSalesCity("Thuan An", "2024-10-4");
CALL InsertSalesCity("Thu Duc", "2024-10-4");

-- INSERT LINKS
CALL InsertSalesSourceOnline("Shopee", "2024-10-4");
CALL InsertSalesSourceOnline("Tiktok", "2024-10-4");
CALL InsertSalesSourceOnline("Tiki", "2024-10-4");
CALL InsertSalesSourceOnline("Lazada", "2024-10-4");