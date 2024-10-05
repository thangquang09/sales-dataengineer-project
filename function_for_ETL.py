from sqlalchemy import *
from sqlalchemy.dialects.postgresql import insert as pg_insert
import pandas as pd
from datetime import datetime
import random

month_name = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

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

    # Tạo statement cho insert
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
    metadata = MetaData()
    table = Table(table_name, metadata, autoload_with=engine, schema=schema)

    for i in range(0, len(data_list), batch_size):
        data = data_list[i: i + batch_size]
        upsert_data(engine, session, table_name, schema, data, conflict_column)
    session.commit()


def load_dim_city(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.city'
    table_out = 'dim_city'
    columns = ",".join(['city_id', 'name'])
    query = text(f'SELECT {columns} FROM {table_in} WHERE isprocessed = false')
    df = pd.read_sql(query, staging_engine)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    conflict_column = df.columns[0]
    data_list = df.to_dict('records')
    load_with_batch(dw_engine, dw_session, table_out, 'public', data_list, conflict_column=conflict_column)
    update_isprocessed(staging_session, table_in)
    print(f'Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL')


def load_dim_store(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.store'
    table_out = 'dim_store'
    columns = ",".join(['store_id', 'name', 'city_id'])
    query = text(f'SELECT {columns} FROM {table_in} WHERE isprocessed = false')
    df = pd.read_sql(query, staging_engine)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    conflict_column = df.columns[0]
    data_list = df.to_dict('records')
    load_with_batch(dw_engine, dw_session, table_out, 'public', data_list, conflict_column=conflict_column)
    update_isprocessed(staging_session, table_in)
    print(f'Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL')

def load_dim_employee(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.employee'
    table_out = 'dim_employee'
    columns = ",".join(['employee_id', 'name', 'store_id', 'dob', 'identitynumber'])
    query = text(f'SELECT {columns} FROM {table_in} WHERE isprocessed = false')
    df = pd.read_sql(query, staging_engine)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    # handle columns if it null
    dob_handler = lambda x: generate_date(1980, 2000) if pd.isnull(x) else x
    identity_handler = lambda x: str(random.randint(100000, 999999)) if pd.isnull(x) else x
    df['dob'] = df['dob'].apply(dob_handler)
    df['identitynumber'] = df['identitynumber'].apply(identity_handler)
    conflict_column = df.columns[0]
    data_list = df.to_dict('records')
    load_with_batch(dw_engine, dw_session, table_out, 'public', data_list, conflict_column=conflict_column)
    update_isprocessed(staging_session, table_in)
    print(f'Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL')


def load_dim_customer(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.customer'
    table_out = 'dim_customer'
    columns = ",".join(['customer_id', 'name', 'email'])
    query = text(f'SELECT {columns} FROM {table_in} WHERE isprocessed = false')
    df = pd.read_sql(query, staging_engine)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    # handle columns if it null
    conflict_column = df.columns[0]
    data_list = df.to_dict('records')
    load_with_batch(dw_engine, dw_session, table_out, 'public', data_list, conflict_column=conflict_column)
    update_isprocessed(staging_session, table_in)
    print(f'Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL')

def load_dim_source_online(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.source_online'
    table_out = 'dim_source_online'
    columns = ",".join(['source_online_id', 'link_name'])
    query = text(f'SELECT {columns} FROM {table_in} WHERE isprocessed = false')
    df = pd.read_sql(query, staging_engine)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    conflict_column = df.columns[0]
    data_list = df.to_dict('records')
    load_with_batch(dw_engine, dw_session, table_out, 'public', data_list, conflict_column=conflict_column)
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
    columns = ",".join(["brand_id", "name"])
    query = text(f"SELECT {columns} FROM {table_in} WHERE isprocessed = false")

    staging_df = pd.read_sql(query, staging_engine)
    if staging_df.empty:
        print(f"{table_out} is up to date")
        return

    conflict_column = staging_df.columns[0]
    data_list = staging_df.to_dict('records')
    load_with_batch(dw_engine, dw_session, table_out, data_list=data_list, conflict_column=conflict_column)
    update_isprocessed(staging_session, table_in)
    print(f"Upserted {len(staging_df)} records from {table_in} to {table_out} in PostgreSQL")

def load_dim_category(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'production.category'
    table_out = 'dim_category'
    columns = ",".join(["category_id", "name"])
    query = text(f"SELECT {columns} FROM {table_in} WHERE isprocessed = false")

    staging_df = pd.read_sql(query, staging_engine)
    if staging_df.empty:
        print(f"{table_out} is up to date")
        return

    conflict_column = staging_df.columns[0]
    data_list = staging_df.to_dict('records')
    load_with_batch(dw_engine, dw_session, table_out, data_list=data_list, conflict_column=conflict_column)
    update_isprocessed(staging_session, table_in)
    print(f"Upserted {len(staging_df)} records from {table_in} to {table_out} in PostgreSQL")

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

    query = text(f'SELECT {columns} FROM {table_in} WHERE isprocessed = false')
    df = pd.read_sql(query, staging_engine)
    if df.empty:
        print(f'{table_out} is up to date')
        return
    
    conflict_column = df.columns[0]
    data_list = df.to_dict('records')

    load_with_batch(dw_engine, dw_session, table_out, data_list=data_list, conflict_column=conflict_column, batch_size=10000)
    print(f"Upserted {len(df)} records from {table_in} to {table_out} in PostgreSQL")

def load_fact_sales_order(staging, dw):
    staging_engine, staging_session = staging
    dw_engine, dw_session = dw
    table_in = 'sales.order'
    table_out = 'fact_sales_order'
    with open("load_fact_sales.sql", 'r') as f:
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
    table_out = 'fact_production'

    with open("/home/thangquang/Documents/CODE/sales-dataengineer-project/load_fact_production.sql", "r") as f:
        query = text(f.read())
    df = pd.read_sql(query, staging_engine)
    if df.empty:
        print(f"{table_out} is up to date")
        
    dimdate = pd.read_sql(text("SELECT date_id, date_name FROM dim_date"), dw_engine)
    date_mapping = dimdate.set_index('date_name')['date_id'].to_dict()
    df['date_id'] = df['orderdate'].map(date_mapping)
    df.drop('orderdate', inplace=True, axis=1)
    df.to_sql(table_out, dw_engine, if_exists='append', index=false)
    print(f"Inserted {len(df)} records to {table_out} in PostgreSQL")
