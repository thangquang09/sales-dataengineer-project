import os
from urllib.parse import quote_plus
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker 

mysql_conf = {
    'user': 'thangquang',
    'password': 'thangquang',
    'host': 'mysql_container',
    'database': 'sales_db',
    'port': '3306',
}

staging_conf = {
    'user': 'thangquang',
    'password': 'thangquang',
    'host': 'postgres_container',
    'database': 'sales_dw_staging',
    'port': '5432',
}

dw_config = {
    'user': 'thangquang',
    'password': 'thangquang',
    'host': 'postgres_container',
    'database': 'sales_dw',
    'port': '5432',
}

BATCH_SIZE = 5000

def quote_config_value(config):
    for key, value in config.items():
        config[key] = quote_plus(value)
    return config

def get_engine(config, rdbms):
    if rdbms == 'mysql':
        return create_engine(f'mysql+mysqlconnector://{config["user"]}:{config["password"]}@{config["host"]}:{config["port"]}/{config["database"]}')
    elif rdbms == 'postgresql':
        return create_engine(f'postgresql+psycopg2://{config["user"]}:{config["password"]}@{config["host"]}:{config["port"]}/{config["database"]}')
    else:
        print('Invalid RDBMS')
        return None


def create_engines():
    mysql_engine = get_engine(
        quote_config_value(mysql_conf),
        "mysql"
    )
    print(f"Connected to {mysql_engine.dialect.name}")
    staging_engine = get_engine(
        quote_config_value(staging_conf),
        "postgresql"
    )
    print(f"Connected to {staging_engine.dialect.name} staging")
    dw_engine = get_engine(
        quote_config_value(dw_config),
        "postgresql"
    )
    print(f"Connected to {staging_engine.dialect.name} warehouse")
    return mysql_engine, staging_engine, dw_engine

def create_sessions(mysql_engine, staging_engine, dw_engine):
    mysql_session = sessionmaker(bind=mysql_engine)()
    staging_session = sessionmaker(bind=staging_engine)()
    dw_session = sessionmaker(bind=dw_engine)()
    return mysql_session, staging_session, dw_session