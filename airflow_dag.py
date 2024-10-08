from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta
import os

# for the ETL process
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from function_for_ETL import *
from gererate_daily_data import generate_data
from load_into_staging import EDR, load_to_staging
from load_into_dw import load_to_dw


# define the default arguments
default_args = {
    'owner': 'thangquang',
    'start_date': datetime(2024, 10, 5),
    'email': 'thangquangly0909@gmail.com',
    'email_on_failure': True,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=2)
}

# define the DAG
dag = DAG(
    dag_id='ETL-sales-project',
    schedule_interval=timedelta(days=1),
    default_args=default_args,
    description='ETL pipeline for sales data',
)

# Task 1: generate data
def generate_data_task_func():
    mysql_config = get_config(f'{PROJECT_FOLDER}/mysql_conf.txt')
    mysql_engine = get_engine(mysql_config, 'mysql')
    mysql_session = sessionmaker(bind=mysql_engine)()
    generate_data(mysql_session, 10, 30, 300, 400)
    mysql_session.close()

def load_to_staging_task_func():
    mysql_config = get_config(f'{PROJECT_FOLDER}/mysql_conf.txt')
    staging_config = get_config(f'{PROJECT_FOLDER}/staging_conf.txt')
    mysql_engine = get_engine(mysql_config, 'mysql')
    staging_engine = get_engine(staging_config, 'postgresql')
    mysql_session = sessionmaker(bind=mysql_engine)()
    staging_session = sessionmaker(bind=staging_engine)()
    load_to_staging(EDR, mysql_engine, mysql_session, staging_engine, staging_session)
    mysql_session.close()
    staging_session.close()

def load_to_dw_task_func():
    staging_config = get_config(f'{PROJECT_FOLDER}/staging_conf.txt')
    dw_config = get_config(f'{PROJECT_FOLDER}/dw_conf.txt')
    staging_engine = get_engine(staging_config, 'postgresql')
    dw_engine = get_engine(dw_config, 'postgresql')
    staging_session = sessionmaker(bind=staging_engine)()
    dw_session = sessionmaker(bind=dw_engine)()
    load_to_dw(staging_engine, staging_session, dw_engine, dw_session)
    staging_session.close()
    dw_session.close()

def truncate_staging_task_func():
    staging_config = get_config(f'{PROJECT_FOLDER}/staging_conf.txt')
    staging_engine = get_engine(staging_config, 'postgresql')
    staging_session = sessionmaker(bind=staging_engine)()
    truncate_staging(staging_session)
    staging_session.close()

def refresh_view_task_func():
    dw_config = get_config(f'{PROJECT_FOLDER}/dw_conf.txt')
    dw_engine = get_engine(dw_config, 'postgresql')
    dw_session = sessionmaker(bind=dw_engine)()
    refresh_view(dw_session)
    dw_session.close()

# define the tasks

generate_data_task = PythonOperator(
    task_id='generate_data',
    python_callable=generate_data_task_func,
    dag=dag
)

load_to_staging_task = PythonOperator(
    task_id='load_to_staging',
    python_callable=load_to_staging_task_func,
    dag=dag
)

load_to_dw_task = PythonOperator(
    task_id='load_to_dw',
    python_callable=load_to_dw_task_func,
    dag=dag
)

truncate_staging_task = PythonOperator(
    task_id='truncate_staging',
    python_callable=truncate_staging_task_func,
    dag=dag
)

refresh_view_task = PythonOperator(
    task_id='refresh_view',
    python_callable=refresh_view_task_func,
    dag=dag
)

# set the task dependencies
generate_data_task >> load_to_staging_task >> load_to_dw_task >> truncate_staging_task >> refresh_view_task
