from sqlalchemy import text
from sqlalchemy.orm import sessionmaker
from function_for_ETL import *

def generate_data(mysql_session, min_cus=10, max_cus=30, min_order=500, max_order=1000):
    print(f"Generating data with {min_cus} to {max_cus} customers and {min_order} to {max_order} orders")
    print('----------------------------------')
    query = text(f"CALL generate_daily_data({min_cus}, {max_cus}, {min_order}, {max_order})")
    mysql_session.execute(query)
    mysql_session.commit()
    print("Generated data successfully")
    print('----------------------------------')
    
if __name__ == '__main__':
    mysql_config = get_config('mysql_conf.txt')
    mysql_engine = get_engine(mysql_config, 'mysql')
    mysql_session = sessionmaker(bind=mysql_engine)()
    generate_data(mysql_session, 10, 30, 300, 400)
    mysql_session.close()