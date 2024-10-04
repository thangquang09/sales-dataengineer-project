-- Drop all tables in reverse order (due to foreign key dependencies)
DROP TABLE sales.order_detail;
DROP TABLE sales.source_online;
DROP TABLE sales.order;
DROP TABLE sales.customer;
DROP TABLE sales.employee;
DROP TABLE sales.city;
DROP TABLE sales.store;

DROP TABLE production.product;
DROP TABLE production.category;
DROP TABLE production.brand;

-- Drop schemas (if needed)
DROP SCHEMA sales CASCADE;
DROP SCHEMA production CASCADE;