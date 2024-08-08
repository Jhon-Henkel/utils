#!/bin/bash

#--------------------------------------------------------------------------------------------
#------------------------------------BKP-DATABASE--------------------------------------------
#--------------------------------------------------------------------------------------------

CONTAINER_NAME="docker_container_name"
BACKUP_DIR="/path/bkp/dir/"
TIMESTAMP=$(date +"%F")
BACKUP_FILE="db_backup_$TIMESTAMP.sql"
DB_PASS="db_pass"

cd /var/www/html

echo "-> Iniciando BKP"
docker exec -it $CONTAINER_NAME /bin/bash -c "mysqldump -u root --password=$DB_PASS --all-databases > /tmp/$BACKUP_FILE"
echo
echo "-> Copiando arquivos de BKP do container"
docker cp $CONTAINER_NAME:/tmp/$BACKUP_FILE $BACKUP_DIR
echo
echo "-> Removendo dump do container"
docker exec $CONTAINER_NAME rm /tmp/$BACKUP_FILE
echo "BKP concluído: $BACKUP_DIR$BACKUP_FILE"
echo

#--------------------------------------------------------------------------------------------
#----------------------------------UPLOAD-TO-AZURE-------------------------------------------
#--------------------------------------------------------------------------------------------

RESOURCE_GROUP="resource_group"
STORAGE_ACCOUNT="storage"
CONTAINER_NAME="container"
FILE_PATH="$BACKUP_DIR$BACKUP_FILE"
BLOB_NAME="$BACKUP_FILE"
EMAIL_RECIPIENT="email_recipient"


# Faça login na sua conta do Azure (você só precisa fazer isso uma vez o processo é manual)
#az login

# Obtenha a chave de acesso para a conta de armazenamento
STORAGE_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT --query '[0].value' --output tsv)

echo "-> Fazendo upload para a Azure"
az storage blob upload \
  --account-name $STORAGE_ACCOUNT \
  --account-key $STORAGE_KEY \
  --container-name $CONTAINER_NAME \
  --file $FILE_PATH \
  --name $BLOB_NAME

echo
if [ $? -eq 0 ]; then
  echo "-> Upload do arquivo $FILE_PATH para o container $CONTAINER_NAME no Azure Blob Storage foi bem-sucedido."
  echo
  echo "-> Removendo arquivo $BACKUP_FILE da VPS"
  rm $FILE_PATH
  echo
  echo "-> Enviando e-mail de sucesso"
  ssmtp $EMAIL_RECIPIENT < success_bkp_db_mail.txt
else
  echo "Falha no upload do arquivo $FILE_PATH para o container $CONTAINER_NAME no Azure Blob Storage."
  echo
  echo "-> Enviando e-mail de falha"
  ssmtp $EMAIL_RECIPIENT < fail_bkp_db_mail.txt
fi