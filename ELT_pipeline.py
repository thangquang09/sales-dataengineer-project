from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from function_for_ETL import *
from gererate_daily_data import generate_data
from load_into_staging import EDR, load_to_staging
from load_into_dw import load_to_dw


# Config
mysql_config = get_config('mysql_conf.txt')
staging_config = get_config('staging_conf.txt')
dw_config = get_config('dw_conf.txt')

# creata engine
mysql_engine = create_engine(f'mysql+mysqlconnector://{mysql_config["user"]}:{mysql_config["password"]}@{mysql_config["host"]}/{mysql_config["database"]}')
staging_engine = create_engine(f'postgresql+psycopg2://{staging_config["user"]}:{staging_config["password"]}@{staging_config["host"]}:{staging_config["port"]}/{staging_config["database"]}')
dw_engine = create_engine(f'postgresql+psycopg2://{dw_config["user"]}:{dw_config["password"]}@{dw_config["host"]}:{dw_config["port"]}/{dw_config["database"]}')

try:
    print("Connecting to MySQL, PostgreSQL and DataWarehouse")
    mysql_session = sessionmaker(bind=mysql_engine)()
    staging_session = sessionmaker(bind=staging_engine)()
    dw_session = sessionmaker(bind=dw_engine)()
    print('Connected to MySQL, PostgreSQL and DataWarehouse successfully')
# ---- generating data in mysql ----
    generate_data(mysql_session, 10, 30, 300, 400)
    
# ---- load from mysql to postgresql staging ----
    load_to_staging(EDR, mysql_engine, mysql_session, staging_engine, staging_session)

# ---- load from staging to dw ----
    load_to_dw(staging_engine, staging_session, dw_engine, dw_session)
except Exception as e:
    print(f'Error: {e}')
    exit(1)
finally:
    mysql_session.close()
    staging_session.close()