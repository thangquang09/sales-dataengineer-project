from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta
from setting import *
from ETL import generate_daily_data, load_into_staging, load_into_dw, setup_mysql_database, setup_postgres_database, setup_dw_database, truncate_staging

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    'start_date': datetime(2024, 10, 25),
}

# Create Connection
mysql_engine, staging_engine, dw_engine = create_engines()
mysql_session, staging_session, dw_session = create_sessions(mysql_engine, staging_engine, dw_engine)
# Set up databases
setup_mysql_database(mysql_engine)
setup_postgres_database(staging_engine)
setup_dw_database(dw_engine)
    
def close_database(sessions):
    try:
        for session in sessions:
            session.close()
    except Exception as e:
        return

with DAG('ETL_sales_project', default_args=default_args, schedule_interval='@daily', catchup=False) as dag:
    # generate daily data
    t1 = PythonOperator(
        task_id='generate_daily_data',
        python_callable=generate_daily_data,
        op_kwargs={'mysql_session': mysql_session},
    )

    # load into staging
    t2 = PythonOperator(
        task_id='load_into_staging',
        python_callable=load_into_staging,
        op_kwargs={'mysql_session': mysql_session, 'staging_session':staging_session}
    )
    # load to dw
    t3 = PythonOperator(
        task_id='load_into_dw',
        python_callable=load_into_dw,
        op_kwargs={'staging_session': staging_session, 'dw_session': dw_session}
    )
    # truncate staging
    t4 = PythonOperator(
        task_id='truncate_staging',
        python_callable=truncate_staging,
        op_kwargs={'staging_session': staging_session}
    )
    # close database
    t5 = PythonOperator(
        task_id='close_database',
        python_callable=close_database,
        op_kwargs={'sessions': [mysql_session, staging_session, dw_session]},
    )

    t1 >> t2 >> t3 >> t4 >> t5