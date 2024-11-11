from setting import create_engines, create_sessions, BATCH_SIZE
from mysql_orm import *
from staging_orm import *
from dw_orm import *
from sqlalchemy import func, case
from sqlalchemy.dialects.postgresql import insert
from datetime import date
import logging
import random
import time


def generate_daily_data(mysql_session, min_cus=30, max_cus=60, min_order=200, max_order=400):
    try:
        print("Generating data ...")
        # Number of customers and orders to create
        num_cus = random.randint(min_cus, max_cus)
        num_order = random.randint(min_order, max_order)
        
        # Get max id and handle None values
        max_cus_id = mysql_session.query(func.max(MySQLSalesCustomer.customer_id)).scalar() or 0
        max_order_id = mysql_session.query(func.max(MySQLSalesOrder.order_id)).scalar() or 0
        
        # Employee, store, and product counts
        number_employee = mysql_session.query(MySQLSalesEmployee).count()
        number_store = mysql_session.query(MySQLSalesStore).count()
        number_product = mysql_session.query(MySQLProductionProduct).count()
        
        # ----- Generate Customers -----
        customers = []
        for _ in range(num_cus):
            max_cus_id += 1 
            new_customer = MySQLSalesCustomer(
                customer_id=max_cus_id,
                name=f"customer {max_cus_id}",
                phone=str(random.randint(1000000000, 9999999999)),  # 10-digit number
                email=f"customer{max_cus_id}@example.com",
                createdDate=date.today()
            )
            customers.append(new_customer)
        mysql_session.bulk_save_objects(customers)

        # ----- Generate Orders -----
        orders = []
        for _ in range(num_order):
            max_order_id += 1
            isOnline = random.randint(0, 1)
            new_order = MySQLSalesOrder(
                order_id=max_order_id,
                orderDate=date.today(),
                total=0,
                standardCost=0,
                status=random.randint(1, 4),
                isOnline=isOnline,
                source_online_id=random.randint(1, 4) if isOnline else None,
                customer_id=random.randint(1, max_cus_id),
                employee_id=random.randint(1, number_employee),
                store_id=random.randint(1, number_store),
                createdDate=date.today()
            )
            orders.append(new_order)
        mysql_session.bulk_save_objects(orders)

        # ----- Generate Order Details -----
        order_details = []
        batch_size = 1000

        # Product price and standard cost cache
        product_cache = {}

        for order in orders:
            num_prod_per_order = random.randint(1, 5)
            order_total = 0
            order_standard_cost = 0
            for _ in range(num_prod_per_order):
                product_id = random.randint(1, number_product)
                
                # Get product price and standard cost from cache or DB
                if product_id not in product_cache:
                    product_info = mysql_session.query(
                        MySQLProductionProduct.price,
                        MySQLProductionProduct.standardPrice
                    ).filter(MySQLProductionProduct.product_id == product_id).one_or_none()
                    
                    if product_info:
                        price, standard_cost = product_info
                        product_cache[product_id] = (price, standard_cost)
                    else:
                        continue  # Skip if product not found in DB
                else:
                    price, standard_cost = product_cache[product_id]

                quantity = random.randint(1, 10)
                total = price * quantity
                order_total += total
                order_standard_cost += standard_cost * quantity
                new_order_detail = MySQLSalesOrderDetail(
                    product_id=product_id,
                    quantity=quantity,
                    price=price,
                    total=total,
                    order_id=order.order_id,
                    createdDate=date.today()
                )
                order_details.append(new_order_detail)
            
            # Update order totals
            order.total = order_total
            order.standardCost = order_standard_cost

        # Insert order details in batches
        for i in range(0, len(order_details), batch_size):
            batch = order_details[i:i + batch_size]
            mysql_session.bulk_save_objects(batch)

        # Commit after adding all records
        mysql_session.commit()
        mysql_session.execute("CALL update_total_order();")
        mysql_session.commit()
        print(f"Successfully generated {num_cus} customers and {num_order} orders.")
        
    except Exception as e:
        print(f"Error generating daily data: {e}")
        mysql_session.rollback()



