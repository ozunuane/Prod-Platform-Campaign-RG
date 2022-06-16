param sites_NT_Prod_Platform_Campaign_AS_name string = 'NT-Prod-Platform-Campaign-AS'
param vaults_NT_Prod_Plat_Campaign_KV_name string = 'NT-Prod-Plat-Campaign-KV'
param serverfarms_NT_Prod_Platform_Campaign_ASP_name string = 'NT-Prod-Platform-Campaign-ASP'
param components_NT_Prod_Platform_Campaign_AppInsights_name string = 'NT-Prod-Platform-Campaign-AppInsights'
param configurationStores_nt_prod_platform_campaign_ac_name string = 'nt-prod-platform-campaign-ac'
param smartdetectoralertrules_failure_anomalies_nt_prod_platform_campaign_appinsights_name string = 'failure anomalies - nt-prod-platform-campaign-appinsights'
param actiongroups_application_insights_smart_detection_externalid string = '/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/gogoservicesrg/providers/microsoft.insights/actiongroups/application insights smart detection'
param workspaces_defaultworkspace_b13d11b3_9583_4815_be4c_a7fddee16992_eus_externalid string = '/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/defaultresourcegroup-eus/providers/microsoft.operationalinsights/workspaces/defaultworkspace-b13d11b3-9583-4815-be4c-a7fddee16992-eus'
param virtualnetworks_nt_prod_platform_net_vnet_externalid string = '/subscriptions/b13d11b3-9583-4815-be4c-a7fddee16992/resourceGroups/nt-prod-platform-net-rg/providers/microsoft.network/virtualnetworks/nt-prod-platform-net-vnet'

resource configurationStores_nt_prod_platform_campaign_ac_name_resource 'Microsoft.AppConfiguration/configurationStores@2022-05-01' = {
  name: configurationStores_nt_prod_platform_campaign_ac_name
  location: 'westus3'
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: 'Campaign Service'
  }
  sku: {
    name: 'standard'
  }
  properties: {
    encryption: {
    }
    disableLocalAuth: false
    softDeleteRetentionInDays: 7
    enablePurgeProtection: false
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_resource 'microsoft.insights/components@2020-02-02' = {
  name: components_NT_Prod_Platform_Campaign_AppInsights_name
  location: 'westus3'
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: 'Campaign Service'
  }
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaWebAppExtensionCreate'
    RetentionInDays: 90
    WorkspaceResourceId: workspaces_defaultworkspace_b13d11b3_9583_4815_be4c_a7fddee16992_eus_externalid
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_resource 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: vaults_NT_Prod_Plat_Campaign_KV_name
  location: 'westus3'
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: 'Campaign Service'
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
          id: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/nt-prod-platform-net-campaign-sn'
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
    vaultUri: 'https://nt-prod-plat-campaign-kv.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource serverfarms_NT_Prod_Platform_Campaign_ASP_name_resource 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: serverfarms_NT_Prod_Platform_Campaign_ASP_name
  location: 'West US 3'
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: 'Campaign Service'
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
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: true
  }
}

