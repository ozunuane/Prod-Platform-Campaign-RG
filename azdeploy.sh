#!/bin/bash
az deployment group create \
--resource-group  lenderlinktest \
--template-file prod.bicep \
--parameters service='NT-Prod-Platform-Property' 



#--confirm-with-what-if \



#az appconfig delete --name NT-test-Platform-Campaign-ASP --resource-group myResourceGroup NT-Prod-Platform-TCPA-RG

#DELETE https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/Prod-Platform-TCPA-RG
#/providers/Microsoft.Web/serverfarms/{name}?api-version=2021-02-01