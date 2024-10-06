-- RDBMS: PostgreSQL
DROP MATERIALIZED VIEW view_store_city_employee_cus;
DROP MATERIALIZED VIEW view_quantity_cate_store_city;
DROP MATERIALIZED VIEW view_online_offline_summary;

DROP TABLE Fact_Sales_Order;
DROP TABLE Fact_Production;
DROP TABLE Dim_Product;
DROP TABLE Dim_Brand;
DROP TABLE Dim_Category;
DROP TABLE Dim_Date;
DROP TABLE Dim_Month;
DROP TABLE Dim_Quarter;
DROP TABLE Dim_Year;
DROP TABLE Dim_Source_Online;
DROP TABLE Dim_Customer;
DROP TABLE Dim_Employee;
DROP TABLE Dim_Store;
DROP TABLE Dim_City;

-- Make sure you created sales_dw database and use it to run this script
-- RDBMS: PostgreSQL
-- Make sure you created sales_dw database and use it to run this script
-- RDBMS: PostgreSQL

-- create Dim of sales first

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
    standardCost DECIMAL(15, 2),
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

CREATE MATERIALIZED VIEW view_store_city_employee_cus AS
SELECT
	s.store_id,
	s.name as store_name,
	e.employee_id,
	e.name as employee_name,
	city.city_id,
	city.name as city_name,
	c.customer_id,
	c.name as customer_name,
	SUM(fo.revenue) AS revenue,
	SUM(fo.revenue - fo.standardcost) as profit,
	SUM(fo.number_order) as number_order,
	AVG(fo.revenue) as average_value
FROM
	fact_sales_order fo
	JOIN dim_store s ON fo.store_id = s.store_id
	JOIN dim_city city ON s.city_id = city.city_id
	JOIN dim_employee e ON fo.employee_id = e.employee_id
	JOIN dim_customer c ON fo.customer_id = c.customer_id
GROUP BY
	s.store_id,
	s.name,
	e.employee_id,
	e.name,
	city.city_id,
	city.name,
	c.customer_id,
	c.name;

CREATE MATERIALIZED VIEW view_quantity_cate_store_city AS
SELECT
    fp.product_id,
    p.name as product_name,
	cate.category_id,
	cate.name as category_name,
	s.store_id,
	s.name as store_name,
	city.city_id,
	city.name as city_name,
	SUM(fp.quantity) as quantity,
    SUM(fp.revenue) as revenue
FROM
	fact_production fp
	JOIN dim_product p ON fp.product_id = p.product_id
	JOIN dim_category cate ON cate.category_id = p.category_id
	JOIN dim_store s ON s.store_id = fp.store_id
	JOIN dim_city city ON s.city_id = city.city_id
GROUP BY
	fp.product_id,
	p.name,
	cate.category_id,
	cate.name,
	s.store_id,
	s.name,
	city.city_id,
	city.name;

CREATE MATERIALIZED VIEW view_online_offline_summary AS 
SELECT
	d.date_id,
	m.month_id,
	m.name as month_name,
	y.year_id,
	y.name as year,
	fo.source_online_id,
	so.link_name,
	SUM(fo.number_order_online) as number_order_online,
	SUM(fo.number_order_offline) as number_order_offline,
	SUM(fo.revenue) as revenue,
	SUM(fo.revenue_online) as revenue_online,
	SUM(fo.revenue_offline) as revenue_offline
FROM
	fact_sales_order fo
	JOIN dim_date d ON d.date_id = fo.date_id
	JOIN dim_month m ON m.month_id = d.month_id
	JOIN dim_year y ON y.year_id = d.year_id
	JOIN dim_source_online so ON so.source_online_id = fo.source_online_id
GROUP BY
	d.date_id,
	m.month_id,
	m.name,
	y.year_id,
	y.name,
	fo.source_online_id,
	so.link_name;