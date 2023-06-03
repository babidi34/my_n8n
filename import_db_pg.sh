#!/bin/bash


# Nom du conteneur PostgreSQL
CONTAINER_NAME="n8n-pg-container"

# Nom de la base de données
DATABASE_NAME="n8n"

# Fichier de sauvegarde à restaurer
BACKUP_FILE="$1"

if [ -z "$BACKUP_FILE" ]; then
    echo "Veuillez spécifier un fichier de sauvegarde à restaurer."
    exit 1
fi

# Importer la base de données
cat $BACKUP_FILE | docker exec -i $CONTAINER_NAME psql -U n8n -d $DATABASE_NAME
cat $BACKUP_FILE | docker exec -i $CONTAINER_NAME psql -U n8n -d $DATABASE_NAME


echo "La base de données a été restaurée à partir de $BACKUP_FILE"
