import mysql.connector
import psycopg2
import pandas as pd
from datetime import datetime
import os

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
os.environ['PGPASSWORD'] = '090924'
# Config MySQL
mysql_config = {
    'user': 'thangquang',
    'password': 'Th@ngdeptrai147',
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


def connect_to_mysql(config):
    try:
        conn = mysql.connector.connect(**config)
        print('Connected to MySQL successfully')
        return conn
    except Exception as e:
        print(f'Error connecting to MySQL: {e}')
        return None

def connect_to_psql(config):
    try:
        conn = psycopg2.connect(**config)
        print('Connected to PostgreSQL successfully')
        return conn
    except Exception as e:
        print(f'Error connecting to PostgreSQL: {e}')
        return None

def get_id_column_mysql(table_name, conn):
    try:
        cursor = conn.cursor()
        query = f"""
        SELECT COLUMN_NAME 
        FROM information_schema.COLUMNS 
        WHERE TABLE_SCHEMA = '{mysql_config['database']}' 
        AND TABLE_NAME = '{table_name}' 
        AND COLUMN_KEY = 'PRI'
        """
        cursor.execute(query)
        id_column = cursor.fetchone()[0]
        return id_column
    except Exception as e:
        print(f"Error when get ID from MySQL: {e}")
        return None

def get_id_column_postgres(table_name, conn):
    try:
        cursor = conn.cursor()
        query = f"""
        SELECT column_name 
        FROM information_schema.key_column_usage 
        WHERE table_name = '{table_name}' 
        AND constraint_name LIKE '%pkey'
        """
        cursor.execute(query)
        id_column = cursor.fetchone()[0]
        return id_column
    except Exception as e:
        print(f"Error when get ID from PostgreSQL: {e}")
        return None

def get_newest_id(rdbms, conn, table_name, schema=None):
    try:
        if rdbms == 'mysql':
            id_column = get_id_column_mysql(f"{schema}_{table_name}", conn)
            cursor = conn.cursor()
            query = f"SELECT COALESCE(MAX({id_column}), 0) FROM {schema}_{table_name}"
        elif rdbms == 'psql':
            id_column = get_id_column_postgres(table_name, conn)
            cursor = conn.cursor()
            query = f"SELECT COALESCE(MAX({id_column}), 0) FROM {schema}.{table_name}"
        cursor.execute(query)
        newest_id = cursor.fetchone()[0]
        cursor.close()
        return newest_id
    except Exception as e:
        print(f"Error when get newest ID: {e}")
        return None

def fetch_data_from_mysql(conn, query):
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        data = cursor.fetchall()
        columns = [i[0] for i in cursor.description]
        df = pd.DataFrame(data, columns=columns)
        return df
    except Exception as e:
        print(f"Errow when fetch data from mysql: {e}")
        return None

def load_data_to_psql(mysql_conn, psql_conn, EDR):
    try:
        for schema in EDR.keys():
            for table in EDR[schema]:
                mysql_table = f"{schema}_{table}"
                mysql_id = get_id_column_mysql(mysql_table, mysql_conn)
                mysql_max_id = get_newest_id('mysql', mysql_conn, table, schema)
                psql_id = get_id_column_postgres(table, psql_conn)
                psql_max_id = get_newest_id('psql', psql_conn, table, schema)
                if mysql_max_id == psql_max_id:
                    print(f"Data in {schema}.{table} is up-to-date")
                    continue
                # take data from MySQL where id > psql_max_id
                query = f"SELECT * FROM {mysql_table} WHERE {mysql_id} > {psql_max_id}"
                df = fetch_data_from_mysql(mysql_conn, query)

                # handle control columns
                df['insertDate'] = datetime.today().strftime("%Y-%m-%d")
                df['updateDate'] = datetime.today().strftime("%Y-%m-%d")
                df['sourceSystem'] = 'MySQL'
                df['isProcessed'] = 0
                df['batchId'] = None

                if schema == 'sales' and table == 'order':
                    # astype to int if not null
                    df['source_online_id'] = df['source_online_id'].astype('Int64')

                # load data to PostgreSQL
                df.to_csv(f"daily_csv/{schema}_{table}.csv", index=False)
                cursor = psql_conn.cursor()
                csv_path = os.path.join(CURRENT_DIR, f"daily_csv/{schema}_{table}.csv")
                copy_command=f"COPY {schema}.{table} FROM '{csv_path}' DELIMITER ',' CSV HEADER"
                cursor.execute(copy_command)
                psql_conn.commit()
                cursor.close()
                print(f"Data from {mysql_table} loaded to {schema}.{table} successfully")
    except Exception as e:
        print(f"Error when load data to PostgreSQL: {e}")


mysql_conn = connect_to_mysql(mysql_config)
psql_conn = connect_to_psql(psql_config)


load_data_to_psql(mysql_conn, psql_conn, EDR)


if mysql_conn is not None:
    mysql_conn.close()
    print("MySQL connection closed.")

if psql_conn is not None:
    psql_conn.close()
    print("PostgreSQL connection closed.")
