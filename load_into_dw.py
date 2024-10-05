import psycopg2
import pandas as pd
from datetime import datetime
import os
from sqlalchemy import create_engine, update, Table, MetaData
from sqlalchemy.orm import sessionmaker
from function_for_ETL import *

def createEngine(config):
    try:
        engine = create_engine(f'postgresql+psycopg2://{config["user"]}:{config["password"]}@{config["host"]}:{config["port"]}/{config["database"]}')
        print('Connected to PostgreSQL successfully')
        return engine
    except Exception as e:
        print(f'Error connecting to PostgreSQL: {e}')
        return None

def load_to_dw(staging_engine, staging_session, dw_engine, dw_session):
    staging_connect = (staging_engine, staging_session)
    dw_connect = (dw_engine, dw_session)

    print('Loading data to DataWarehouse...')
    # FOR SALES SCHEMA
    load_dim_city(staging_connect, dw_connect)
    load_dim_store(staging_connect, dw_connect)
    load_dim_employee(staging_connect, dw_connect)
    load_dim_source_online(staging_connect, dw_connect)
    load_dim_customer(staging_connect, dw_connect)
    load_dim_year(staging_connect, dw_connect)
    load_dim_quarter(dw_connect)
    load_dim_month(staging_connect, dw_connect)
    load_dim_date(staging_connect, dw_connect)

    # FOR PRODUCTION SCHEMA
    load_dim_brand(staging_connect, dw_connect)
    load_dim_category(staging_connect, dw_connect)
    load_dim_product(staging_connect, dw_connect)

    # FOR FACT
    load_fact_sales_order(staging_connect, dw_connect)
    load_fact_production(staging_connect, dw_connect)

    print('Data loaded successfully')
    print('----------------------------------')

if __name__ == '__main__':
    staging_config = get_config('staging_conf.txt')
    dw_config = get_config('dw_conf.txt')

    staging_engine = createEngine(staging_config)
    dw_engine = createEngine(dw_config)
    staging_session = sessionmaker(bind=staging_engine)()
    dw_session = sessionmaker(bind=dw_engine)()

    staging_connect = (staging_engine, staging_session)
    dw_connect = (dw_engine, dw_session)

    try:
        load_to_dw(staging_engine, staging_session, dw_engine, dw_session)
    except Exception as e:
        print(f'Error: {e}')
        exit(1)
    finally:
        staging_session.close()
        dw_session.close()