resource smartdetectoralertrules_failure_anomalies_nt_prod_platform_campaign_appinsights_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_failure_anomalies_nt_prod_platform_campaign_appinsights_name
  location: 'global'
  properties: {
    description: 'Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'PT1M'
    detector: {
      id: 'FailureAnomaliesDetector'
    }
    scope: [
      components_NT_Prod_Platform_Campaign_AppInsights_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actiongroups_application_insights_smart_detection_externalid
      ]
    }
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_degradationindependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'degradationindependencyduration'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'degradationindependencyduration'
      DisplayName: 'Degradation in dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_degradationinserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'degradationinserverresponsetime'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'degradationinserverresponsetime'
      DisplayName: 'Degradation in server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_digestMailConfiguration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'digestMailConfiguration'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'digestMailConfiguration'
      DisplayName: 'Digest Mail Configuration'
      Description: 'This rule describes the digest mail preferences'
      HelpUrl: 'www.homail.com'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_extension_billingdatavolumedailyspikeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'extension_billingdatavolumedailyspikeextension'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'extension_billingdatavolumedailyspikeextension'
      DisplayName: 'Abnormal rise in daily data volume (preview)'
      Description: 'This detection rule automatically analyzes the billing data generated by your application, and can warn you about an unusual increase in your application\'s billing costs'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/billing-data-volume-daily-spike.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_extension_canaryextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'extension_canaryextension'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'extension_canaryextension'
      DisplayName: 'Canary extension'
      Description: 'Canary extension'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_extension_exceptionchangeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'extension_exceptionchangeextension'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'extension_exceptionchangeextension'
      DisplayName: 'Abnormal rise in exception volume (preview)'
      Description: 'This detection rule automatically analyzes the exceptions thrown in your application, and can warn you about unusual patterns in your exception telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/abnormal-rise-in-exception-volume.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_extension_memoryleakextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'extension_memoryleakextension'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'extension_memoryleakextension'
      DisplayName: 'Potential memory leak detected (preview)'
      Description: 'This detection rule automatically analyzes the memory consumption of each process in your application, and can warn you about potential memory leaks or increased memory consumption.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/memory-leak.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_extension_securityextensionspackage 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'extension_securityextensionspackage'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'extension_securityextensionspackage'
      DisplayName: 'Potential security issue detected (preview)'
      Description: 'This detection rule automatically analyzes the telemetry generated by your application and detects potential security issues.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/application-security-detection-pack.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_extension_traceseveritydetector 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'extension_traceseveritydetector'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'extension_traceseveritydetector'
      DisplayName: 'Degradation in trace severity ratio (preview)'
      Description: 'This detection rule automatically analyzes the trace logs emitted from your application, and can warn you about unusual patterns in the severity of your trace telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/degradation-in-trace-severity-ratio.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_longdependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'longdependencyduration'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'longdependencyduration'
      DisplayName: 'Long dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_migrationToAlertRulesCompleted 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'migrationToAlertRulesCompleted'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'migrationToAlertRulesCompleted'
      DisplayName: 'Migration To Alert Rules Completed'
      Description: 'A configuration that controls the migration state of Smart Detection to Smart Alerts'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: true
      IsEnabledByDefault: false
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: false
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_slowpageloadtime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'slowpageloadtime'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'slowpageloadtime'
      DisplayName: 'Slow page load time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_NT_Prod_Platform_Campaign_AppInsights_name_slowserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_NT_Prod_Platform_Campaign_AppInsights_name_resource
  name: 'slowserverresponsetime'
  location: 'westus3'
  properties: {
    RuleDefinitions: {
      Name: 'slowserverresponsetime'
      DisplayName: 'Slow server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_AppConfiguration_ConnectionString 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_NT_Prod_Plat_Campaign_KV_name_resource
  name: 'AppConfiguration--ConnectionString'
  location: 'westus3'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_AppConfiguration_Filter 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_NT_Prod_Plat_Campaign_KV_name_resource
  name: 'AppConfiguration--Filter'
  location: 'westus3'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_AppConfiguration_RefreshIntervalSeconds 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_NT_Prod_Plat_Campaign_KV_name_resource
  name: 'AppConfiguration--RefreshIntervalSeconds'
  location: 'westus3'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_AppConfiguration_Sentinel 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_NT_Prod_Plat_Campaign_KV_name_resource
  name: 'AppConfiguration--Sentinel'
  location: 'westus3'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_ConnectionStrings_Bankerview 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_NT_Prod_Plat_Campaign_KV_name_resource
  name: 'ConnectionStrings--Bankerview'
  location: 'westus3'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_Okta_ClientId 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_NT_Prod_Plat_Campaign_KV_name_resource
  name: 'Okta--ClientId'
  location: 'westus3'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_Okta_ClientSecret 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_NT_Prod_Plat_Campaign_KV_name_resource
  name: 'Okta--ClientSecret'
  location: 'westus3'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_Okta_DefaultScope 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_NT_Prod_Plat_Campaign_KV_name_resource
  name: 'Okta--DefaultScope'
  location: 'westus3'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_NT_Prod_Plat_Campaign_KV_name_Okta_TokenUrl 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: vaults_NT_Prod_Plat_Campaign_KV_name_resource
  name: 'Okta--TokenUrl'
  location: 'westus3'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource sites_NT_Prod_Platform_Campaign_AS_name_resource 'Microsoft.Web/sites@2021-03-01' = {
  name: sites_NT_Prod_Platform_Campaign_AS_name
  location: 'West US 3'
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: 'Campaign Service'
  }
  kind: 'app'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'nt-prod-platform-campaign-as.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'nt-prod-platform-campaign-as.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_NT_Prod_Platform_Campaign_ASP_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: true
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: '609B416106247A0784DA2BC1DD2B66A7BE146E5F49CBB95B33105321738A0F6E'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    storageAccountRequired: false
    virtualNetworkSubnetId: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/NT-Prod-Platform-NET-Campaign-SN'
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_NT_Prod_Platform_Campaign_AS_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_resource
  name: 'ftp'
  location: 'West US 3'
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: 'Campaign Service'
  }
  properties: {
    allow: true
  }
}

resource sites_NT_Prod_Platform_Campaign_AS_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_resource
  name: 'scm'
  location: 'West US 3'
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: 'Campaign Service'
  }
  properties: {
    allow: true
  }
}

