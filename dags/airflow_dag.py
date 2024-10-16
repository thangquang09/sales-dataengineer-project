from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import os
import logging

# Your import statements for ETL functions
from function_for_ETL import *
from load_into_staging import EDR, load_to_staging
from load_into_dw import load_to_dw

# Define the default arguments
default_args = {
    'owner': 'thangquang',
    'start_date': datetime(2024, 10, 15),
    'email': 'thangquangly0909@gmail.com',
    'email_on_failure': True,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=2)
}

# Define the DAG
dag = DAG(
    dag_id='ETL-sales-project',
    start_date=datetime(2024, 10, 15),
    schedule=timedelta(days=1),
    default_args=default_args,
    description='ETL pipeline for sales data',
)

# Create engines and sessions at the DAG level
mysql_config = get_config('mysql_conf.txt')
staging_config = get_config('staging_conf.txt')
dw_config = get_config('dw_conf.txt')

mysql_engine = create_engine(f'mysql+mysqlconnector://{mysql_config["user"]}:{mysql_config["password"]}@mysql_container:{mysql_config["port"]}/{mysql_config["database"]}')
staging_engine = create_engine(f'postgresql+psycopg2://{staging_config["user"]}:{staging_config["password"]}@postgres_container:{staging_config["port"]}/{staging_config["database"]}')
dw_engine = create_engine(f'postgresql+psycopg2://{dw_config["user"]}:{dw_config["password"]}@postgres_container:{dw_config["port"]}/{dw_config["database"]}')

mysql_session = sessionmaker(bind=mysql_engine)()
staging_session = sessionmaker(bind=staging_engine)()
dw_session = sessionmaker(bind=dw_engine)()

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def generate_data_task():
    logger.info("Starting to generate data from MySQL...")
    generate_data(mysql_session)
    logger.info("Data generation completed.")

def load_to_staging_task():
    logger.info("Loading data to staging...")
    load_to_staging(EDR, mysql_engine, mysql_session, staging_engine, staging_session)
    logger.info("Data loaded to staging successfully.")

def load_to_dw_task():
    logger.info("Loading data to data warehouse...")
    load_to_dw(staging_engine, staging_session, dw_engine, dw_session)
    logger.info("Data loaded to data warehouse successfully.")

def truncate_staging_task():
    logger.info("Truncating staging data...")
    truncate_staging(staging_session)
    logger.info("Staging data truncated successfully.")

def refresh_view_task():
    logger.info("Refreshing view in data warehouse...")
    refresh_view(dw_session)
    logger.info("View refreshed successfully.")

def export_csv_task():
    logger.info("Exporting CSV...")
    export_csv(dw_engine)
    logger.info("CSV export completed.")

def end_sessions():
    logger.info("Closing all database sessions...")
    sessions = [mysql_session, staging_session, dw_session]
    for ses in sessions:
        if ses:
            ses.commit()
            ses.close()
    logger.info("All sessions closed.")

# Define the tasks
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

task6 = PythonOperator(
    task_id="end_sessions",
    python_callable=end_sessions,
    dag=dag,
    trigger_rule='all_done'  # This ensures task 7 runs regardless of previous task success/failure
)

# Set task dependencies
task1 >> task2 >> task3 >> [task4, task5] >> task6