def load_table_data(mysql_session, staging_session, mysql_model, postgres_model, batch_size=BATCH_SIZE):
    try:
        postgres_columns = {col.name for col in postgres_model.__table__.columns}
        
        while True:
            # select records where checkStatus = 0
            records = mysql_session.query(mysql_model).filter(mysql_model.checkStatus == 0).limit(batch_size).all()
            
            # table is up to date
            if not records:
                print(f"{postgres_model.__tablename__} up to date")
                break

            postgres_records = []
            for record in records:
                record_data = {
                    k.lower(): v for k, v in record.__dict__.items()
                    if k != "_sa_instance_state" and k.lower() in postgres_columns
                }
                postgres_records.append(postgres_model(**record_data))

            # bulk insert into PostgreSQL and commit
            staging_session.bulk_save_objects(postgres_records)
            staging_session.commit()

            # update checkStatus after PostgreSQL commited
            for record in records:
                record.checkStatus = 1
            mysql_session.commit()

        print(f"Successfully loaded data to {postgres_model.__tablename__} in staging")
    
    except Exception as e:
        print(f"Error loading data to {postgres_model.__tablename__} in staging: {e}")
        staging_session.rollback()
        mysql_session.rollback()

def load_into_staging(mysql_session, staging_session):
    table_mappings = [
        (MySQLProductionProduct, PostgresProductionProduct),
        (MySQLProductionBrand, PostgresProductionBrand),
        (MySQLProductionCategory, PostgresProductionCategory),
        (MySQLSalesStore, PostgresSalesStore),
        (MySQLSalesCity, PostgresSalesCity),
        (MySQLSalesEmployee, PostgresSalesEmployee),
        (MySQLSalesCustomer, PostgresSalesCustomer),
        (MySQLSalesOrder, PostgresSalesOrder),
        (MySQLSalesOrderDetail, PostgresSalesOrderDetail),
        (MySQLSalesSourceOnline, PostgresSalesSourceOnline)
    ]

    for mysql_model, postgres_model in table_mappings:
        load_table_data(mysql_session, staging_session, mysql_model, postgres_model)

def upsert_dimension_table(session, model, data, conflict_column):
    """
    Upserts data into a specified dimension table in DW without committing.
    """
    stmt = insert(model).values(data)
    
    stmt = stmt.on_conflict_do_update(
        index_elements=[conflict_column],
        set_={col.name: getattr(stmt.excluded, col.name) for col in model.__table__.columns}
    )
    
    # Execute upsert without commit
    session.execute(stmt)

def load_dimension_table(staging_session, dw_session, dw_model, records):
    try:
        # Chuẩn bị data_to_upsert từ các đối tượng ORM
        data_to_upsert = [
            {col.name: getattr(record, col.name) or "NA" for col in dw_model.__table__.columns}
            for record in records
        ]
        
        # Thực hiện upsert với data_to_upsert
        upsert_dimension_table(dw_session, dw_model, data_to_upsert, list(dw_model.__table__.primary_key.columns.keys())[0])
    
        # Cập nhật trạng thái isprocessed cho mỗi record sau khi upsert
        for record in records:
            record.isprocessed = True

        print(f"Successfully loaded data to {dw_model.__tablename__}")
    
    except Exception as e:
        print(f"Error loading to DW: {e}")
        staging_session.rollback()
        dw_session.rollback()

def load_dimension_city(staging_session, dw_session, batch_size=BATCH_SIZE):
    staging_model = PostgresSalesCity
    dw_model = DimCity
    any_loaded = False
    while True:
        # Lấy batch bản ghi từ Staging, với full ORM object
        records = staging_session.query(staging_model).filter(staging_model.isprocessed == False).limit(batch_size).all()
        if not records:
            print(f"{dw_model.__tablename__} up to date")
            break
        
        # Gọi hàm load_dimension_table để xử lý batch hiện tại
        load_dimension_table(staging_session, dw_session, dw_model, records)
        any_loaded = True
    
    if any_loaded:
        staging_session.commit()
        dw_session.commit()
        print(f"Successfully loaded data to {dw_model.__tablename__} in dw")

