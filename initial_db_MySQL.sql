-- RDBMS: MySQL

DROP DATABASE IF EXISTS sales_db;
-- create database if not exists
CREATE DATABASE sales_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE sales_db;

-- create tables

-- for productions schema
CREATE TABLE production_product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    size FLOAT,
    color VARCHAR(50),
    brand_id INT,
    category_id INT, 
    standardPrice DECIMAL(15, 2),
    price DECIMAL(15, 2) NOT NULL,
    createdDate DATE,
    updatedDate DATE
);

CREATE TABLE production_brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE
);

CREATE TABLE production_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    createdDATE DATE NOT NULL,
    updatedDATE DATE
);

-- for sales schema
CREATE TABLE sales_store (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city_id INT NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE
);

CREATE TABLE sales_city (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE
);

CREATE TABLE sales_employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    identityNumber VARCHAR(20),
    store_id INT,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    address VARCHAR(255)
);

CREATE TABLE sales_customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    createdDate DATE NOT NULL,
    updatedDate DATE
);

CREATE TABLE sales_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    orderDate DATE NOT NULL,
    total DECIMAL(15, 2) NOT NULL DEFAULT 0,
    standardCost DECIMAL(15, 2),
    status SMALLINT,
    isOnline TINYINT(1) NOT NULL,
    source_online_id INT,
    customer_id INT,
    employee_id INT,
    store_id INT,
    createdDate DATE NOT NULL,
    updatedDate DATE
);

CREATE TABLE sales_order_detail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    price DECIMAL(15, 2) DEFAULT 0,
    total DECIMAL(15, 2) DEFAULT 0,
    order_id INT,
    createdDate DATE NOT NULL,
    updatedDate DATE
);

CREATE TABLE sales_source_online (
    source_online_id INT PRIMARY KEY AUTO_INCREMENT,
    link_name VARCHAR(255) NOT NULL,
    createdDATE DATE NOT NULL,
    updatedDATE DATE
);

-- add foreign key

ALTER TABLE production_product ADD CONSTRAINT fk_brand FOREIGN KEY (brand_id) REFERENCES production_brand(brand_id);
ALTER TABLE production_product ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES production_category(category_id);
ALTER TABLE sales_store ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES sales_city(city_id);
ALTER TABLE sales_employee ADD CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES sales_store(store_id);
ALTER TABLE sales_order ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES sales_customer(customer_id);
ALTER TABLE sales_order ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES sales_employee(employee_id);
ALTER TABLE sales_order ADD CONSTRAINT fk_store_order FOREIGN KEY (store_id) REFERENCES sales_store(store_id);
ALTER TABLE sales_order ADD CONSTRAINT fk_source_online FOREIGN KEY (source_online_id) REFERENCES sales_source_online(source_online_id);
ALTER TABLE sales_order_detail ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES sales_order(order_id);
ALTER TABLE sales_order_detail ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES production_product(product_id);

-- INSERT CITY FIRST FOR VISUALIZATION

INSERT INTO sales_city(name, createdDate)
VALUES
    ("Hà Nội", "2024-10-4"),
    ("Hồ Chí Minh", "2024-10-4"),
    ("Hải Phòng", "2024-10-4"),
    ("Cần Thơ", "2024-10-4"),
    ("Đà Nẵng", "2024-10-4"),
    ("Biên Hòa", "2024-10-4"),
    ("Hải Dương", "2024-10-4"),
    ("Huế", "2024-10-4"),
    ("Thuận An", "2024-10-4"),
    ("Thủ Đức", "2024-10-4");

INSERT INTO sales_source_online(link_name, createdDate)
VALUES
    ("Shopee", "2024-10-4"),
    ("Tiktok", "2024-10-4"),
    ("Tiki", "2024-10-4"),
    ("Lazada", "2024-10-4");

DELIMITER $$

-- CREATE PROCEDURE for insert

---- insert sales_city table ----
CREATE PROCEDURE insert_sales_city(IN name VARCHAR(255))
BEGIN
    DECLARE createdDate DATE;

    SET createdDate = CURDATE();


    INSERT INTO sales_city (name, createdDate)
    VALUES (name, createdDate);
