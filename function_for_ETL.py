from sqlalchemy import *
from sqlalchemy.dialects.postgresql import insert as pg_insert
import pandas as pd
from datetime import datetime
import random
from urllib.parse import quote_plus
import matplotlib.pyplot as plt
import os

month_name = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
if '__file__' in globals():
    PROJECT_DIR = os.path.dirname(os.path.abspath(__file__))
else:
    # Set PROJECT_DIR to the current working directory or any desired path
    PROJECT_DIR = os.getcwd()

print(f"Project directory: {PROJECT_DIR}")

copy_queries = [
    ("employee_rev_pro_num.csv", """
    (SELECT
        employee_name,
        SUM(revenue) as revenue,
        SUM(number_order) as number_order,
        SUM(profit) as profit
    FROM
        view_store_city_employee_cus
    GROUP BY
        employee_name,
        employee_id
    ORDER BY
        employee_id)
    """),

    ("city_rev_pro_num.csv", """
    (SELECT
        city_name,
        SUM(revenue) as revenue,
        SUM(number_order) as number_order,
        SUM(profit) as profit
    FROM
        view_store_city_employee_cus
    GROUP BY
        city_name,
        city_id
    ORDER BY
        city_id)
    """),

    ("store_rev_pro_num.csv", """
    (SELECT
        store_name,
        SUM(revenue) as revenue,
        SUM(number_order) as number_order,
        SUM(profit) as profit
    FROM
        view_store_city_employee_cus
    GROUP BY
        store_name,
        store_id
    ORDER BY
        store_id)
    """),

    ("customer_rev_pro_num.csv", """
    (SELECT
        customer_name,
        SUM(revenue) as revenue,
        SUM(number_order) as number_order,
        SUM(profit) as profit
    FROM
        view_store_city_employee_cus
    GROUP BY
        customer_name,
        customer_id
    ORDER BY
        customer_id)
    """),

    ("product_revenue_profit.csv", """
    (SELECT
        product_name,
        SUM(revenue) as revenue,
        SUM(profit) as profit
    FROM
        view_quantity_cate_store_city
    GROUP BY
        product_name,
        product_id
    ORDER BY
        product_id)
    """),

    ("city_quantity_product.csv", """
    (SELECT
        city_name,
        SUM(quantity) as quantity
    FROM
        view_quantity_cate_store_city
    GROUP BY
        city_name,
        city_id
    ORDER BY
        city_id)
    """),

    ("category_quantity_product.csv", """
    (SELECT
        category_name,
        SUM(quantity) as quantity
    FROM
        view_quantity_cate_store_city
    GROUP BY
        category_name,
        category_id
    ORDER BY
        category_id)
    """),

    ("store_quantity_product.csv", """
    (SELECT
        store_name,
        SUM(quantity) as quantity
    FROM
        view_quantity_cate_store_city
    GROUP BY
        store_name,
        store_id
    ORDER BY
        store_id)
    """),

    ("ratio_on_off.csv", """
    (SELECT
        month_name,
        year,
        SUM(revenue_online) AS revenue_online,
        SUM(revenue_offline) AS revenue_offline,
        SUM(number_order_online) AS number_order_online,
        SUM(number_order_offline) AS number_order_offline,
        SUM(number_order_online + number_order_offline) as number_order,
        SUM(revenue_online) / SUM(revenue) as ratio_revenue_on,
        SUM(revenue_offline) / SUM(revenue) as ratio_revenue_off,
        SUM(number_order_online) / SUM(number_order_online + number_order_offline) as ratio_number_order_on,
        SUM(number_order_offline) / SUM(number_order_online + number_order_offline) as ratio_number_order_off
    FROM
        view_online_offline_summary
    GROUP BY
        month_id, year_id, month_name, year
    ORDER BY
        year)
    """),

    ("source_rev_numberoder.csv", """
    (SELECT
        link_name,
        SUM(number_order_online) as number_order,
        SUM(revenue_online) as revenue
    FROM
        view_online_offline_summary
    WHERE
        link_name != 'offline'
    GROUP BY
        source_online_id, link_name)
    """),

    ("10_best_selling_prod.csv", """
    (SELECT
        product_name,
        SUM(quantity) as quantity_sold
    FROM
        view_quantity_cate_store_city
    GROUP BY
        product_id, product_name
    ORDER BY
        SUM(quantity) DESC
    LIMIT 10)
    """),

    ("10_worst_selling_prod.csv", """
    (SELECT
        product_name,
        SUM(quantity) as quantity_sold
    FROM
        view_quantity_cate_store_city
    GROUP BY
        product_id, product_name
    ORDER BY
        SUM(quantity)
    LIMIT 10)
    """),

    ("10_best_selling_emp.csv", """
    (SELECT
        employee_name,
        SUM(revenue) as revenue
    FROM
        view_store_city_employee_cus
    GROUP BY
        employee_id, employee_name
    ORDER BY
        SUM(revenue) DESC
    LIMIT 10)
    """),

    ("10_worst_selling_emp.csv", """
    (SELECT
        employee_name,
        SUM(revenue) as revenue
    FROM
        view_store_city_employee_cus
    GROUP BY
        employee_id, employee_name
    ORDER BY
        SUM(revenue)
    LIMIT 10)
    """),

    ("10_best_selling_store.csv", """
    (SELECT
        store_name,
        SUM(revenue) as revenue
    FROM
        view_store_city_employee_cus
    GROUP BY
        store_id, store_name
    ORDER BY
        SUM(revenue) DESC
    LIMIT 10)
    """),

    ("10_worst_selling_store.csv", """
    (SELECT
        store_name,
        SUM(revenue) as revenue
    FROM
        view_store_city_employee_cus
    GROUP BY
        store_id, store_name
    ORDER BY
        SUM(revenue)
    LIMIT 10)
    """)
]

