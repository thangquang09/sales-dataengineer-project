-- Make sure you created sales_dw_staging database and use it to run this script
-- RDBMS: PostgreSQL
CREATE SCHEMA production;
CREATE SCHEMA sales;

CREATE TABLE production.product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    size FLOAT,
    color VARCHAR(50),
    brand_id INT,
    category_id INT, 
    standardPrice NUMERIC(15, 2),
    price NUMERIC(15, 2) NOT NULL,
    createdDate DATE,
    updatedDate DATE,
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

CREATE TABLE production.brand (
    brand_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

CREATE TABLE production.category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

-- for sales schema
CREATE TABLE sales.store (
    store_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city_id INT NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

CREATE TABLE sales.city (
    city_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

CREATE TABLE sales.employee (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    identityNumber VARCHAR(20),
    store_id INT,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    address VARCHAR(255),
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

CREATE TABLE sales.customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    createdDate DATE NOT NULL,
    updatedDate DATE,
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

CREATE TABLE sales.order (
    order_id SERIAL PRIMARY KEY,
    orderDate DATE NOT NULL,
    total NUMERIC(15, 2) NOT NULL DEFAULT 0,
    standardCost NUMERIC(15, 2),
    status SMALLINT,
    isOnline BOOLEAN NOT NULL,
    source_online_id INT,
    customer_id INT,
    employee_id INT,
    store_id INT,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

CREATE TABLE sales.order_detail (
    order_detail_id SERIAL PRIMARY KEY,
    product_id INT,
    quantity INT,
    price NUMERIC(15, 2) DEFAULT 0,
    total NUMERIC(15, 2) DEFAULT 0,
    order_id INT,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

CREATE TABLE sales.source_online (
    source_online_id SERIAL PRIMARY KEY,
    link_name VARCHAR(255) NOT NULL,
    createdDate DATE NOT NULL,
    updatedDate DATE,
    -- control columns
    insertDate DATE DEFAULT CURRENT_DATE,
    updateDate DATE,
    sourceSystem VARCHAR(50) DEFAULT 'MySQL',
    isProcessed BOOLEAN DEFAULT FALSE
);

-- Thêm các ràng buộc khóa ngoại

ALTER TABLE production.product ADD CONSTRAINT fk_brand FOREIGN KEY (brand_id) REFERENCES production.brand(brand_id);
ALTER TABLE production.product ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES production.category(category_id);
ALTER TABLE sales.store ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES sales.city(city_id);
ALTER TABLE sales.employee ADD CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES sales.store(store_id);
ALTER TABLE sales.order ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES sales.customer(customer_id);
ALTER TABLE sales.order ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES sales.employee(employee_id);
ALTER TABLE sales.order ADD CONSTRAINT fk_store_order FOREIGN KEY (store_id) REFERENCES sales.store(store_id);
ALTER TABLE sales.order ADD CONSTRAINT fk_source_online FOREIGN KEY (source_online_id) REFERENCES sales.source_online(source_online_id);
ALTER TABLE sales.order_detail ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES sales.order(order_id);
ALTER TABLE sales.order_detail ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES production.product(product_id);
