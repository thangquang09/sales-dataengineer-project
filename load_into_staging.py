from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy import text
from urllib.parse import quote_plus
from datetime import datetime
from function_for_ETL import upsert_data
import os

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

def load_data_to_staging(schema, table, mysql_session, postgress_session, batch_size=10000):
    mysql_columns = [col[0].lower() for col in mysql_session.execute(text(f'SHOW COLUMNS FROM {schema}_{table}')).fetchall()]
    mysql_columns.remove('checkstatus')
    mysql_data = mysql_session.execute(text(f'SELECT * FROM {schema}_{table} WHERE checkStatus != 1')).fetchall()

    if not mysql_data:
        print(f'{schema}_{table} is up to date')
        return

    new_columns = ['insertdate', 'updatedate', 'sourcesystem', 'isprocessed']
    default_values = [datetime.now().strftime('%Y-%m-%d'), None, 'MySQL', False]
    mysql_columns.extend(new_columns)

    data_to_upsert = []
    for row in mysql_data:
        row_with_default = list(row[:-1]) + default_values # remove checkStatus
        full_data = dict(zip(mysql_columns, row_with_default))  
        data_to_upsert.append(full_data)

        # call upsert_data when data_to_upsert has enough
        if len(data_to_upsert) >= batch_size:
            upsert_data(postgres_engine, postgress_session, table, schema, data_to_upsert, mysql_columns[0])
            data_to_upsert = []  # Reset list to upsert
    # insert the remaining data
    if data_to_upsert:
        upsert_data(postgres_engine, postgress_session, table, schema, data_to_upsert, mysql_columns[0])
    print(f'Upserted {len(mysql_data)} records from {schema}_{table} to {schema}_{table} in PostgreSQL')
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

batch_size = 10000  # the batch size for upserting data
print('Start loading data to staging...')
print('Batch size:', batch_size)
print('----------------------------------')
for schema in EDR.keys():
    for table in EDR[schema]:
        print(f'Loading {schema}_{table} to staging...')
        load_data_to_staging(schema, table, mysql_session, postgress_session, batch_size)
        
postgress_session.commit()
mysql_session.close()
postgress_session.close()
