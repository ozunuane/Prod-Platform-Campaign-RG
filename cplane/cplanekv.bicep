param resgrp string 
param keyVault_name1 string = '${resgrp}-DEV-KV'
param keyVault_name2 string = '${resgrp}-QA-KV'
param keyVault_name3 string = '${resgrp}-UAT-KV'
param Product string = 'LenderLink'
param virtualNetworks_NT_LE_LenderLink_NET_VNet_name string = 'virtualNetworks_NT_LE_LenderLink_NET_VNet_name'

var subnet_apps = 'NT-LE-LenderLink-CtrlPlane-SN'

resource kv_resource1 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVault_name1
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Lower Environment'
    Product: Product
  }

   properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: [
        {
          id: '${virtualNetworks_NT_LE_LenderLink_NET_VNet_name}/subnets/NT-LE-LenderLink-CtrlPlane-SN'
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    accessPolicies: [
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'de86b896-3ad4-47de-8e64-ba113dd978a4'
        permissions: {
          keys: []
          secrets: [
            'Get'
            'List'
          ]
          certificates: []
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'f0c2cd9e-a459-4ab9-94be-4deffcf90159'
        permissions: {
          keys: []
          secrets: [
            'Get'
            'List'
          ]
          certificates: []
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'f24a6d96-3339-4851-86f4-9ea219816562'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '751110db-be6f-4e07-920b-acae7246d031'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '933d01c2-e2b3-419d-977c-2cb05c53dd89'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    vaultUri: 'https://${keyVault_name1}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'

  }
}



resource kv_resource2 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVault_name2
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: Product
  }

   properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: [
        {
          id: '${virtualNetworks_NT_LE_LenderLink_NET_VNet_name}/NT-LE-LenderLink-CtrlPlane-SN'
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    accessPolicies: [
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'de86b896-3ad4-47de-8e64-ba113dd978a4'
        permissions: {
          keys: []
          secrets: [
            'Get'
            'List'
          ]
          certificates: []
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'f0c2cd9e-a459-4ab9-94be-4deffcf90159'
        permissions: {
          keys: []
          secrets: [
            'Get'
            'List'
          ]
          certificates: []
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'f24a6d96-3339-4851-86f4-9ea219816562'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '751110db-be6f-4e07-920b-acae7246d031'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '933d01c2-e2b3-419d-977c-2cb05c53dd89'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    vaultUri: 'https://${keyVault_name2}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}





resource kv_resource3 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVault_name3
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: Product
  }

   properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: [
        {
          id: '${virtualNetworks_NT_LE_LenderLink_NET_VNet_name}/NT-LE-LenderLink-CtrlPlane-SN'
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    accessPolicies: [
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'de86b896-3ad4-47de-8e64-ba113dd978a4'
        permissions: {
          keys: []
          secrets: [
            'Get'
            'List'
          ]
          certificates: []
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'f0c2cd9e-a459-4ab9-94be-4deffcf90159'
        permissions: {
          keys: []
          secrets: [
            'Get'
            'List'
          ]
          certificates: []
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: 'f24a6d96-3339-4851-86f4-9ea219816562'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '751110db-be6f-4e07-920b-acae7246d031'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '933d01c2-e2b3-419d-977c-2cb05c53dd89'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}
