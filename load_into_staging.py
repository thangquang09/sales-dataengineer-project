from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy import text
from urllib.parse import quote_plus
from datetime import datetime
from function_for_ETL import *

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




def load_table_to_staging(schema, table, mysql_engine, mysql_session, postgres_engine, postgress_session, batch_size=10000):
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

def load_to_staging(EDR, mysql_engine, mysql_session, postgres_engine, postgress_session, batch_size=10000):
    print('Start loading data to staging...')
    print('Batch size:', batch_size)
    print('----------------------------------')
    for schema in EDR.keys():
        for table in EDR[schema]:
            print(f'Loading {schema}_{table} to staging...')
            load_table_to_staging(schema, table, mysql_engine, mysql_session, postgres_engine, postgress_session, batch_size)
            
    postgress_session.commit()
    mysql_session.close()
    postgress_session.close()
    print('Loading data to staging successfully')
    print('----------------------------------')

if __name__ == '__main__':
    # Connect to MySQL and PostgreSQL
    try:
        mysql_config = get_config('mysql_conf.txt')
        psql_config = get_config('staging_conf.txt')
        mysql_engine = get_engine(mysql_config, 'mysql')
        postgres_engine = get_engine(psql_config, 'postgresql')
        mysql_session = sessionmaker(bind=mysql_engine)()
        postgress_session = sessionmaker(bind=postgres_engine)()
        print('Connected to MySQL and PostgreSQL successfully')
    except Exception as e:
        print(f'Error connecting to database: {e}')
        exit(1)

    batch_size = 10000  # the batch size for upserting data
    load_to_staging(EDR, mysql_engine, mysql_session, postgres_engine, postgress_session, batch_size)
            
    postgress_session.commit()
    mysql_session.close()
    postgress_session.close()
