// Parameters
param name string
param adminUsername string = 'azureuser'

@allowed([
  'sshPublicKey'
  'password'
])
param authenticationType string

@secure()
param adminPasswordOrSshPublicKey string

@allowed([
  'CentOS'
  'Ubuntu'
])
param linuxDistro string

param vmSize string = 'Standard_D4s_v5'
param location string = resourceGroup().location
param zone string = '1'

@minValue(1)
@maxValue(100)
param instanceCount int

// Variables
var linuxConfiguration = {
  disablePasswordAuthentication: true
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: adminPasswordOrSshPublicKey
      }
    ]
  }
}
var dnsLabelPrefix = '${name}-${uniqueString(resourceGroup().id)}'
var pipName = 'pip-${name}'
var nsgName = 'nsg-${name}'
var vnetName = 'vnet-${name}'
var vnetAddressPrefix = '10.0.0.0/16'
var subnet1Name = 'snet-1'
var subnet1AddressPrefix = '10.0.1.0/24'
var subnet1Id = '${vnet.id}/subnets/${subnet1Name}'
var nic1Name = 'nic1-${name}'
var vmName = 'vm${name}'
var ppgName = 'ppg-${name}'
var diagStorageAccountName = 'diag${uniqueString(resourceGroup().id)}'

var imageReferenceUbuntu = {
  publisher: 'Canonical'
  offer: '0001-com-ubuntu-server-focal'
  sku: '20_04-lts'
  version: 'latest'
}

var imageReferenceCentOS = {
  publisher: 'OpenLogic'
  offer: 'CentOS'
  sku: '8_4'
  version: '8.4.2021071900'
}

var imageReference = (linuxDistro == 'CentOS' ? imageReferenceCentOS : imageReferenceUbuntu)


// Resources
resource ppg 'Microsoft.Compute/proximityPlacementGroups@2021-11-01' = {
  name: ppgName
  location: location
  properties: {
    proximityPlacementGroupType: 'Standard'
  }
}

resource diagStorageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: diagStorageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource pip 'Microsoft.Network/publicIPAddresses@2021-08-01' = [for i in range(0,instanceCount): {
  name: '${pipName}${i}'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    dnsSettings: {
      domainNameLabel: '${dnsLabelPrefix}-${i}'
    }
  }
}]

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-08-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow_SSH'
        properties: {
          priority: 1000
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          destinationAddressPrefix: '*'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
    ]
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1AddressPrefix
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
    ]
  }
}

resource nics1 'Microsoft.Network/networkInterfaces@2021-08-01' = [for i in range(0,instanceCount): {
  name: '${nic1Name}${i}'
  location: location
  properties: {
    enableAcceleratedNetworking: true
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnet1Id
          }
          publicIPAddress: {
            id: pip[i].id
          }
        }
      }
    ]
  }
}]

resource vms 'Microsoft.Compute/virtualMachines@2021-11-01' = [for i in range(0,instanceCount): {
  name: '${vmName}${i}'
  location: location
  zones: [
    zone
  ]
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    proximityPlacementGroup: {
      id: ppg.id
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
      imageReference: imageReference
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nics1[i].id
          properties: {
            primary: true
          }
        }
      ]
    }
    osProfile: {
      computerName: '${vmName}${i}'
      adminUsername: adminUsername
      adminPassword: adminPasswordOrSshPublicKey
      linuxConfiguration: any(authenticationType == 'password' ? null : linuxConfiguration)
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: diagStorageAccount.properties.primaryEndpoints.blob
      }
    }
  }
}]

// Outputs
output fqdn array = [for i in range(0, instanceCount): pip[i].properties.dnsSettings.fqdn]
output ip array = [for i in range(0, instanceCount): pip[i].properties.ipAddress]