END;

CREATE PROCEDURE insert_sales_city_data(IN numCities INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= numCities DO
        CALL insert_sales_city(CONCAT('City ', CAST(i AS CHAR)));
        SET i = i + 1;
    END WHILE;
END;

---- insert sales_store table ----

CREATE PROCEDURE insert_sales_store(IN name VARCHAR(255), IN city_id INT)
BEGIN
    DECLARE createdDate DATE;

    SET createdDate = CURDATE();

    INSERT INTO sales_store (name, city_id, createdDate)
    VALUES (name, city_id, createdDate);
END;


CREATE PROCEDURE insert_sales_store_data(IN numStores INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE random_city_id INT;

    WHILE i <= numStores DO
        SELECT city_id FROM sales_city ORDER BY RAND() LIMIT 1 INTO random_city_id;
        CALL insert_sales_store(CONCAT('Store ', CAST(i AS CHAR)), random_city_id);
        SET i = i + 1; 
    END WHILE;
END;

---- insert sales_employee table ----

CREATE PROCEDURE insert_sales_employee(IN name VARCHAR(255), IN store_id INT)
BEGIN
    DECLARE createdDate DATE;

    SET createdDate = CURDATE();

    INSERT INTO sales_employee (name, store_id, createdDate)
    VALUES (name, store_id, createdDate);
END;

CREATE PROCEDURE insert_sales_employee_data()
BEGIN
    DECLARE store_id_ INT;
    DECLARE numEmployee INT;
    DECLARE done INT DEFAULT 0;
    DECLARE minNumEmployee INT DEFAULT 2;
    DECLARE maxNumEmployee INT DEFAULT 5;
    DECLARE i INT;
    DECLARE employee_count INT DEFAULT 0;
    
    DECLARE cur_store CURSOR FOR SELECT store_id FROM sales_store;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur_store;

    store_loop: LOOP
        FETCH cur_store INTO store_id_;
        IF done THEN
            LEAVE store_loop;
        END IF;

        SET numEmployee = FLOOR(RAND() * (maxNumEmployee - minNumEmployee + 1)) + minNumEmployee;
        SET i = 1;

        WHILE i <= numEmployee DO
            SET employee_count = employee_count + 1;
            CALL insert_sales_employee(CONCAT('Employee ', CAST(employee_count AS CHAR)), store_id_);
            SET i = i + 1;
        END WHILE;
    END LOOP store_loop;

    CLOSE cur_store;
END;

---- insert sales_customer table ----
CREATE PROCEDURE insert_sales_customer(IN name VARCHAR(255), IN email VARCHAR(50))
BEGIN
    DECLARE createdDate DATE;

    SET createdDate = CURDATE();

    INSERT INTO sales_customer (name, email, createdDate)
    VALUES (name, email, createdDate);
END;

CREATE PROCEDURE insert_sales_customer_data(IN numCustomers INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= numCustomers DO
        CALL insert_sales_customer(CONCAT('Customer ', CAST(i AS CHAR)), CONCAT('customer', CAST(i AS CHAR), '@example.com'));
        SET i = i + 1;
    END WHILE;
END;

---- insert sales_source_online table ----
CREATE PROCEDURE insert_sales_source_online(IN name VARCHAR(255))
BEGIN
    DECLARE createdDate DATE;

    SET createdDate = CURDATE();

    INSERT INTO sales_source_online (link_name, createdDate)
    VALUES (name, createdDate);
END;


CREATE PROCEDURE insert_sales_source_online_data(IN numSources INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= numSources DO
        CALL insert_sales_source_online(CONCAT('www.example', CAST(i AS CHAR), '.com'));
        SET i = i + 1;
    END WHILE;
END;

---- insert production_brand table ----
CREATE PROCEDURE insert_production_brand(IN name VARCHAR(255))
BEGIN
    DECLARE createdDate DATE;

    SET createdDate = CURDATE();

    INSERT INTO production_brand (name, createdDate)
    VALUES (name, createdDate);
END;


CREATE PROCEDURE insert_production_brand_data(IN numBrands INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= numBrands DO
        CALL insert_production_brand(CONCAT('Brand ', CAST(i AS CHAR)));
        SET i = i + 1;
    END WHILE;
END;

---- insert production_category table ----
CREATE PROCEDURE insert_production_category(IN name VARCHAR(255))
BEGIN
    DECLARE createdDate DATE;

    SET createdDate = CURDATE();

    INSERT INTO production_category (name, createdDate)
    VALUES (name, createdDate);
END;

CREATE PROCEDURE insert_production_category_data(IN numCategories INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= numCategories DO
        CALL insert_production_category(CONCAT('Category ', CAST(i AS CHAR)));
        SET i = i + 1;
    END WHILE;
END;


---- insert production_product table ----
CREATE PROCEDURE insert_production_product(IN name VARCHAR(255), IN brand_id INT, IN category_id INT, IN price DECIMAL(15, 2))
BEGIN
    DECLARE createdDate DATE;
    DECLARE standardPrice DECIMAL(15, 2);
    DECLARE max_percent DECIMAL(5, 2) DEFAULT 90.00;
    DECLARE min_percent DECIMAL(5, 2) DEFAULT 60.00;

    SET createdDate = CURDATE();
    SET standardPrice = price * (RAND() * (max_percent - min_percent) + min_percent) / 100;

    INSERT INTO production_product (name, brand_id, category_id, standardPrice, price, createdDate)
    VALUES (name, brand_id, category_id, standardPrice, price, createdDate);
END;


CREATE PROCEDURE insert_production_product_data(IN numProducts INT, IN minPrice DECIMAL(15, 2), IN maxPrice DECIMAL(15, 2))
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE brand_id_ INT;
    DECLARE category_id_ INT;

    WHILE i <= numProducts DO
        -- Chọn một brand_id ngẫu nhiên có thực
        SELECT brand_id INTO brand_id_ FROM production_brand ORDER BY RAND() LIMIT 1;
        
        -- Chọn một category_id ngẫu nhiên có thực
        SELECT category_id INTO category_id_ FROM production_category ORDER BY RAND() LIMIT 1;
        
        CALL insert_production_product(
            CONCAT('Product ', CAST(i AS CHAR)), 
            brand_id_, 
            category_id_, 
            ROUND(RAND() * (maxPrice - minPrice) + minPrice, 2)
        );
        SET i = i + 1;
    END WHILE;
END;

---- insert sales_order table ----

CREATE PROCEDURE insert_sales_order(IN orderDate DATE, IN isOnline TINYINT(1), IN customer_id INT, IN employee_id INT, IN store_id INT, IN source_online_id INT)
BEGIN
    DECLARE createdDate DATE;

    SET createdDate = CURDATE();

    INSERT INTO sales_order (orderDate, isOnline, customer_id, employee_id, store_id, source_online_id, createdDate)
    VALUES (orderDate, isOnline, customer_id, employee_id, store_id, source_online_id, createdDate);
END;


CREATE PROCEDURE insert_sales_order_data(
    IN numOrders INT,
    IN fromDate DATE,
    IN toDate DATE
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE dayBetween INT;
    DECLARE dayRand INT;
    DECLARE orderDate DATE;
    DECLARE isOnline TINYINT(1);
    DECLARE source_online_id_ INT;
    DECLARE customer_id_ INT;
    DECLARE employee_id_ INT;
    DECLARE store_id_ INT;

    IF toDate IS NULL THEN
        SET toDate = CURDATE();
    END IF;

    WHILE i <= numOrders DO
        IF fromDate = toDate THEN
            SET orderDate = fromDate;
        ELSE
            SET dayBetween = DATEDIFF(toDate, fromDate);
            SET dayRand = FLOOR(RAND() * dayBetween);
            SET orderDate = DATE_ADD(fromDate, INTERVAL dayRand DAY);
        END IF;

        SET isOnline = ROUND(RAND(), 0);
        SELECT customer_id INTO customer_id_ FROM sales_customer ORDER BY RAND() LIMIT 1;

        SELECT store_id INTO store_id_ FROM sales_store ORDER BY RAND() LIMIT 1;

        SELECT employee_id INTO employee_id_ FROM sales_employee WHERE store_id = store_id_ ORDER BY RAND() LIMIT 1;

        IF isOnline = 1 THEN
            SELECT source_online_id INTO source_online_id_ FROM sales_source_online ORDER BY RAND() LIMIT 1;
        ELSE
            SET source_online_id_ = NULL;
        END IF;

        CALL insert_sales_order(orderDate, isOnline, customer_id_, employee_id_, store_id_, source_online_id_);
        
        SET i = i + 1;
    END WHILE;
END;

---- insert sales_order_detail table ----
CREATE PROCEDURE insert_sales_order_detail(IN order_id_ INT, IN product_id_ INT, IN quantity_ INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE createdDate_ DATE;
    DECLARE product_price DECIMAL(15, 2);
    DECLARE total_price DECIMAL(15, 2);

    SELECT price INTO product_price FROM production_product WHERE product_id = product_id_;
    SET total_price = product_price * quantity_;
    SET createdDate_ = CURDATE();

    INSERT INTO sales_order_detail (product_id, quantity, price, total, order_id, createdDate)
    VALUES (product_id_, quantity_, product_price, total_price, order_id_, createdDate_);
END;

CREATE PROCEDURE insert_sales_order_detail_data(
    IN minDetailPerOrder INT,
    IN maxDetailPerOrder INT
)
BEGIN
    DECLARE order_id_ INT;
    DECLARE done INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    DECLARE numDetail INT;
    DECLARE product_id_ INT;
    DECLARE quantity_ INT;

    DECLARE cur_order CURSOR FOR 
        SELECT order_id 
        FROM sales_order 
        WHERE total = 0;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur_order;

    order_loop: LOOP
        FETCH cur_order INTO order_id_;
        IF done THEN
            LEAVE order_loop;
        END IF;

        SET numDetail = FLOOR(RAND() * (maxDetailPerOrder - minDetailPerOrder + 1)) + minDetailPerOrder;
        SET i = 1;
        WHILE i <= numDetail DO 
            SET i = i + 1;
            SELECT product_id INTO product_id_ FROM production_product ORDER BY RAND() LIMIT 1;
            SET quantity_ = FLOOR(RAND() * (10 - 1 + 1) + 1); -- per product has 1 - 10 quantity
            CALL insert_sales_order_detail(order_id_, product_id_, quantity_);
        END WHILE;


    END LOOP order_loop;

    CLOSE cur_order;
END;


-- MAIN FUCNTION TO INITIAL DATABASE ----
CREATE PROCEDURE insert_base_data()
BEGIN
    DECLARE numStore INT DEFAULT 55;
    DECLARE numCustomer INT DEFAULT 100000;
    DECLARE numBrand INT DEFAULT 10;
    DECLARE numCategory INT DEFAULT 10;
    DECLARE numProduct INT DEFAULT 1200;
    DECLARE minPrice DECIMAL(15, 2) DEFAULT 10;
    DECLARE maxPrice DECIMAL(15, 2) DEFAULT 10000;
    DECLARE fromDate DATE DEFAULT '2021-01-01';
    DECLARE toDate DATE DEFAULT '2024-10-03';
    DECLARE numOrders INT DEFAULT 400000;
    DECLARE minDetail INT DEFAULT 1;
    DECLARE maxDetail INT DEFAULT 5;



    CALL insert_sales_store_data(numStore);
    CALL insert_sales_employee_data();
    CALL insert_sales_customer_data(numCustomer);
    CALL insert_production_brand_data(numBrand);
    CALL insert_production_category_data(numCategory);
    CALL insert_production_product_data(numProduct, minPrice, maxPrice);
    CALL insert_sales_order_data(numOrders, fromDate, toDate);
    CALL insert_sales_order_detail_data(minDetail, maxDetail);
END;

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
    WHERE so.standardCost <> ap.standardCost
       OR so.total <> ap.total;
END;


-- vi du so luong khach hang tang truong moi nam la 10% thi chugn ta co 1 nam se tang 100000*0.1 = 10000 khach hang moi
-- vay moi ngay co 10000/365 = 27 khach hang
-- mot ngay co khoang 500-1000 don hang moi
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

END;

$$
DELIMITER ;


CALL insert_base_data();
CALL update_total_order();
