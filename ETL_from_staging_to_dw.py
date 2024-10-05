import psycopg2
import pandas as pd
from datetime import datetime
import os
from sqlalchemy import create_engine, update, Table, MetaData
from sqlalchemy.orm import sessionmaker
from function_for_ETL import *

staging_config = {
    'user': 'postgres',
    'password': '090924',
    'host': 'localhost',
    'database': 'sales_dw_staging',
    'port': '5432'
}

dw_config = {
    'user': 'postgres',
    'password': '090924',
    'host': 'localhost',
    'database': 'sales_dw',
    'port': '5432'
}

def createEngine(config):
    try:
        engine = create_engine(f'postgresql+psycopg2://{config["user"]}:{config["password"]}@{config["host"]}:{config["port"]}/{config["database"]}')
        print('Connected to PostgreSQL successfully')
        return engine
    except Exception as e:
        print(f'Error connecting to PostgreSQL: {e}')
        return None


staging_engine = createEngine(staging_config)
dw_engine = createEngine(dw_config)
staging_session = sessionmaker(bind=staging_engine)()
dw_session = sessionmaker(bind=dw_engine)()

staging_connect = (staging_engine, staging_session)
dw_connect = (dw_engine, dw_session)

## FOR SALES SCHEMA
load_dim_city(staging_connect, dw_connect)

load_dim_store(staging_connect, dw_connect)

load_dim_employee(staging_connect, dw_connect)

load_dim_source_online(staging_connect, dw_connect)

load_dim_customer(staging_connect, dw_connect)

load_dim_year(staging_connect, dw_connect)

load_dim_quarter((dw_engine, dw_session))

load_dim_month(staging_connect, dw_connect)

load_dim_date(staging_connect, dw_connect)

load_fact_sales_order(staging_connect, dw_connect)

# FOR PRODUCTION SCHEMA

load_dim_brand(staging_connect, dw_connect)

load_dim_category(staging_connect, dw_connect)

load_dim_product(staging_connect, dw_connect)


staging_session.close()
dw_session.close()
