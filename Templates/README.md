# Templates #
These samples show the deployment/instrumentation of different services in Azure.

## Virtual Machine Scale Set w/OMS (Linux) ##
This sample shows how to deploy a Virtual Machine Scale set running Debian that includes an OMS agent on all nodes of the set.

### Usage ###
```
Write-Host -NoNewLine "SSH public key:";
$sshPublicKey = Read-Host;

Login-AzureRmAccount
New-AzureRmResourceGroup "myscaleset" -Location "northeurope"
New-AzureRmResourceGroupDeployment -Name $(Get-Date -Format "yyyyMMdd-hhmmss") -ResourceGroupName "myscaleset" `
    -TemplateFile .\vmss-linux-oms.json -Verbose -location northeurope -vmssName myscaleset -vmSku "Standard_d1_v2" `
    -adminUsername "labadmin" -instanceCount 2 -singlePlacementGroup "true" -sshPublicKey $sshPublicKey `
    -ipAllocationMethod "dynamic" -pipName "myscaleset-ip" -pipLabel "asjhdjahsd"
```