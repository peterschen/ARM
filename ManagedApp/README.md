# Managed App #
This sample shows how to deploy an app that is managed by Azure. Servers deployed as part of this template are automatically backed up, monitored and patched.

## Usage ##
```
Login-AzureRmAccount
New-AzureRmResourceGroup "myapp123" -Location "northeurope"
New-AzureRmResourceGroupDeployment -Name $(Get-Date -Format "yyyyMMdd-hhmmss") -ResourceGroupName "myapp123" `
    -TemplateFile .\template.json -Verbose -location northeurope -workspaceLocation westeurope -applicationPrefix "myapp123" `
    -vmCount 2 -vmSize "Standard_D1_v2" -adminUsername "appadmin" -vnetAddressPrefix "10.1.0.0/24" -subnetAddressPrefix "10.1.0.0/24"
```