def load_dimension_store(staging_session, dw_session, batch_size=BATCH_SIZE):
    staging_model = PostgresSalesStore
    dw_model = DimStore
    any_loaded = False

    while True:
        records = staging_session.query(staging_model).filter(staging_model.isprocessed == False).limit(batch_size).all()
        if not records:
            print(f"{dw_model.__tablename__} up to date")
            break
        load_dimension_table(staging_session, dw_session, dw_model, records)
        any_loaded = True
    
    if any_loaded:
        staging_session.commit()
        dw_session.commit()
        print(f"Successfully loaded data to {dw_model.__tablename__} in dw")

def load_dimension_employee(staging_session, dw_session, batch_size=BATCH_SIZE):
    staging_model = PostgresSalesEmployee
    dw_model = DimEmployee
    any_loaded = False

    while True:
        records = staging_session.query(staging_model).filter(staging_model.isprocessed == False).limit(batch_size).all()
        if not records:
            print(f"{dw_model.__tablename__} up to date")
            break
        load_dimension_table(staging_session, dw_session, dw_model, records)
        any_loaded = True
    
    if any_loaded:
        staging_session.commit()
        dw_session.commit()
        print(f"Successfully loaded data to {dw_model.__tablename__} in dw")

def load_dimension_customer(staging_session, dw_session, batch_size=BATCH_SIZE):
    staging_model = PostgresSalesCustomer
    dw_model = DimCustomer
    any_loaded = False

    while True:
        records = staging_session.query(staging_model).filter(staging_model.isprocessed == False).limit(batch_size).all()
        if not records:
            print(f"{dw_model.__tablename__} up to date")
            break
        load_dimension_table(staging_session, dw_session, dw_model, records)
        any_loaded = True

    if any_loaded:
        staging_session.commit()
        dw_session.commit()
        print(f"Successfully loaded data to {dw_model.__tablename__} in dw")

def load_dimension_source_online(staging_session, dw_session, batch_size=BATCH_SIZE):
    staging_model = PostgresSalesSourceOnline
    dw_model = DimSourceOnline
    any_loaded = False

    while True:
        records = staging_session.query(staging_model).filter(staging_model.isprocessed == False).limit(batch_size).all()
        if not records:
            print(f"{dw_model.__tablename__} up to date")
            break
        
        # id = 1000, offline
        new_record = dw_model(source_online_id=1000, link_name="Offline")
        records.append(new_record)

        load_dimension_table(staging_session, dw_session, dw_model, records)
        any_loaded = True

    if any_loaded:
        staging_session.commit()
        dw_session.commit()
        print(f"Successfully loaded data to {dw_model.__tablename__} in dw")

def load_dimension_year(staging_session, dw_session):
    staging_model = PostgresSalesOrder
    dw_model = DimYear
    any_loaded = False

    try:
        years = (
            staging_session.query(func.extract('year', staging_model.orderdate).label('name'))
            .filter(staging_model.isprocessed == False)
            .distinct()
            .all()
        )

        if not years:  # Exit loop if no more years are found
            if not any_loaded:
                print(f"{dw_model.__tablename__} up to date")


        # Convert extracted years to integers and filter out existing years in DW
        existing_years = {int(year.name) for year in dw_session.query(dw_model.name).all()}
        new_years = [{'name': year.name} for year in years if year.name not in existing_years]
        # Insert new years into DW in a batch
        if new_years:
            dw_session.bulk_insert_mappings(dw_model, new_years)
            any_loaded = True

        if any_loaded:
            dw_session.commit()
            print(f"Successfully loaded data to {dw_model.__tablename__} in DW")
    except Exception as e:
        print(f"Error loading data to {dw_model.__tablename__} in DW: {e}")
        dw_session.rollback()


