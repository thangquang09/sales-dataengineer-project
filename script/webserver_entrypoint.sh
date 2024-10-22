#!/bin/bash

set -e

# Check if Python modules were installed
if [ -e "/opt/airflow/requirements.txt" ]; then
    if [ ! -f "/opt/airflow/.requirements_installed" ]; then
        echo "Installing Python dependencies from requirements.txt"
        pip install --user -r /opt/airflow/requirements.txt
        touch /opt/airflow/.requirements_installed
    else
        echo "Python dependencies are already installed."
    fi
fi

# Check and initialize database and users for Airflow
if [ ! -f "/opt/airflow/airflow.db" ]; then
    airflow db init && \
    airflow users create \
        --username admin \
        --firstname admin \
        --lastname admin \
        --role Admin \
        --email admin@example.com \
        --password admin
fi

# Upgrade Airflow database
airflow db upgrade

# Start Airflow webserver
exec airflow webserver