## ____________ function_for_ETL.py ____________

def quote_config_value(config):
    for key, value in config.items():
            config[key] = quote_plus(value)
    return config

def get_config(path_file):
    with open(os.path.join(PROJECT_DIR, path_file), 'r') as f:
        config = eval(f.read())
    return quote_config_value(config)

def get_engine(config, rdbms):
    if rdbms == 'mysql':
        return create_engine(f'mysql+mysqlconnector://{config["user"]}:{config["password"]}@{config["host"]}/{config["database"]}')
    elif rdbms == 'postgresql':
        return create_engine(f'postgresql+psycopg2://{config["user"]}:{config["password"]}@{config["host"]}:{config["port"]}/{config["database"]}')
    else:
        print('Invalid RDBMS')
        return None

def generate_date(min_year, max_year):
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    year = random.randint(min_year, max_year)
    return datetime(year, month, day).strftime('%Y-%m-%d')

def update_isprocessed(session, table_name):
    query = text(f'UPDATE {table_name} SET isprocessed = true WHERE isprocessed = false')
    session.execute(query)
    session.commit()

# for city table
def upsert_data(engine, session, table_name, schema='public', data_list=None, conflict_column=None):
    metadata = MetaData()
    table = Table(table_name, metadata, autoload_with=engine, schema=schema)

    stmt = pg_insert(table).values(data_list)
    update_dict = {c.name: c for c in stmt.excluded if c.name != conflict_column}

    upsert_stmt = stmt.on_conflict_do_update(
        index_elements=[conflict_column],
        set_=update_dict
    )
    
    # excute upsert statement
    session.execute(upsert_stmt)
    session.commit()

def load_with_batch(engine, session, table_name, schema='public', data_list=None, batch_size=1000, conflict_column=None):
    # check if data_list is pd.DataFrame -> convert to dict
    if isinstance(data_list, pd.DataFrame):
        if conflict_column is None:
            conflict_column = data_list.columns[0]
        data_list = data_list.to_dict('records')

    metadata = MetaData()
    table = Table(table_name, metadata, autoload_with=engine, schema=schema)

    for i in range(0, len(data_list), batch_size):
        data = data_list[i: i + batch_size]
        upsert_data(engine, session, table_name, schema, data, conflict_column)

