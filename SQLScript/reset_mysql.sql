USE sales_db;

UPDATE production_product SET checkStatus = 0;
UPDATE production_category SET checkStatus = 0;
UPDATE production_brand SET checkStatus = 0;
UPDATE sales_store SET checkStatus = 0;
UPDATE sales_source_online SET checkStatus = 0;
UPDATE sales_order_detail SET checkStatus = 0;
UPDATE sales_order SET checkStatus = 0;
UPDATE sales_employee SET checkStatus = 0;
UPDATE sales_customer SET checkStatus = 0;
UPDATE sales_city SET checkStatus = 0;