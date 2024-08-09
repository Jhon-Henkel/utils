#!/bin/bash

#--------------------------------------------------------------------------------------------
#------------------------------------BKP-DATABASE--------------------------------------------
#--------------------------------------------------------------------------------------------

CONTAINER_NAME="docker_container_name"
BACKUP_DIR="/path/bkp/dir/"
TIMESTAMP=$(date +"%F")
SQL_BACKUP_FILE="db_backup_$TIMESTAMP.sql"
ZIP_BACKUP_FILE="db_backup_$TIMESTAMP.zip"
DB_PASS="db_pass"
SQL_FILE_PATH="$BACKUP_DIR$SQL_BACKUP_FILE"
ZIP_FILE_PATH="$BACKUP_DIR$ZIP_BACKUP_FILE"

cd /path/to/db/container

echo "-> Iniciando BKP"
docker exec $CONTAINER_NAME /bin/bash -c "mysqldump -u root --password=$DB_PASS --all-databases > /tmp/$SQL_BACKUP_FILE"
echo
echo "-> Copiando arquivos de BKP do container"
docker cp $CONTAINER_NAME:/tmp/$SQL_BACKUP_FILE $BACKUP_DIR
echo
echo "-> Removendo dump do container"
docker exec $CONTAINER_NAME rm /tmp/$SQL_BACKUP_FILE
echo
echo "-> Zipping file"
zip $ZIP_FILE_PATH $SQL_FILE_PATH
echo
echo "-> Removendo arquivo $SQL_BACKUP_FILE da VPS"
rm $SQL_FILE_PATH
echo
echo "-> BKP concluído: $ZIP_FILE_PATH"
echo

#--------------------------------------------------------------------------------------------
#----------------------------------UPLOAD-TO-AZURE-------------------------------------------
#--------------------------------------------------------------------------------------------

RESOURCE_GROUP="resource_group"
STORAGE_ACCOUNT="storage"
CONTAINER_NAME="container"
EMAIL_RECIPIENT="email_recipient"
SCRIPTS_DIR="/path/scripts/dir"

# Faça login na sua conta do Azure (você só precisa fazer isso uma vez o processo é manual)
#az login

echo "-> Obtendo chave de acesso Azure"
STORAGE_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT --query '[0].value' --output tsv)

echo "-> Fazendo upload para a Azure"
az storage blob upload \
  --account-name $STORAGE_ACCOUNT \
  --account-key $STORAGE_KEY \
  --container-name $CONTAINER_NAME \
  --file $ZIP_FILE_PATH \
  --name $ZIP_BACKUP_FILE

echo
if [ $? -eq 0 ]; then
  echo "-> Upload do arquivo $ZIP_FILE_PATH para o container $CONTAINER_NAME no Azure Blob Storage foi bem-sucedido."
  echo
  echo "-> Removendo arquivo $ZIP_BACKUP_FILE da VPS"
  rm $ZIP_FILE_PATH
  echo
  echo "-> Enviando e-mail de sucesso"
  ssmtp $EMAIL_RECIPIENT < $SCRIPTS_DIR/success_bkp_db_mail.txt
else
  echo "-> Falha no upload do arquivo $ZIP_FILE_PATH para o container $CONTAINER_NAME no Azure Blob Storage."
  echo
  echo "-> Enviando e-mail de falha"
  ssmtp $EMAIL_RECIPIENT < $SCRIPTS_DIR/fail_bkp_db_mail.txt
fi