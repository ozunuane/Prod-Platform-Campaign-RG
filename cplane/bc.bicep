param vaults_nt_le_Lenderlink_dev_kvt_name string = 'nt-le-Lenderlink-dev-kvt'
param virtualnetworks_nt_le_lenderlink_net_vnet_externalid string = '/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-le-lenderlink-net-rg/providers/microsoft.network/virtualnetworks/nt-le-lenderlink-net-vnet'

resource vaults_nt_le_Lenderlink_dev_kvt_name_resource 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: vaults_nt_le_Lenderlink_dev_kvt_name
  location: 'eastus'
  tags: {
    owner: 'Alex Tennant'
    Department: 'NAF Tech'
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
          id: '${virtualnetworks_nt_le_lenderlink_net_vnet_externalid}/subnets/nt-le-lenderlink-ctrlplane-sn'
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    accessPolicies: [
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '47f84704-bdfb-482c-9914-652e387aa91c'
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
      {
        tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
        objectId: '4d35e809-32fe-41b3-8977-65202c4c9afe'
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
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    vaultUri: 'https://nt-le-lenderlink-dev-kvt.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource vaults_nt_le_Lenderlink_dev_kvt_name_ConnectionStrings_Bankerview 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_nt_le_Lenderlink_dev_kvt_name_resource
  name: 'ConnectionStrings--Bankerview'
  location: 'eastus'
  properties: {
    attributes: {
      enabled: true
    }
  }
}