def generate_data(mysql_session, min_cus=10, max_cus=30, min_order=500, max_order=1000):
    print(f"Generating data with {min_cus} to {max_cus} customers and {min_order} to {max_order} orders")
    print('----------------------------------')
    query = text(f"CALL generate_daily_data({min_cus}, {max_cus}, {min_order}, {max_order})")
    mysql_session.execute(query)
    mysql_session.commit()
    print("Generated data successfully")
    print('----------------------------------')

def get_df(staging, table_in, columns):
    staging_engine, staging_session = staging
    query = text(f'SELECT {columns} FROM {table_in} WHERE isprocessed = false')
    return pd.read_sql(query, staging_engine)

def load_dim_city(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.city'
    table_out = 'dim_city'
    columns = ",".join(['city_id', 'name'])
    df = get_df(staging, table_in, columns)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    load_with_batch(dw_engine, dw_session, table_out, 'public', data_list = df)
    update_isprocessed(staging_session, table_in)
    print(f'Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL')


def load_dim_store(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.store'
    table_out = 'dim_store'
    columns = ",".join(['store_id', 'name', 'city_id'])
    df = get_df(staging, table_in, columns)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    load_with_batch(dw_engine, dw_session, table_out, 'public', df)
    update_isprocessed(staging_session, table_in)
    print(f'Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL')

def load_dim_employee(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.employee'
    table_out = 'dim_employee'
    columns = ",".join(['employee_id', 'name', 'store_id', 'dob', 'identitynumber'])
    df = get_df(staging, table_in, columns)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    # handle columns if it null
    dob_handler = lambda x: generate_date(1980, 2000) if pd.isnull(x) else x
    identity_handler = lambda x: str(random.randint(100000, 999999)) if pd.isnull(x) else x
    df['dob'] = df['dob'].apply(dob_handler)
    df['identitynumber'] = df['identitynumber'].apply(identity_handler)
    load_with_batch(dw_engine, dw_session, table_out, 'public', df)
    update_isprocessed(staging_session, table_in)
    print(f'Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL')


def load_dim_customer(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.customer'
    table_out = 'dim_customer'
    columns = ",".join(['customer_id', 'name', 'email'])
    df = get_df(staging, table_in, columns)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    # handle columns if it null
    load_with_batch(dw_engine, dw_session, table_out, 'public', df)
    update_isprocessed(staging_session, table_in)
    print(f'Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL')

def load_dim_source_online(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.source_online'
    table_out = 'dim_source_online'
    columns = ",".join(['source_online_id', 'link_name'])
    df = get_df(staging, table_in, columns)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    load_with_batch(dw_engine, dw_session, table_out, 'public', df)
    update_isprocessed(staging_session, table_in)
    print(f'Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL')

def load_dim_year(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.order'
    table_out = 'dim_year'
    columns = ",".join(['orderdate'])
    query = text(f'SELECT DISTINCT(EXTRACT(YEAR FROM {columns})) AS name FROM {table_in} WHERE isprocessed = false')
    check_dw_query = text(f'SELECT name FROM public.dim_year')
    staging_df = pd.read_sql(query, staging_engine)
    dw_df = pd.read_sql(check_dw_query, dw_engine)

    if staging_df.empty:
        print(f'{table_out} is up to date')
        return
    staging_df['name'] = staging_df['name'].astype(int).astype(str)
    if dw_df.empty:
        new_year = staging_df
    else:
        new_year = staging_df[~staging_df['name'].isin(dw_df['name'])]
    if new_year.empty:
        print(f'{table_out} is up to date')
        return
    for row in new_year.itertuples():
        data = {'name': row.name}
        dw_session.execute(text(f"INSERT INTO public.{table_out} (name) VALUES ('{row.name}')"))
    dw_session.commit()
    # with year, no need to update isprocessed in staging, after load dim_date, it will be updated
    print(f'Upserted {len(new_year)} records from {table_in} to {table_out} in PostgreSQL')


def load_dim_quarter(dw):
    dw_engine, dw_session = dw
    count = dw_session.execute(text(f'SELECT COUNT(*) FROM public.dim_quarter')).fetchone()[0]
    if count == 4:
        print('dim_quarter is up to date')
        return
    quarter_name = ['Q1', 'Q2', 'Q3', 'Q4']
    for i in range(4):
        data = {'name': quarter_name[i]}
        dw_session.execute(text(f"INSERT INTO public.dim_quarter (name) VALUES ('{quarter_name[i]}')"))
    dw_session.commit()
    print(f'Upserted 4 records to dim_quarter in PostgreSQL')

def load_dim_month(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.order'
    table_out = 'dim_month'
    query = text("SELECT DISTINCT(orderdate) FROM sales.order WHERE isprocessed = false")
    check_dw_query = text(f'SELECT name, year_id FROM public.dim_month')
    get_dim_year = text(f'SELECT year_id, name FROM public.dim_year')
    staging_df = pd.read_sql(query, staging_engine)
    dw_df = pd.read_sql(check_dw_query, dw_engine)
    dim_year = pd.read_sql(get_dim_year, dw_engine)

    if staging_df.empty:
        print(f'{table_out} is up to date')
        return
    staging_df['month'] = pd.DatetimeIndex(staging_df['orderdate']).month
    staging_df['year'] = pd.DatetimeIndex(staging_df['orderdate']).year
    # drop duplicate with combination month, year
    staging_df.drop_duplicates(subset=['month', 'year'], inplace=True)
    staging_df['name'] = staging_df['month'].apply(lambda x: month_name[x - 1])
    staging_df['quarter_id'] = pd.DatetimeIndex(staging_df['orderdate']).quarter
    staging_df['year_id'] = staging_df['year'].apply(lambda x: dim_year[dim_year['name'] == str(x)]['year_id'].values[0])

    if dw_df.empty:
        new_month = staging_df
    else:
        # new month is row that not exist name and year_id in dw
        new_month = staging_df[~staging_df['name'].isin(dw_df['name']) & ~staging_df['year_id'].isin(dw_df['year_id'])]
    if new_month.empty:
        print(f'{table_out} is up to date')
        return
    for row in new_month.itertuples():
        data = {'name': row.name, 'quarter_id': row.quarter_id, 'year_id': row.year_id, 'month': row.month}
        dw_session.execute(text(f"INSERT INTO public.{table_out} (name, quarter_id, year_id, month) VALUES ('{row.name}', {row.quarter_id}, {row.year_id}, {row.month})"))
    dw_session.commit()
    # with month, no need to update isprocessed in staging, after load dim_date, it will be updated
    print(f'Upserted {len(new_month)} records from {table_in} to {table_out} in PostgreSQL')

def load_dim_date(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.order'
    table_out = 'dim_date'
    query = text("SELECT DISTINCT(orderdate) FROM sales.order WHERE isprocessed = false")
    check_dw_query = text(f'SELECT DISTINCT(date_name) FROM public.dim_date')
    get_dim_year = text(f'SELECT year_id, name FROM public.dim_year')
    get_dim_month = text(f'SELECT month_id, name FROM public.dim_month')
    staging_df = pd.read_sql(query, staging_engine)
    dw_df = pd.read_sql(check_dw_query, dw_engine)
    dim_year = pd.read_sql(get_dim_year, dw_engine)
    dim_month = pd.read_sql(get_dim_month, dw_engine)

    if staging_df.empty:
        print(f'{table_out} is up to date')
        return

    staging_df['year'] = pd.DatetimeIndex(staging_df['orderdate']).year
    staging_df['month'] = pd.DatetimeIndex(staging_df['orderdate']).month
    staging_df['month_id'] = staging_df['month'].apply(lambda x: dim_month[dim_month['name'] == month_name[x - 1]]['month_id'].values[0])
    staging_df['year_id'] = staging_df['year'].apply(lambda x: dim_year[dim_year['name'] == str(x)]['year_id'].values[0])

    if dw_df.empty:
        new_date = staging_df
    else:
        new_date = staging_df[~staging_df['orderdate'].isin(dw_df['date_name'])]
    if new_date.empty:
        print(f'{table_out} is up to date')
        return
    for row in new_date.itertuples():
        data = {'date_name': row.orderdate, 'year_id': row.year_id, 'month_id': row.month_id}
        dw_session.execute(text(f"INSERT INTO public.{table_out} (date_name, year_id, month_id) VALUES ('{row.orderdate}', {row.year_id}, {row.month_id})"))
    dw_session.commit()
    print(f'Upserted {len(new_date)} records from {table_in} to {table_out} in PostgreSQL')

def load_dim_brand(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'production.brand'
    table_out = 'dim_brand'
    df = get_df(staging, table_in, 'brand_id, name')
    if df.empty:
        print(f"{table_out} is up to date")
        return

    load_with_batch(dw_engine, dw_session, table_out, data_list=df)
    update_isprocessed(staging_session, table_in)
    print(f"Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL")

def load_dim_category(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'production.category'
    table_out = 'dim_category'
    columns = ",".join(["category_id", "name"])
    df = get_df(staging, table_in, columns)
    if df.empty:
        print(f"{table_out} is up to date")
        return

    load_with_batch(dw_engine, dw_session, table_out, data_list=df)
    update_isprocessed(staging_session, table_in)
    print(f"Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL")

def load_dim_product(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'production.product'
    table_out = 'dim_product'
    columns = ",".join([
        'product_id', 
        'name', 
        'description', 
        'size', 
        'color', 
        'brand_id', 
        'category_id',
        'standardprice',
        'price'
    ])

    df = get_df(staging, table_in, columns)
    if df.empty:
        print(f'{table_out} is up to date')
        return

    load_with_batch(dw_engine, dw_session, table_out, data_list=df)
    update_isprocessed(staging_session, table_in)
    print(f"Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL")

def load_fact_sales_order(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.order'
    table_out = 'fact_sales_order'
    link_to_fact = "SQLScript/load_fact_sales.sql"
    with open(os.path.join(PROJECT_DIR, link_to_fact), 'r') as f:
        query = text(f.read())
    df = pd.read_sql(query, staging_engine)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    dimdate = pd.read_sql(text("SELECT date_id, date_name FROM dim_date"), dw_engine)
    date_mapping = dimdate.set_index('date_name')['date_id'].to_dict()
    df['date_id'] = df['orderdate'].map(date_mapping)
    df.drop('orderdate', inplace=True, axis=1)
    df.fillna({'source_online_id':1000}, inplace=True)
    df.to_sql(table_out, dw_engine, if_exists='append', index=false)
    print(f"Inserted {len(df)} records to {table_out} in PostgreSQL")
    # will be update processed when load fact production

def load_fact_production(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in1 = 'sales.order'
    table_in2 = 'sales.order_detail'
    table_out = 'fact_production'
    link_to_fact = "SQLScript/load_fact_production.sql"
    with open(os.path.join(PROJECT_DIR, link_to_fact), 'r') as f:
        query = text(f.read())
    df = pd.read_sql(query, staging_engine)
    if df.empty:
        print(f"{table_out} is up to date")
        return
        
    dimdate = pd.read_sql(text("SELECT date_id, date_name FROM dim_date"), dw_engine)
    date_mapping = dimdate.set_index('date_name')['date_id'].to_dict()
    df['date_id'] = df['orderdate'].map(date_mapping)
    df.drop('orderdate', inplace=True, axis=1)
    df.to_sql(table_out, dw_engine, if_exists='append', index=false)
    print(f"Inserted {len(df)} records to {table_out} in PostgreSQL")
    update_isprocessed(session=staging_session, table_name=table_in1)
    update_isprocessed(session=staging_session, table_name=table_in2)

def truncate_staging(staging_session):
    query = text(
        """
        TRUNCATE TABLE sales.order CASCADE;
        TRUNCATE TABLE sales.order_detail CASCADE;
        """
    )

    print('Truncating staging...')
    staging_session.execute(query)
    staging_session.commit()
    print('Truncated staging successfully')
    print('----------------------------------')

def refresh_view(dw_session):
    print('Refreshing view in DataWarehouse...')
    query = text("SELECT matviewname FROM pg_matviews;")
    view_names = [row[0] for row in dw_session.execute(query)]
    
    for view_name in view_names:
        print(f'Refreshing {view_name}...')
        refresh_query = text(f"REFRESH MATERIALIZED VIEW {view_name};")
        # print(refresh_query)
        dw_session.execute(refresh_query)
        dw_session.commit()
        print(f'{view_name} refreshed successfully')
    print('----------------------------------')

def reset_staging(staging_session):
    drop_path = os.path.join(PROJECT_DIR, 'SQLScript/drop_staging.sql')
    initial_path = os.path.join(PROJECT_DIR, 'SQLScript/initial_dw_staging_postgreSQL.sql')
    with open(drop_path, 'r') as f:
        drop_query = text(f.read())
    with open(initial_path, 'r') as f:
        initial_query = text(f.read())
    print('Dropping staging...')
    staging_session.execute(drop_query)
    staging_session.commit()
    print('Dropped staging successfully')
    print('----------------------------------')
    print('Creating staging...')
    staging_session.execute(initial_query)
    staging_session.commit()
    print('Created staging successfully')
    print('----------------------------------')

def reset_dw(dw_session):
    drop_path = os.path.join(PROJECT_DIR, 'SQLScript/drop_dw.sql')
    initial_path = os.path.join(PROJECT_DIR, 'SQLScript/initial_dw_postgreSQL.sql')
    with open(drop_path, 'r') as f:
        drop_query = text(f.read())
    with open(initial_path, 'r') as f:
        initial_query = text(f.read())
    print('Dropping DataWarehouse...')
    dw_session.execute(drop_query)
    dw_session.commit()
    print('Dropped DataWarehouse successfully')
    print('----------------------------------')
    print('Creating DataWarehouse...')
    dw_session.execute(initial_query)
    dw_session.commit()
    print('Created DataWarehouse successfully')
    print('----------------------------------')

def reset_mysql(mysql_session):
    reset_path = os.path.join(PROJECT_DIR, 'SQLScript/reset_mysql.sql')
    with open(reset_path, 'r') as f:
        reset_queries = f.read().split(';')  # Split the script into individual statements
    
    print('Resetting MySQL...')
    
    for query in reset_queries:
        if query.strip():  # Skip empty statements
            mysql_session.execute(text(query))
    
    # Commit the transaction
    mysql_session.commit()
    
    print('Reset MySQL successfully')
    print('----------------------------------')

def export_csv(dw_session):
    base_path = os.path.join(PROJECT_DIR, 'csv_folder')
    if not os.path.exists(base_path):
        os.makedirs(base_path)
    print('Exporting all reports to csv_folder...')
    for file_name, query in copy_queries:
        query = text(f"COPY {query} TO '{os.path.join(base_path, file_name)}' DELIMITER ',' CSV HEADER;")
        dw_session.execute(query)
    print('Exported all reports to csv_folder')
    print('----------------------------------')

def make_report():
    print('Making report...')
    # ---- Load data ----
    path = os.path.join(PROJECT_DIR, 'csv_folder')

    cate = pd.read_csv(os.path.join(path, 'category_quantity_product.csv'))
    city = pd.read_csv(os.path.join(path, 'city_rev_pro_num.csv'))
    by_time = pd.read_csv(os.path.join(path, 'ratio_on_off.csv'))
    source_df = pd.read_csv(os.path.join(path, 'source_rev_numberoder.csv'))
    best_sell_store = pd.read_csv(os.path.join(path, '10_best_selling_store.csv'))
    best_sell_product = pd.read_csv(os.path.join(path, '10_best_selling_prod.csv'))

    # --- Processing data ---
    month_name = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

    years = by_time['year'].unique()
    years = years[:-1]
    year_revenues = []
    year_number_orders = []

    for year in years:
        revenues = []
        number_orders = []
        for month in month_name:
            df = by_time[(by_time['year'] == year) & (by_time['month_name'] == month)]
            revenue = df['revenue_online'] + df['revenue_offline']
            number_order = df['number_order_online'] + df['number_order_offline']
            revenues.append(revenue.sum())  
            number_orders.append(number_order.sum()) 

        year_revenues.append(revenues)
        year_number_orders.append(number_orders)

    ratio_df = pd.DataFrame()
    for month in month_name:
        df_month = by_time[by_time['month_name'] == month]
        ratio_revenue_online = df_month['ratio_revenue_on'].sum()
        ratio_revenue_offline = df_month['ratio_revenue_off'].sum()  
        ratio_number_order_online = df_month['ratio_number_order_on'].sum()
        ratio_number_order_offline = df_month['ratio_number_order_off'].sum()
        new_df = pd.DataFrame({'month_name': month, 'ratio_revenue_online': ratio_revenue_online, 'ratio_revenue_offline': ratio_revenue_offline, 'ratio_number_order_online': ratio_number_order_online, 'ratio_number_order_offline': ratio_number_order_offline}, index=[0])
        ratio_df = pd.concat([ratio_df, new_df], ignore_index=True)  

    total_revenue_source = source_df['revenue'].sum()
    total_order_source = source_df['number_order'].sum()
    source_df['revenue_ratio'] = source_df['revenue'] / total_revenue_source
    source_df['order_ratio'] = source_df['number_order'] / total_order_source

    # --- Plotting ---
    fig = plt.figure(figsize=(12, 20)) 
    ax1 = plt.subplot2grid((5, 3), (0, 0), colspan=3)
    for i in range(len(years)):
        plt.plot(month_name, year_revenues[i], label='year ' + str(years[i]))
    plt.title('Revenue by month')
    plt.legend()

    ax2 = plt.subplot2grid((5, 3), (1, 0), colspan=3)
    for i in range(len(years)):
        plt.plot(month_name, year_number_orders[i], label='year ' + str(years[i]))
    plt.title('Number of orders')
    plt.legend()

    ax3 = plt.subplot2grid((5, 3), (2, 0), colspan=1)
    city.plot(ax=ax3, x='city_name', y=['revenue', 'profit'], kind='bar')
    plt.title('Revenue and Profit by City')

    ax4 = plt.subplot2grid((5, 3), (2, 1), colspan=1)
    cate.plot(ax=ax4, x='category_name', y=['quantity'], kind='bar')
    plt.title('Quantity of products by Category')

    ax5 = plt.subplot2grid((5, 3), (2, 2), colspan=1)

    plt.pie(source_df['revenue_ratio'], labels=source_df['link_name'], autopct='%1.1f%%')
    plt.title('Revenue Ratio by Source')

    ax6 = plt.subplot2grid((5, 3), (3, 0), colspan=1)
    best_sell_store.plot(ax=ax6, x='store_name', y=['revenue'], kind='barh')
    plt.title('Top 10 best selling store')

    ax7 = plt.subplot2grid((5, 3), (3, 1), colspan=1)
    best_sell_product.plot(ax=ax7, x='product_name', y=['quantity_sold'], kind='barh')
    plt.title('Top 10 best selling product')

    ax8 = plt.subplot2grid((5, 3), (3, 2), colspan=1)
    plt.pie(source_df['order_ratio'], labels=source_df['link_name'], autopct='%1.1f%%')
    plt.title('Order Ratio by Source')

    ax9 = plt.subplot2grid((5, 3), (4, 0), colspan=2)
    plt.bar(ratio_df['month_name'], ratio_df['ratio_revenue_online'], label='Online')
    plt.bar(ratio_df['month_name'], ratio_df['ratio_revenue_offline'], label='Offline', bottom=ratio_df['ratio_revenue_online'])
    plt.xticks(rotation=45)
    plt.title('Revenue Ratio by Channel')
    plt.legend()

    ax10 = plt.subplot2grid((5, 3), (4, 2), colspan=1)
    plt.bar(ratio_df['month_name'], ratio_df['ratio_number_order_online'], label='Online')
    plt.bar(ratio_df['month_name'], ratio_df['ratio_number_order_offline'], label='Offline', bottom=ratio_df['ratio_number_order_online'])
    plt.title('Order Ratio by Channel')
    plt.xticks(rotation=45)
    plt.legend()

    plt.tight_layout()
    # save figure
    fig.savefig(os.path.join(PROJECT_DIR, 'report.png'))
    print('Report has been saved to report.png')

if __name__ == "__main__":
    pass