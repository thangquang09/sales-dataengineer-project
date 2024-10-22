#!/bin/bash

set -e

# Kiểm tra nếu thư viện đã được cài đặt
if [ -e "/opt/airflow/requirements.txt" ]; then
    if [ ! -f "/usr/local/lib/python3.10/site-packages/.requirements_installed" ]; then
        echo "Installing Python dependencies from requirements.txt"
        $(command -v pip) install --user -r /opt/airflow/requirements.txt
        # Tạo file flag để ghi nhớ việc đã cài đặt thư viện
        touch /usr/local/lib/python3.10/site-packages/.requirements_installed
    else
        echo "Python dependencies are already installed."
    fi
fi

# Kiểm tra và khởi tạo cơ sở dữ liệu Airflow nếu chưa có
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

# Nâng cấp cơ sở dữ liệu Airflow
$(command -v airflow) db upgrade

# Khởi động webserver
exec airflow webserver