resource sites_NT_Prod_Platform_Campaign_AS_name_web 'Microsoft.Web/sites/config@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_resource
  name: 'web'
  location: 'West US 3'
  tags: {
    owner: 'Andrew Yirak'
    Department: 'NAF Tech'
    Environment: 'Production'
    Product: 'Campaign Service'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v6.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$NT-Prod-Platform-Campaign-AS'
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetName: '0858ca84-6aa1-42f0-af51-c0e0392b457b_NT-Prod-Platform-NET-Campaign-SN'
    vnetRouteAllEnabled: true
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    managedServiceIdentityId: 1558
    ipSecurityRestrictions: [
      {
        vnetSubnetResourceId: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/NT-Prod-Platform-NET-APIM-SN'
        action: 'Allow'
        tag: 'Default'
        priority: 150
        name: 'Allow APIM'
      }
      {
        vnetSubnetResourceId: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/NT-Prod-Platform-NET-Campaign-SN'
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
  }
}

resource sites_NT_Prod_Platform_Campaign_AS_name_sites_NT_Prod_Platform_Campaign_AS_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_resource
  name: '${sites_NT_Prod_Platform_Campaign_AS_name}.azurewebsites.net'
  location: 'West US 3'
  properties: {
    siteName: 'NT-Prod-Platform-Campaign-AS'
    hostNameType: 'Verified'
  }
}

resource sites_NT_Prod_Platform_Campaign_AS_name_2022_06_13T18_30_27_4655892 'Microsoft.Web/sites/snapshots@2015-08-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_resource
  name: '2022-06-13T18_30_27_4655892'
}

resource sites_NT_Prod_Platform_Campaign_AS_name_0858ca84_6aa1_42f0_af51_c0e0392b457b_NT_Prod_Platform_NET_Campaign_SN 'Microsoft.Web/sites/virtualNetworkConnections@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_resource
  name: '0858ca84-6aa1-42f0-af51-c0e0392b457b_NT-Prod-Platform-NET-Campaign-SN'
  location: 'West US 3'
  properties: {
    vnetResourceId: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/NT-Prod-Platform-NET-Campaign-SN'
    isSwift: true
  }
}

resource sites_NT_Prod_Platform_Campaign_AS_name_Staging 'Microsoft.Web/sites/slots@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_resource
  name: 'Staging'
  location: 'West US 3'
  kind: 'app'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'nt-prod-platform-campaign-as-staging.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'nt-prod-platform-campaign-as-staging.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_NT_Prod_Platform_Campaign_ASP_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: true
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: '609B416106247A0784DA2BC1DD2B66A7BE146E5F49CBB95B33105321738A0F6E'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_NT_Prod_Platform_Campaign_AS_name_Staging_ftp 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_Staging
  name: 'ftp'
  location: 'West US 3'
  properties: {
    allow: true
  }
  dependsOn: [

    sites_NT_Prod_Platform_Campaign_AS_name_resource
  ]
}

resource sites_NT_Prod_Platform_Campaign_AS_name_Staging_scm 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_Staging
  name: 'scm'
  location: 'West US 3'
  properties: {
    allow: true
  }
  dependsOn: [

    sites_NT_Prod_Platform_Campaign_AS_name_resource
  ]
}

resource sites_NT_Prod_Platform_Campaign_AS_name_Staging_web 'Microsoft.Web/sites/slots/config@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_Staging
  name: 'web'
  location: 'West US 3'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v6.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$nt-prod-platform-campaign-as__Staging'
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    managedServiceIdentityId: 1559
    ipSecurityRestrictions: [
      {
        vnetSubnetResourceId: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/NT-Prod-Platform-NET-APIM-SN'
        action: 'Allow'
        tag: 'Default'
        priority: 150
        name: 'Allow APIM SN'
      }
      {
        vnetSubnetResourceId: '${virtualnetworks_nt_prod_platform_net_vnet_externalid}/subnets/NT-Prod-Platform-NET-Campaign-SN'
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
  }
  dependsOn: [

    sites_NT_Prod_Platform_Campaign_AS_name_resource
  ]
}

resource sites_NT_Prod_Platform_Campaign_AS_name_Staging_sites_NT_Prod_Platform_Campaign_AS_name_staging_azurewebsites_net 'Microsoft.Web/sites/slots/hostNameBindings@2021-03-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_Staging
  name: '${sites_NT_Prod_Platform_Campaign_AS_name}-staging.azurewebsites.net'
  location: 'West US 3'
  properties: {
    siteName: 'nt-prod-platform-campaign-as(Staging)'
    hostNameType: 'Verified'
  }
  dependsOn: [

    sites_NT_Prod_Platform_Campaign_AS_name_resource
  ]
}

resource sites_NT_Prod_Platform_Campaign_AS_name_Staging_2022_06_13T18_30_27_4655892 'Microsoft.Web/sites/slots/snapshots@2015-08-01' = {
  parent: sites_NT_Prod_Platform_Campaign_AS_name_Staging
  name: '2022-06-13T18_30_27_4655892'
  dependsOn: [

    sites_NT_Prod_Platform_Campaign_AS_name_resource
  ]
}