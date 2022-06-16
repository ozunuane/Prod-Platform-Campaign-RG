param resgrp string 
param keyVault_name1 string = '${resgrp}-DEV-Kv'
param keyVault_name2 string = '${resgrp}-QA-Kv'
param keyVault_name3 string = '${resgrp}-UAT-Kv'
param Product string = 'LenderLink'

resource keyVault 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {

  name: keyVault_name1
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Lower Environment'
    Product: Product
  }

  properties: { 


    enabledForDeployment: false
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
    
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
        
      
    
    sku: {
      name: 'standard'
      family: 'A'  
    }
   createMode: 'recover'
   enableSoftDelete: true
   provisioningState: 'Succeeded'
   networkAcls: {
      bypass: 'AzureServices'
       virtualNetworkRules: [ 
         
           {
             id:'/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-prod-platform-net-rg/providers/microsoft.network/virtualnetworks/NT-LE-LenderLink-NET-RG'
             ignoreMissingVnetServiceEndpoint: true
           }
      
       ]
   }

  }

}









resource keyVault3 'Microsoft.KeyVault/vaults@2019-09-01' = {

  name: keyVault_name2
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Lower Environment'
    Product: Product
  }

  properties: { 


    softDeleteRetentionInDays: 7 
    enabledForDeployment: false
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: 'tenantId'
    
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
        
      
    
    sku: {
      name: 'standard'
      family: 'A'  
    }
   createMode: 'recover'
   enableSoftDelete: true
   provisioningState: 'Succeeded'
   networkAcls: {
      bypass: 'AzureServices'
       virtualNetworkRules: [ 
         
           {
             id:'/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-prod-platform-net-rg/providers/microsoft.network/virtualnetworks/NT-LE-LenderLink-NET-RG'
             ignoreMissingVnetServiceEndpoint: true
           }
      
       ]
   }

  }

}





resource keyVault2 'Microsoft.KeyVault/vaults@2019-09-01' = {

  name: keyVault_name3
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Lower Environment' 
    Product: Product
  }

  properties: { 


    softDeleteRetentionInDays: 7 
    enabledForDeployment: false
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: '04986fa2-6d28-46f7-966a-b1ac32f74fa8'
    
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
        
      
    
    sku: {
      name: 'standard'
      family: 'A'  
    }
   createMode: 'default'
   enableSoftDelete: false
   provisioningState: 'Succeeded'
   networkAcls: {
      bypass: 'AzureServices'
       virtualNetworkRules: [ 
         
           {
             id:'/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-prod-platform-net-rg/providers/microsoft.network/virtualnetworks/NT-LE-LenderLink-NET-RG'
             ignoreMissingVnetServiceEndpoint: true
           }
      
       ]
   }

  }

}