def load_dimension_quarter(dw_session):
    try:
        dw_model = DimQuarter
        quarters = ['Q1', 'Q2', 'Q3', 'Q4']
        existing_quarters = {quarter.name for quarter in dw_session.query(dw_model.name).all()}
        new_quarters = [{'name': quarter} for quarter in quarters if quarter not in existing_quarters]

        for quarter_data in new_quarters:
            dw_session.add(dw_model(**quarter_data))
        
        dw_session.commit()
        print("Successfully loaded data to DimQuarter in dw")
    except Exception as e:
        print(f"Error loading data to DimQuarter in dw: {e}")
        dw_session.rollback()

def load_dimension_month(staging_session, dw_session):
    staging_model = PostgresSalesOrder
    dw_model = DimMonth
    any_loaded = False

    convert_month = {
        1: "January",
        2: "February",
        3: "March",
        4: "April",
        5: "May",
        6: "June",
        7: "July",
        8: "August",
        9: "September",
        10: "October",
        11: "November",
        12: "December"
    }
    try:
        dim_year = dw_session.query(DimYear).all()
        existing_months = [(a.year_id, a.month) for a in dw_session.query(DimMonth).all()]
        dim_years = {}
        for i in range(len(dim_year)):
            dim_years[dim_year[i].name] = dim_year[i].year_id

        years_months = (
            staging_session.query(func.extract('year', staging_model.orderdate).label('year'),
                                    func.extract('month', staging_model.orderdate).label('month'))
            .filter(staging_model.isprocessed == False)
            .distinct()
            .all()
        )

        if years_months:
            for data in years_months:
                check_tuple = (dim_years[str(data.year)], data.month)
                if check_tuple in existing_months:
                    continue
                new_month = DimMonth(
                    year_id=dim_years[str(data.year)],
                    quarter_id=(data.month - 1) // 3 + 1,
                    month=data.month,
                    name=convert_month[data.month]
                )
                dw_session.add(new_month)
            any_loaded = True
        if any_loaded:
            dw_session.commit()
            print(f"Successfully loaded data to {dw_model.__tablename__} in dw")
    except Exception as e:
        print(f"Error loading data to {dw_model.__tablename__} in dw: {e}")
        dw_session.rollback()

def load_dimension_date(staging_session, dw_session):
    staging_model = PostgresSalesOrder
    dw_model = DimDate
    any_loaded = False

    try:
        months = {f"{a.year_id} - {a.month}": a.month_id for a in dw_session.query(DimMonth).all()}
        years = {a.name: a.year_id for a in dw_session.query(DimYear).all()}
        existing_dates = [a.date_name for a in dw_session.query(DimDate).all()]

        dates = (
            staging_session.query(func.extract('year', staging_model.orderdate).label('year'),
                                    func.extract('month', staging_model.orderdate).label('month'),
                                    func.extract('day', staging_model.orderdate).label('day'),
                                    staging_model.orderdate
                                    )
                                    
            .filter(staging_model.isprocessed == False)
            .distinct()
            .all()
        )
        # print(existing_dates)
        for data in dates:
            if data.orderdate in existing_dates:
                continue
            key_check = f"{years[str(data.year)]} - {data.month}"
            new_date = DimDate(
                month_id=months[key_check],
                year_id=years[str(data.year)],
                date_name=data.orderdate
            )
            dw_session.add(new_date)
            any_loaded = True
        if any_loaded:
            dw_session.commit()
            print(f"Successfully loaded data to {dw_model.__tablename__} in dw")
    except Exception as e:
        print(f"Error loading data to {dw_model.__tablename__} in dw: {e}")
        dw_session.rollback()

def load_dimension_brand(staging_session, dw_session):
    staging_model = PostgresProductionBrand
    dw_model = DimBrand
    any_loaded = False

    while True:
        records = staging_session.query(staging_model).filter(staging_model.isprocessed == False).limit(BATCH_SIZE).all()
        if not records:
            print(f"{dw_model.__tablename__} up to date")
            break
        load_dimension_table(staging_session, dw_session, dw_model, records)
        any_loaded = True

    if any_loaded:
        staging_session.commit()
        dw_session.commit()
        print(f"Successfully loaded data to {dw_model.__tablename__} in dw")

