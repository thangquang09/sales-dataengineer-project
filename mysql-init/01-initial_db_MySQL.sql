-- RDBMS: MySQL
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
    updatedDate DATE,
    checkStatus INT DEFAULT 0
);

CREATE TABLE production_brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    checkStatus INT DEFAULT 0
);

CREATE TABLE production_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    createdDATE DATE NOT NULL,
    updatedDATE DATE,
    checkStatus INT DEFAULT 0
);

-- for sales schema
CREATE TABLE sales_store (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city_id INT NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    checkStatus INT DEFAULT 0
);

CREATE TABLE sales_city (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    checkStatus INT DEFAULT 0
);

CREATE TABLE sales_employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    identityNumber VARCHAR(20),
    store_id INT,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    address VARCHAR(255),
    checkStatus INT DEFAULT 0
);

CREATE TABLE sales_customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    createdDate DATE NOT NULL,
    updatedDate DATE,
    checkStatus INT DEFAULT 0
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
    updatedDate DATE,
    checkStatus INT DEFAULT 0
);

CREATE TABLE sales_order_detail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    price DECIMAL(15, 2) DEFAULT 0,
    total DECIMAL(15, 2) DEFAULT 0,
    order_id INT,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    checkStatus INT DEFAULT 0
);

CREATE TABLE sales_source_online (
    source_online_id INT PRIMARY KEY AUTO_INCREMENT,
    link_name VARCHAR(255) NOT NULL,
    createdDATE DATE NOT NULL,
    updatedDATE DATE,
    checkStatus INT DEFAULT 0
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


