import mysql.connector
import os

mysql_config = {
    'user': 'thangquang',
    'password': 'Th@ngdeptrai147',
    'host': 'localhost',
    'database': 'sales_db'
}

def connect_to_mysql(config):
    try:
        conn = mysql.connector.connect(**config)
        print('Connected to MySQL successfully')
        return conn
    except Exception as e:
        print(f'Error connecting to MySQL: {e}')
        return None

conn = connect_to_mysql(mysql_config)
cursor = conn.cursor()
try:
    print("Generating data...")
    cursor.execute(f'CALL generate_daily_data(8, 17, 300, 600)')
    conn.commit()
    cursor.close()
    conn.close()
    print('Data generated successfully')
except Exception as e:
    print(f'Error generating data: {e}')
    cursor.close()
    conn.close()

    