{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "metadata": {
    "_generator": {
      "name": "bicep",
      "version": "0.7.4.23292",
      "templateHash": "3247921717092822836"
    }
  },
  "parameters": {
    "resgrp": {
      "type": "string"
    },
    "keyVault_name1": {
      "type": "string",
      "defaultValue": "[format('{0}-DEV-KV', parameters('resgrp'))]"
    },
    "keyVault_name2": {
      "type": "string",
      "defaultValue": "[format('{0}-QA-KV', parameters('resgrp'))]"
    },
    "keyVault_name3": {
      "type": "string",
      "defaultValue": "[format('{0}-UAT-KV', parameters('resgrp'))]"
    },
    "Product": {
      "type": "string",
      "defaultValue": "LenderLink"
    }
  },
  "resources": [
    {
      "type": "Microsoft.KeyVault/vaults",
      "apiVersion": "2021-11-01-preview",
      "name": "[parameters('keyVault_name1')]",
      "location": "[resourceGroup().location]",
      "tags": {
        "owner": "Andrew Yirak",
        "Department": "NAF Tech",
        "Environment": "Lower Environment",
        "Product": "[parameters('Product')]"
      },
      "properties": {
        "softDeleteRetentionInDays": 7,
        "enabledForDeployment": false,
        "enabledForTemplateDeployment": true,
        "enabledForDiskEncryption": true,
        "tenantId": "tenantId",
        "accessPolicies": [
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "47f84704-bdfb-482c-9914-652e387aa91c",
            "permissions": {
              "keys": [],
              "secrets": [
                "Get",
                "List"
              ],
              "certificates": []
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "751110db-be6f-4e07-920b-acae7246d031",
            "permissions": {
              "keys": [],
              "secrets": [
                "Get",
                "List"
              ],
              "certificates": []
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "f24a6d96-3339-4851-86f4-9ea219816562",
            "permissions": {
              "keys": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "GetRotationPolicy",
                "SetRotationPolicy",
                "Rotate"
              ],
              "secrets": [
                "Get",
                "List",
                "Set",
                "Delete",
                "Recover",
                "Backup",
                "Restore"
              ],
              "certificates": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "ManageContacts",
                "ManageIssuers",
                "GetIssuers",
                "ListIssuers",
                "SetIssuers",
                "DeleteIssuers"
              ]
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "751110db-be6f-4e07-920b-acae7246d031",
            "permissions": {
              "keys": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "GetRotationPolicy",
                "SetRotationPolicy",
                "Rotate"
              ],
              "secrets": [
                "Get",
                "List",
                "Set",
                "Delete",
                "Recover",
                "Backup",
                "Restore"
              ],
              "certificates": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "ManageContacts",
                "ManageIssuers",
                "GetIssuers",
                "ListIssuers",
                "SetIssuers",
                "DeleteIssuers"
              ]
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "933d01c2-e2b3-419d-977c-2cb05c53dd89",
            "permissions": {
              "keys": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "GetRotationPolicy",
                "SetRotationPolicy",
                "Rotate"
              ],
              "secrets": [
                "Get",
                "List",
                "Set",
                "Delete",
                "Recover",
                "Backup",
                "Restore"
              ],
              "certificates": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "ManageContacts",
                "ManageIssuers",
                "GetIssuers",
                "ListIssuers",
                "SetIssuers",
                "DeleteIssuers"
              ]
            }
          }
        ],
        "sku": {
          "name": "standard",
          "family": "A"
        },
        "createMode": "recover",
        "enableSoftDelete": true,
        "provisioningState": "Succeeded",
        "networkAcls": {
          "bypass": "AzureServices",
          "virtualNetworkRules": [
            {
              "id": "/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-prod-platform-net-rg/providers/microsoft.network/virtualnetworks/NT-LE-LenderLink-NET-RG",
              "ignoreMissingVnetServiceEndpoint": true
            }
          ]
        }
      }
    },
    {
      "type": "Microsoft.KeyVault/vaults",
      "apiVersion": "2019-09-01",
      "name": "[parameters('keyVault_name2')]",
      "location": "[resourceGroup().location]",
      "tags": {
        "owner": "Andrew Yirak",
        "Department": "NAF Tech",
        "Environment": "Lower Environment",
        "Product": "[parameters('Product')]"
      },
      "properties": {
        "softDeleteRetentionInDays": 7,
        "enabledForDeployment": false,
        "enabledForTemplateDeployment": true,
        "enabledForDiskEncryption": true,
        "tenantId": "tenantId",
        "accessPolicies": [
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "de86b896-3ad4-47de-8e64-ba113dd978a4",
            "permissions": {
              "keys": [],
              "secrets": [
                "Get",
                "List"
              ],
              "certificates": []
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "f0c2cd9e-a459-4ab9-94be-4deffcf90159",
            "permissions": {
              "keys": [],
              "secrets": [
                "Get",
                "List"
              ],
              "certificates": []
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "f24a6d96-3339-4851-86f4-9ea219816562",
            "permissions": {
              "keys": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "GetRotationPolicy",
                "SetRotationPolicy",
                "Rotate"
              ],
              "secrets": [
                "Get",
                "List",
                "Set",
                "Delete",
                "Recover",
                "Backup",
                "Restore"
              ],
              "certificates": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "ManageContacts",
                "ManageIssuers",
                "GetIssuers",
                "ListIssuers",
                "SetIssuers",
                "DeleteIssuers"
              ]
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "751110db-be6f-4e07-920b-acae7246d031",
            "permissions": {
              "keys": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "GetRotationPolicy",
                "SetRotationPolicy",
                "Rotate"
              ],
              "secrets": [
                "Get",
                "List",
                "Set",
                "Delete",
                "Recover",
                "Backup",
                "Restore"
              ],
              "certificates": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "ManageContacts",
                "ManageIssuers",
                "GetIssuers",
                "ListIssuers",
                "SetIssuers",
                "DeleteIssuers"
              ]
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "933d01c2-e2b3-419d-977c-2cb05c53dd89",
            "permissions": {
              "keys": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "GetRotationPolicy",
                "SetRotationPolicy",
                "Rotate"
              ],
              "secrets": [
                "Get",
                "List",
                "Set",
                "Delete",
                "Recover",
                "Backup",
                "Restore"
              ],
              "certificates": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "ManageContacts",
                "ManageIssuers",
                "GetIssuers",
                "ListIssuers",
                "SetIssuers",
                "DeleteIssuers"
              ]
            }
          }
        ],
        "sku": {
          "name": "standard",
          "family": "A"
        },
        "createMode": "recover",
        "enableSoftDelete": true,
        "provisioningState": "Succeeded",
        "networkAcls": {
          "bypass": "AzureServices",
          "virtualNetworkRules": [
            {
              "id": "/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-prod-platform-net-rg/providers/microsoft.network/virtualnetworks/NT-LE-LenderLink-NET-RG",
              "ignoreMissingVnetServiceEndpoint": true
            }
          ]
        }
      }
    },
    {
      "type": "Microsoft.KeyVault/vaults",
      "apiVersion": "2019-09-01",
      "name": "[parameters('keyVault_name3')]",
      "location": "[resourceGroup().location]",
      "tags": {
        "owner": "Andrew Yirak",
        "Department": "NAF Tech",
        "Environment": "Lower Environment",
        "Product": "[parameters('Product')]"
      },
      "properties": {
        "softDeleteRetentionInDays": 7,
        "enabledForDeployment": false,
        "enabledForTemplateDeployment": true,
        "enabledForDiskEncryption": true,
        "tenantId": "tenantId",
        "accessPolicies": [
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "de86b896-3ad4-47de-8e64-ba113dd978a4",
            "permissions": {
              "keys": [],
              "secrets": [
                "Get",
                "List"
              ],
              "certificates": []
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "f0c2cd9e-a459-4ab9-94be-4deffcf90159",
            "permissions": {
              "keys": [],
              "secrets": [
                "Get",
                "List"
              ],
              "certificates": []
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "f24a6d96-3339-4851-86f4-9ea219816562",
            "permissions": {
              "keys": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "GetRotationPolicy",
                "SetRotationPolicy",
                "Rotate"
              ],
              "secrets": [
                "Get",
                "List",
                "Set",
                "Delete",
                "Recover",
                "Backup",
                "Restore"
              ],
              "certificates": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "ManageContacts",
                "ManageIssuers",
                "GetIssuers",
                "ListIssuers",
                "SetIssuers",
                "DeleteIssuers"
              ]
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "751110db-be6f-4e07-920b-acae7246d031",
            "permissions": {
              "keys": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "GetRotationPolicy",
                "SetRotationPolicy",
                "Rotate"
              ],
              "secrets": [
                "Get",
                "List",
                "Set",
                "Delete",
                "Recover",
                "Backup",
                "Restore"
              ],
              "certificates": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "ManageContacts",
                "ManageIssuers",
                "GetIssuers",
                "ListIssuers",
                "SetIssuers",
                "DeleteIssuers"
              ]
            }
          },
          {
            "tenantId": "04986fa2-6d28-46f7-966a-b1ac32f74fa8",
            "objectId": "933d01c2-e2b3-419d-977c-2cb05c53dd89",
            "permissions": {
              "keys": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "GetRotationPolicy",
                "SetRotationPolicy",
                "Rotate"
              ],
              "secrets": [
                "Get",
                "List",
                "Set",
                "Delete",
                "Recover",
                "Backup",
                "Restore"
              ],
              "certificates": [
                "Get",
                "List",
                "Update",
                "Create",
                "Import",
                "Delete",
                "Recover",
                "Backup",
                "Restore",
                "ManageContacts",
                "ManageIssuers",
                "GetIssuers",
                "ListIssuers",
                "SetIssuers",
                "DeleteIssuers"
              ]
            }
          }
        ],
        "sku": {
          "name": "standard",
          "family": "A"
        },
        "createMode": "recover",
        "enableSoftDelete": true,
        "provisioningState": "Succeeded",
        "networkAcls": {
          "bypass": "AzureServices",
          "virtualNetworkRules": [
            {
              "id": "/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-prod-platform-net-rg/providers/microsoft.network/virtualnetworks/NT-LE-LenderLink-NET-RG",
              "ignoreMissingVnetServiceEndpoint": true
            }
          ]
        }
      }
    }
  ]
}