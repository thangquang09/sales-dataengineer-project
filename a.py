from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy import text
from urllib.parse import quote_plus
from sqlalchemy import Table, MetaData
from sqlalchemy.dialects.postgresql import insert as pg_insert
from datetime import datetime
import os
import pandas as pd
from function_for_ETL import upsert_data


CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))

# Config MySQL
mysql_config = {
    'user': 'thangquang',
    'password': quote_plus('Th@ngdeptrai147'),
    'host': 'localhost',
    'database': 'sales_db'
}

# Config PostgreSQL
psql_config = {
    'user': 'postgres',
    'password': '090924',
    'host': 'localhost',
    'database': 'sales_dw_staging',
    'port': '5432'
}

EDR = {
    "production": [
        "brand",
        "category",
        "product"
    ],
    "sales": [
        "city",
        "customer",
        "store",
        "employee",
        "source_online",
        "order",
        "order_detail",
    ]
}


def load_data_to_staging(schema, table, mysql_session, postgress_session, mysql_engine, postgres_engine):
    # Đọc dữ liệu từ MySQL vào DataFrame
    query = f'SELECT * FROM {schema}_{table} WHERE checkStatus != 1'
    df = pd.read_sql(query, mysql_engine)

    if df.empty:
        print(f'{schema}_{table} is up to date')
        return
    # Loại bỏ cột 'checkstatus'
    df.columns = [col.lower() for col in df.columns]
    df = df.drop('checkstatus', axis=1)
    
    # Thêm các cột mới
    df['insertdate'] = datetime.now().strftime('%Y-%m-%d')
    df['updatedate'] = None
    df['sourcesystem'] = 'MySQL'
    df['isprocessed'] = False

    df = df.where(pd.notnull(df), None)
    
    conflict_column = df.columns[0]
    
    data_to_upsert = df.to_dict('records')
    

    for i in range(0, len(data_to_upsert), batch_size):
        batch = data_to_upsert[i:i+batch_size]
        upsert_data(postgres_engine, postgress_session, table, schema, batch, conflict_column)
    
    print(f'Upserted {len(df)} records from {schema}_{table} to {schema}_{table} in PostgreSQL')

    update_status_mysql = text(f'UPDATE {schema}_{table} SET checkStatus = 1 WHERE checkStatus != 1')
    mysql_session.execute(update_status_mysql)
    mysql_session.commit()
    print(f'Updated checkStatus for {schema}_{table} in MySQL')

# Connect to MySQL and PostgreSQL
try:
    mysql_engine = create_engine(f'mysql+mysqlconnector://{mysql_config["user"]}:{mysql_config["password"]}@{mysql_config["host"]}/{mysql_config["database"]}')
    postgres_engine = create_engine(f'postgresql+psycopg2://{psql_config["user"]}:{psql_config["password"]}@{psql_config["host"]}:{psql_config["port"]}/{psql_config["database"]}')
    mysql_session = sessionmaker(bind=mysql_engine)()
    postgress_session = sessionmaker(bind=postgres_engine)()
    print('Connected to MySQL and PostgreSQL successfully')
except Exception as e:
    print(f'Error connecting to database: {e}')
    exit(1)

batch_size = 1  # the batch size for upserting data
for schema in EDR.keys():
    for table in EDR[schema]:
        load_data_to_staging(schema, table, mysql_session, postgress_session, mysql_engine, postgres_engine)
        
postgress_session.commit()
mysql_session.close()
postgress_session.close()
