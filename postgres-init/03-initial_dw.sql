-- Make sure you created sales_dw database and use it to run this script
-- RDBMS: PostgreSQL

-- create Dim of sales first

\c sales_dw;

CREATE TABLE Dim_City (
    city_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Store (
    store_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    city_id INT,
    CONSTRAINT store_fk_city FOREIGN KEY (city_id) REFERENCES Dim_City(city_id)
);

CREATE TABLE Dim_Employee (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    identityNumber VARCHAR(20),
    store_id INT,
    CONSTRAINT employee_fk_store FOREIGN KEY (store_id) REFERENCES Dim_Store(store_id)
);

CREATE TABLE Dim_Customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Source_Online (
    source_online_id SERIAL PRIMARY KEY,
    link_name VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Year (
    year_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Dim_Quarter (
    quarter_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE Dim_Month (
    month_id SERIAL PRIMARY KEY,
    year_id INT,
    quarter_id INT,
    month INT,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT month_fk_year FOREIGN KEY (year_id) REFERENCES Dim_Year(year_id),
    CONSTRAINT month_fk_quater FOREIGN KEY (quarter_id) REFERENCES Dim_Quarter(quarter_id)
);

CREATE TABLE Dim_Date (
    date_id SERIAL PRIMARY KEY,
    month_id INT,
    year_id INT,
    date_name DATE,
    CONSTRAINT date_fk_month FOREIGN KEY (month_id) REFERENCES Dim_Month(month_id),
    CONSTRAINT date_fk_year FOREIGN KEY (year_id) REFERENCES Dim_Year(year_id)
);


-- create Fact sales

CREATE TABLE Fact_Sales_Order (
    id SERIAL PRIMARY KEY,
    date_id INT NOT NULL,
    source_online_id INT,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    store_id INT NOT NULL,
    revenue DECIMAL(15, 2), -- for both of online orders and offline orders
    revenue_online DECIMAL(15, 2),
    revenue_offline DECIMAL(15, 2),
    standard_cost DECIMAL(15, 2),
    profit DECIMAL(15, 2),
    number_order INT,
    number_order_online INT,
    number_order_offline INT,
    CONSTRAINT sales_fk_date FOREIGN KEY (date_id) REFERENCES Dim_Date(date_id),
    CONSTRAINT sales_fk_source FOREIGN KEY (source_online_id) REFERENCES Dim_Source_Online(source_online_id),
    CONSTRAINT sales_fk_customer FOREIGN KEY (customer_id) REFERENCES Dim_Customer(customer_id),
    CONSTRAINT sales_fk_employee FOREIGN KEY (employee_id) REFERENCES Dim_Employee(employee_id),
    CONSTRAINT sales_fk_store FOREIGN KEY (store_id) REFERENCES Dim_Store(store_id)
);

-- Create Dim for Production

CREATE TABLE Dim_Category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Brand (
    brand_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    size FLOAT,
    color VARCHAR(50),
    brand_id INT,
    category_id INT,
    standardPrice DECIMAL(15,2),
    price DECIMAL(15,2),
    CONSTRAINT product_fk_category FOREIGN KEY (category_id) REFERENCES Dim_Category(category_id),
    CONSTRAINT product_fk_brand FOREIGN KEY (brand_id) REFERENCES Dim_Brand(brand_id)
);

-- create Fact Production

CREATE TABLE Fact_Production (
    id SERIAL PRIMARY KEY,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    revenue DECIMAL(15, 2),
    profit DECIMAL(15, 2),
    CONSTRAINT production_fk_date FOREIGN KEY (date_id) REFERENCES Dim_Date(date_id),
    CONSTRAINT production_fk_store FOREIGN KEY (store_id) REFERENCES Dim_Store(store_id),
    CONSTRAINT production_fk_product FOREIGN KEY (product_id) REFERENCES Dim_Product(product_id)
);



INSERT INTO Dim_Source_Online(source_online_id, link_name) VALUES (1000, 'offline');

-- CREATE VIEW 

-- Revenue, profit, number of orders, average value based on criteria: product, store, employee, city, customer
-- Quantity of products sold by category, store, city
-- Ratio of online/offline revenue and order numbers over time
-- For online orders, the structure of order numbers and revenue by source ("Tiki", "Shopee", etc.)
-- Total revenue by store, employee, product
-- Top 10 best-selling and worst-selling products
-- Top 10 employees and stores with the highest and lowest revenue.

CREATE MATERIALIZED VIEW view_fact_production AS
SELECT p.name as product_name, b.name as brand, cate.name as category, revenue, quantity, profit, month, y.name as year
FROM
	fact_production fp
JOIN
	dim_date dd ON dd.date_id = fp.date_id
JOIN
	dim_month m ON m.month_id = dd.month_id
JOIN
	dim_year y ON y.year_id = dd.year_id
JOIN
	dim_product p ON p.product_id = fp.product_id
JOIN
	dim_brand b ON b.brand_id = p.brand_id
JOIN
	dim_category cate ON cate.category_id = p.category_id;

CREATE MATERIALIZED VIEW view_fact_sale_orders AS

SELECT e.name as employee_name, st.name as store_name, city.name as city_name, src.link_name, m.month, y.name as year, revenue, revenue_online, revenue_offline, profit, number_order, number_order_online, number_order_offline
FROM fact_sales_order f
JOIN
	dim_store st ON st.store_id = f.store_id
JOIN
	dim_city city ON st.city_id = city.city_id
JOIN
	dim_employee e ON e.employee_id = f.employee_id
JOIN
	dim_date dd ON dd.date_id = f.date_id
JOIN
	dim_month m ON m.month_id = dd.month_id
JOIN
	dim_year y ON y.year_id = dd.year_id
JOIN
	dim_source_online src ON src.source_online_id = f.source_online_id;