def load_dimension_category(staging_session, dw_session):
    staging_model = PostgresProductionCategory
    dw_model = DimCategory
    any_loaded = False

    while True:
        records = staging_session.query(staging_model).filter(staging_model.isprocessed == False).limit(BATCH_SIZE).all()
        if not records:
            print(f"{dw_model.__tablename__} up to date")
            break
        load_dimension_table(staging_session, dw_session, dw_model, records)
        any_loaded = True

    if any_loaded:
        staging_session.commit()
        dw_session.commit()
        print(f"Successfully loaded data to {dw_model.__tablename__} in dw")

def load_dimension_product(staging_session, dw_session):
    staging_model = PostgresProductionProduct
    dw_model = DimProduct
    any_loaded = False

    while True:
        records = staging_session.query(staging_model).filter(staging_model.isprocessed == False).limit(BATCH_SIZE).all()
        if not records:
            print(f"{dw_model.__tablename__} up to date")
            break
        load_dimension_table(staging_session, dw_session, dw_model, records)
        any_loaded = True

    if any_loaded:
        staging_session.commit()
        dw_session.commit()
        print(f"Successfully loaded data to {dw_model.__tablename__} in dw")

def load_fact_sales_order(staging_session, dw_session, batch_size=BATCH_SIZE):
    try:
        # Load date mapping once per function call
        date_mapping = {row.date_name: row.date_id for row in dw_session.query(DimDate.date_id, DimDate.date_name).all()}
        offset = 0
        while True:
            sales_data = (
                staging_session.query(
                    PostgresSalesOrder.store_id,
                    PostgresSalesOrder.employee_id,
                    PostgresSalesOrder.customer_id,
                    PostgresSalesOrder.orderdate,
                    PostgresSalesOrder.source_online_id,
                    func.sum(PostgresSalesOrder.total).label("revenue"),
                    func.sum(PostgresSalesOrder.standardcost).label("standardcost"),
                    func.sum(PostgresSalesOrder.total - PostgresSalesOrder.standardcost).label("profit"),
                    func.count(PostgresSalesOrder.order_id).label("number_order"),
                    func.sum(case([(PostgresSalesOrder.isonline == True, PostgresSalesOrder.total)], else_=0)).label("revenue_online"),
                    func.sum(case([(PostgresSalesOrder.isonline == False, PostgresSalesOrder.total)], else_=0)).label("revenue_offline"),
                    func.sum(case([(PostgresSalesOrder.isonline == True, 1)], else_=0)).label("number_order_online"),
                    func.sum(case([(PostgresSalesOrder.isonline == False, 1)], else_=0)).label("number_order_offline"),
                )
                .filter(PostgresSalesOrder.isprocessed == False)
                .group_by(
                    PostgresSalesOrder.store_id,
                    PostgresSalesOrder.employee_id,
                    PostgresSalesOrder.customer_id,
                    PostgresSalesOrder.orderdate,
                    PostgresSalesOrder.source_online_id
                )
                .offset(offset)
                .limit(batch_size)
                .all()
            )
            offset += batch_size
            if not sales_data:
                print("FactSalesOrder up to date")
                break
            
            fact_sales_records = []
            for record in sales_data:
                fact_sales_records.append(
                    FactSalesOrder(
                        store_id=record.store_id,
                        employee_id=record.employee_id,
                        customer_id=record.customer_id,
                        date_id=date_mapping.get(record.orderdate, None),
                        source_online_id=record.source_online_id or 1000,
                        revenue=record.revenue,
                        standard_cost=record.standardcost,
                        profit=record.profit,
                        number_order=record.number_order,
                        revenue_online=record.revenue_online,
                        revenue_offline=record.revenue_offline,
                        number_order_online=record.number_order_online,
                        number_order_offline=record.number_order_offline
                    )
                )

            dw_session.bulk_save_objects(fact_sales_records)

        dw_session.commit()
        print("Successfully loaded data to FactSalesOrder")
    except Exception as e:
        print(f"Error loading data to FactSalesOrder: {e}")
        staging_session.rollback()
        dw_session.rollback()

