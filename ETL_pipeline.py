from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from function_for_ETL import *
from gererate_daily_data import generate_data
from load_into_staging import EDR, load_to_staging
from load_into_dw import load_to_dw

if __name__ == '__main__':
    # Config
    mysql_config = get_config('mysql_conf.txt')
    staging_config = get_config('staging_conf.txt')
    dw_config = get_config('dw_conf.txt')

    # creata engine
    mysql_engine = get_engine(mysql_config, 'mysql')
    staging_engine = get_engine(staging_config, 'postgresql')
    dw_engine = get_engine(dw_config, 'postgresql')

    try:
        print("Connecting to MySQL, PostgreSQL and DataWarehouse")
        mysql_session = sessionmaker(bind=mysql_engine)()
        staging_session = sessionmaker(bind=staging_engine)()
        dw_session = sessionmaker(bind=dw_engine)()
        print('Connected to MySQL, PostgreSQL and DataWarehouse successfully')
    # ---- generating data in mysql ----
        generate_data(mysql_session, 10, 30, 300, 400)
        
    # # ---- load from mysql to postgresql staging ----
        load_to_staging(EDR, mysql_engine, mysql_session, staging_engine, staging_session)

    # # ---- load from staging to dw ----
        load_to_dw(staging_engine, staging_session, dw_engine, dw_session)

    # # ---- truncate data in staging ----
        truncate_staging(staging_session)
    
    # ---- refresh view in dw ----

        refresh_view(dw_session)
    # ---- end ----
        print('ETL pipeline completed')
        print('----------------------------------')
    except Exception as e:
        print(f'Error: {e}')
        exit(1)
    finally:
        mysql_session.close()
        staging_session.close()