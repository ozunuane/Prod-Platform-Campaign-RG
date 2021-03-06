param service string
param asp_name string = '${service}-ASP'
param appInsights_name string = '${service}-AppInsights'
param appservice_name string = '${service}-AS'
param appconfig_name2 string = '${service}-AC'
param servkv string = 'NT-Prod-Property'
param vnet_id string = '/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-prod-platform-net-rg/providers/microsoft.network/virtualnetworks/NT-Prod-Platform-NET-VNet'
param Product string = 'Property Service'
param Project string = 'Platform'

param groupName string = '${service}-RG'
param subscriptionID string = 'b13d11b3-9583-4815-be4c-a7fddee16992'
var Environment  = 'Production'
var subnet_apps = 'NT-Prod-Platform-NET-Property-SN'
param keyVault_name string = '${servkv}-KV'


resource appconfig 'Microsoft.AppConfiguration/configurationStores@2021-10-01-preview' = {
  name: appconfig_name2
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: Environment
    Product: Product 
    Project: Project 

  }
  sku: {
    name: 'standard'
  }
  
  properties: {
    disableLocalAuth: false
    enablePurgeProtection: false
    encryption: {}
    }
      

  }





resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: asp_name
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: Environment
    Product: Product 
    Project: Project 

  }
  sku: {
    name: 'P1v2'
    tier: 'PremiumV2'
    size: 'P1v2'
    family: 'Pv2'
    capacity: 3
  }

  kind: 'app'
  
  properties: {
    perSiteScaling: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
     
}

}


resource appService 'Microsoft.Web/sites@2018-11-01' = {

  name: appservice_name
  location: resourceGroup().location


  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: Environment
    Product: Product 
    Project: Project 

  }
  kind:'app'
  identity: {
    type: 'SystemAssigned'
  }
  
  properties: {
    
    serverFarmId: appServicePlan.id
    
  
  }

}


resource webappVnet 'Microsoft.Web/sites/networkConfig@2020-06-01' = {
 parent: appService
  name: 'virtualNetwork'
  properties: {
    subnetResourceId: '${vnet_id}/subnets/${subnet_apps}'
    swiftSupported: true
  }
}



 resource appservicesetting 'Microsoft.Web/sites/config@2021-03-01' = {
      name: 'web'
      parent: appService

         properties: {
            appSettings: [
             {
               name: 'APPLICATIONINSIGHTS_CONNECTION_STRINGT'
               value : appInsightsComponentS.properties.InstrumentationKey
             }
             {
              name: 'ASPNETCORE_ENVIRONMENT'
              value : 'Production'
            }
          ]

        virtualApplications:  [
          {
            virtualPath: '/'
            physicalPath: 'site\\wwwroot'
            preloadEnabled: true
          }
        ]

        autoHealEnabled: false
        vnetName: 'virtualnetworks/nt-prod-platform-net-vnet'
        vnetRouteAllEnabled: true
        vnetPrivatePortsCount: 0
        localMySqlEnabled: false
        managedServiceIdentityId: 1558
        ipSecurityRestrictions: [
          {
            vnetSubnetResourceId: '${vnet_id}/subnets/NT-Prod-Platform-NET-APIM-SN'
            action: 'Allow'
            tag: 'Default'
            priority: 150
            name: 'Allow APIM'
          }
          {
            vnetSubnetResourceId: '${vnet_id}/subnets/NT-Prod-Platform-NET-Campaign-SN'
            action: 'Allow'
            tag: 'Default'
            priority: 200
            name: 'Allow Campaign SN'
          }
          {
            ipAddress: 'Any'
            action: 'Deny'
            priority: 2147483647
            name: 'Deny all'
            description: 'Deny all access'
          }
        ]
        scmIpSecurityRestrictions: [
          {
            ipAddress: 'AzureCloud'
            action: 'Allow'
            tag: 'ServiceTag'
            priority: 150
            name: 'Allow ADO SN'
          }
          {
            ipAddress: 'Any'
            action: 'Deny'
            priority: 2147483647
            name: 'Deny all'
            description: 'Deny all access'
          }
        ]
        scmIpSecurityRestrictionsUseMain: false
        http20Enabled: true
        minTlsVersion: '1.2'
        scmMinTlsVersion: '1.2'
        ftpsState: 'Disabled'
        preWarmedInstanceCount: 0
        functionAppScaleLimit: 0
        functionsRuntimeScaleMonitoringEnabled: false
        minimumElasticInstanceCount: 0
        azureStorageAccounts: {
        }
         alwaysOn: true 
         netFrameworkVersion: 'v6.0'
          publishingUsername: service
          
         
      }




       }




resource appInsightsComponentS 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsights_name
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: Environment
    Product: Product 
    Project: Project 

  }
  
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Bluefield'
    HockeyAppId: 'string'  
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
    Request_Source: 'rest'
    RetentionInDays: 90 
   }



  dependsOn: [
    appServicePlan
  ]
 
   
  

}





resource kv_resource 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: keyVault_name
  location: resourceGroup().location
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: Product
    Project: Project
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
          id: '${vnet_id}/subnets/nt-prod-platform-net-campaign-sn'
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
    provisioningState: 'Succeeded'
     
   }
}
