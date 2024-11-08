#!/bin/bash

# Database configuration
DB_NAME="sales_dw"
HOST="postgres_container"
DB_USER="thangquang"
BACKUP_DIR="/backups"
DATE=$(date +"%Y%m%d_%H%M%S")

# Create directory if it is not exists
mkdir -p "$BACKUP_DIR"

# Init backup file name
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_backup_${DATE}.sql"

# Backup
pg_dump -h "$HOST" -U "$DB_USER" -d "$DB_NAME" > "$BACKUP_FILE"

# Check result
if [ $? -eq 0 ]; then
  echo "Backup data warehouse successfully: $BACKUP_FILE"
else
  echo "Backup failed"
  exit 1
fi

# Remove backup files after 7 days
find "$BACKUP_DIR" -type f -name "*.sql" -mtime +7 -exec rm {} \;

exit 0
