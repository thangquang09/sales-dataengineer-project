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




def load_table_to_staging(schema, table, mysql_engine, mysql_session, postgres_engine, postgress_session, batch_size=1000):
    query = text(f'SELECT * FROM {schema}_{table} WHERE checkStatus != 1')
    df = pd.read_sql(query, mysql_engine)

    df.columns = [col.lower() for col in df.columns]
    df.drop(columns=['checkstatus'], inplace=True) # remove checkStatus column

    new_columns = ['insertdate', 'updatedate', 'sourcesystem', 'isprocessed']
    default_values = [datetime.now().strftime('%Y-%m-%d'), None, 'MySQL', False]

    for col, val in zip(new_columns, default_values):
        df[col] = val

    if 'source_online_id' in df.columns:
        df.fillna({'source_online_id': 1000}, inplace=True) # 1000 is offline

    load_with_batch(postgres_engine, postgress_session, table, schema, df, batch_size)
    update_stmt = text(f'UPDATE {schema}_{table} SET checkStatus = 1 WHERE checkStatus != 1')
    mysql_session.execute(update_stmt)
    mysql_session.commit()

    

def load_to_staging(EDR, mysql_engine, mysql_session, postgres_engine, postgress_session, batch_size=1000):
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

    batch_size = 1000  # the batch size for upserting data
    load_to_staging(EDR, mysql_engine, mysql_session, postgres_engine, postgress_session, batch_size)
            
    postgress_session.commit()
    mysql_session.close()
    postgress_session.close()
