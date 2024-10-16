from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta
import os

# for the ETL process
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from function_for_ETL import *
from load_into_staging import EDR, load_to_staging
from load_into_dw import load_to_dw


# define the default arguments
default_args = {
    'owner': 'thangquang',
    'start_date': datetime(2024, 10, 15),
    'email': 'thangquangly0909@gmail.com',
    'email_on_failure': True,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=2)
}

# define the DAG
dag = DAG(
    dag_id='ETL-sales-project',
    start_date=datetime(2024, 10, 15),
    schedule=timedelta(days=1),
    default_args=default_args,
    description='ETL pipeline for sales data',
)


def create_engines():
    # Create engines and sessions
    mysql_config = get_config('mysql_conf.txt')
    staging_config = get_config('staging_conf.txt')
    dw_config = get_config('dw_conf.txt')
    
    mysql_engine = create_engine(f'mysql+mysqlconnector://{mysql_config["user"]}:{mysql_config["password"]}@mysql_container:{mysql_config["port"]}/{mysql_config["database"]}')
    staging_engine = create_engine(f'postgresql+psycopg2://{staging_config["user"]}:{staging_config["password"]}@postgres_container:{staging_config["port"]}/{staging_config["database"]}')
    dw_engine = create_engine(f'postgresql+psycopg2://{dw_config["user"]}:{dw_config["password"]}@postgres_container:{dw_config["port"]}/{dw_config["database"]}')  

    res = {
        "mysql_engine": mysql_engine,
        "staging_engine": staging_engine,
        "dw_engine": dw_engine,
    }
    return res

def create_session(engine):
    return sessionmaker(bind=engine)()

def end_session(sessions):
    for ses in sessions:
        if ses:
            ses.commit()
            ses.close()

def generate_data_task():
    try:
        res = create_engines()
        mysql_session = create_session(res['mysql_engine'])
        generate_data(mysql_session)
    finally:
        end_session([mysql_session])

def load_to_staging_task():
    try:
        res = create_engines()
        mysql_session = create_session(res['mysql_engine'])
        staging_session = create_session(res['staging_engine'])
        # load to staging
        load_to_staging(EDR, res['mysql_engine'], mysql_session, res['staging_engine'], staging_session)
    finally:
        end_session([mysql_session, staging_session])


def load_to_dw_task():
    try:
        res = create_engines()
        # Load to data warehouse
        staging_session = create_session(res['staging_engine'])
        dw_session = create_session(res['dw_engine'])
        load_to_dw(res['staging_engine'], staging_session, res['dw_engine'], dw_session)
    finally:
        end_session([staging_session, dw_session])

def truncate_staging_task():
    try:
        res = create_engines()
        staging_session = create_session(res['staging_engine'])
        truncate_staging(staging_session)
    finally:
        end_session([staging_session])

def refresh_view_task():
    try:
        res = create_engines()
        dw_session = create_session(res['dw_engine'])
        refresh_view(dw_session)
    finally:
        end_session([dw_session])

task1 = PythonOperator(
    task_id="generate_data_from_mysql",
    python_callable=generate_data_task,
    dag=dag
)

task2 = PythonOperator(
    task_id="load_to_staging_layer",
    python_callable=load_to_staging_task,
    dag=dag
)

task3 = PythonOperator(
    task_id="load_to_dw_layer",
    python_callable=load_to_dw_task,
    dag=dag
)

task4 = PythonOperator(
    task_id="truncate_staging_layer",
    python_callable=truncate_staging_task,
    dag=dag
)

task5 = PythonOperator(
    task_id="refresh_view_in_dw",
    python_callable=refresh_view_task,
    dag=dag
)

task1 >> task2 >> task3 >> [task4, task5]