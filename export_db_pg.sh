#!/bin/bash


CONTAINER_NAME="n8n-pg-container"

DATABASE_NAME="n8n"


BACKUP_DIR=${1:-"./backup"}

mkdir -p $BACKUP_DIR

BACKUP_FILE="$BACKUP_DIR/db_backup_n8n_$(date +'%Y%m%d%H%M%S').sql"

docker exec $CONTAINER_NAME pg_dump -U n8n -d $DATABASE_NAME > $BACKUP_FILE

echo "La base de données a été sauvegardée dans $BACKUP_FILE"