def load_fact_production(staging_session, dw_session, batch_size=BATCH_SIZE):
    try:
        # Cache date mapping once
        date_mapping = {row.date_name: row.date_id for row in dw_session.query(DimDate.date_id, DimDate.date_name).all()}
        offset = 0
        while True:
            production_data = (
                staging_session.query(
                    PostgresProductionProduct.product_id,
                    PostgresSalesOrder.orderdate,
                    PostgresSalesOrder.store_id,
                    func.sum(PostgresSalesOrderDetail.quantity).label("quantity"),
                    func.sum(PostgresProductionProduct.price * PostgresSalesOrderDetail.quantity).label("revenue"),
                    func.sum((PostgresProductionProduct.price - PostgresProductionProduct.standardprice) * PostgresSalesOrderDetail.quantity).label("profit"),
                )
                .join(PostgresSalesOrderDetail, PostgresProductionProduct.product_id == PostgresSalesOrderDetail.product_id)
                .join(PostgresSalesOrder, PostgresSalesOrderDetail.order_id == PostgresSalesOrder.order_id)
                .filter(PostgresSalesOrder.isprocessed == False)
                .group_by(PostgresProductionProduct.product_id, PostgresSalesOrder.orderdate, PostgresSalesOrder.store_id)
                .offset(offset)
                .limit(batch_size)
                .all()
            )
            offset += batch_size
            if not production_data:
                print("FactProduction up to date")
                break

            fact_production_records = []
            for record in production_data:
                date_id = date_mapping.get(record.orderdate)
                new_record = FactProduction(
                    product_id=record.product_id,
                    date_id=date_id,
                    store_id=record.store_id,
                    quantity=record.quantity,
                    revenue=record.revenue,
                    profit=record.profit,
                )
                fact_production_records.append(new_record)

            dw_session.bulk_save_objects(fact_production_records)

        dw_session.commit()
        print("Successfully loaded data to FactProduction")
    except Exception as e:
        print(f"Error loading data to FactProduction: {e}")
        staging_session.rollback()
        dw_session.rollback()

def load_into_dw(staging_session, dw_session):
    load_dimension_city(staging_session, dw_session)
    load_dimension_store(staging_session, dw_session)
    load_dimension_employee(staging_session, dw_session)
    load_dimension_customer(staging_session, dw_session)
    load_dimension_source_online(staging_session, dw_session)
    load_dimension_year(staging_session, dw_session)
    load_dimension_quarter(dw_session)
    load_dimension_month(staging_session, dw_session)
    load_dimension_date(staging_session, dw_session)
    load_dimension_brand(staging_session, dw_session)
    load_dimension_category(staging_session, dw_session)
    load_dimension_product(staging_session, dw_session)
    load_fact_sales_order(staging_session, dw_session)
    load_fact_production(staging_session, dw_session)

def truncate_staging(staging_session):
    query = """
        TRUNCATE TABLE sales_order CASCADE;
        TRUNCATE TABLE sales_order_detail CASCADE; 
    """
    try:
        staging_session.execute(query)
        staging_session.commit()
        print("Truncated staging tables")
    except Exception as e:
        print(f"Error truncating staging tables: {e}")
        staging_session.rollback()

def refresh_view(dw_session):
    try:
        dw_session.execute("REFRESH MATERIALIZED VIEW view_fact_sale_orders;")
        dw_session.execute("REFRESH MATERIALIZED VIEW view_fact_production;")
        dw_session.commit()
        print("Successfully refreshed views")
    except Exception as e:
        print(f"Error refreshing views: {e}")
        dw_session.rollback()

if __name__ == "__main__":
    mysql_engine, staging_engine, dw_engine = create_engines()
    mysql_session, staging_session, dw_session = create_sessions(mysql_engine, staging_engine, dw_engine)

    generate_daily_data(mysql_session)
    load_into_staging(mysql_session, staging_session)
    load_into_dw(staging_session, dw_session)