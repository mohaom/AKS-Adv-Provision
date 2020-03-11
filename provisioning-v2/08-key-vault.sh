#!/bin/bash

# Make sure that variables are updated
source ./aks.vars

# Creating Azure Key Vault
AKV_ID=$(az keyvault create \
    --name $KEY_VAULT_PRIMARY \
    --resource-group $RG_INFOSEC \
    --enable-soft-delete true \
    --location $LOCATION \
    --tags $TAG_ENV_DEV $TAG_PROJ_SHARED $TAG_DEPT_IT $TAG_STATUS_EXP \
    --query id -o tsv)

# Getting existing key vault
# AKV=$(az keyvault show --name $KEYVAULT_PRIMARY)
# echo $AKV
# AKV_ID=$(echo $AKV | jq -r .id)

# If you are using existing Key Vault, you need to make sure that soft delete is enabled
# az resource update --id $(az keyvault show --name ${KEYVAULT_PRIMARY} -o tsv | awk '{print $1}') --set properties.enableSoftDelete=true

echo export AKV_ID=$AKV_ID >> ./aks.vars

source ./aks.vars

echo "Key Vault Scripts Execution Completed"