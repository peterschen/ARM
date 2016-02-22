<<<<<<< HEAD
# Azure Resource Manager Templates
This project contains various examples which can be used for educational and demonstration purposes. The examples aim to cover the fundamental concepts of Azure Resource Manager in a progressive way. The examples build up to demonstrating the capabilites of Azure Resource Manager when used to deploy complex, dependent end-to-end services.

This solution is structured in projects, each covering a specific deployment type or state. 

* [00 Basics](./00-Basics.md)
  * 00.01 Template semantics
  * 00.02 Template functions
  * 00.03 Template expressions
* [01 IaaS](./01-IaaS.md)
  * 01.01 Storage
  * 01.02 Virtual Network (VNet)
  * 01.03 Public IP (PIP)
  * 01.04 Network Interface Card (NIC)
  * 01.04 Virtual Machine (VM)
* [02 PaaS](./02-PaaS.md)
  * 02.01 Web App (Stand-alone)
  * 02.02 SQL Database
  * 02.03 Web App (Tiered)
* 03 Service (Simple)
* 04 Service (Complex)
* 05 ???
=======
# Azure Resource Manager
This project contains various examples which can be used for educational and demonstration purposes. The examples aim to cover the fundamental concepts of Azure Resource Manager in a progressive way. The examples build up to demonstrating the capabilites of Azure Resource Manager when used to deploy complex, dependent end-to-end services.

This solution is structured in projects, each covering a specific deployment type or state. 

* 00 Basics
* 01 IaaS
* 02 PaaS
* 03 ???
* 04 ???
* 05 ???

## 01 IaaS
This project contains the Azure Resource Manager template to deploy a single virtual machine. 

### 01 Storage Account
Change to the template directory
`cd D:\20-Projects\BMW-ARM\01-IaaS\Templates;`

Create a new Resource Group in which to deploy the artifacts required for this template
`New-AzureRmResourceGroup -Name "BMW-01-IaaS" -Location "NorthEurope" -Verbose;`

Start the template deployment with a Template Parameter File
``New-AzureRmResourceGroupDeployment -Name "01-IaaS-01-Storage-$(Get-Date -Format "yyMMdd-Hs")" -TemplateFile .\01-Storage.json -ResourceGroupName "BMW-01-IaaS" -Verbose;`

### 02 Virtual Network (VNet)
Change to the template directory
`cd D:\20-Projects\BMW-ARM\01-IaaS\Templates;`

Create a new Resource Group in which to deploy the artifacts required for this template
`New-AzureRmResourceGroup -Name "BMW-01-IaaS" -Location "NorthEurope" -Verbose;`

Start the template deployment with a Template Parameter File
``New-AzureRmResourceGroupDeployment -Name "01-IaaS-02-VNet-$(Get-Date -Format "yyMMdd-Hs")" -TemplateFile .\02-VNet.json -ResourceGroupName "BMW-01-IaaS" -Verbose;`

### 03 Network Interface Card (NIC)
Change to the template directory
`cd D:\20-Projects\BMW-ARM\01-IaaS\Templates;`

Create a new Resource Group in which to deploy the artifacts required for this template
`New-AzureRmResourceGroup -Name "BMW-01-IaaS" -Location "NorthEurope" -Verbose;`

Start the template deployment with a Template Parameter File
`New-AzureRmResourceGroupDeployment -Name "01-IaaS-03-PIP-$(Get-Date -Format "yyMMdd-Hs")" -TemplateFile .\03-PIP.json -TemplateParameterFile .\03-PIP.parameters.json -ResourceGroupName "BMW-01-IaaS" -Verbose;`

Start the template deployment by passing required arguments
`New-AzureRmResourceGroupDeployment -Name "01-IaaS-03-PIP-$(Get-Date -Format "yyMMdd-Hs")" -TemplateFile .\03-PIP.json  -ResourceGroupName "BMW-01-IaaS" -Verbose -dnsPrefix "bmw-01-iaas";`

### 04 Network Interface Card (NIC)
Change to the template directory
`cd D:\20-Projects\BMW-ARM\01-IaaS\Templates;`

Create a new Resource Group in which to deploy the artifacts required for this template
`New-AzureRmResourceGroup -Name "BMW-01-IaaS" -Location "NorthEurope" -Verbose;`

Start the template deployment with a Template Parameter File
``New-AzureRmResourceGroupDeployment -Name "01-IaaS-04-NIC-$(Get-Date -Format "yyMMdd-Hs")" -TemplateFile .\04-NIC.json -ResourceGroupName "BMW-01-IaaS" -Verbose;`

### 04 Virtual Machine (VM)
Change to the template directory
`cd D:\20-Projects\BMW-ARM\01-IaaS\Templates;`

Create a new Resource Group in which to deploy the artifacts required for this template
`New-AzureRmResourceGroup -Name "BMW-01-IaaS" -Location "NorthEurope" -Verbose;`

Start the template deployment with a Template Parameter File
`New-AzureRmResourceGroupDeployment -Name "01-IaaS-VM-$(Get-Date -Format "yyMMdd-Hs")" -TemplateFile .\05-VM.json -TemplateParameterFile .\05-VM.parameters.json -ResourceGroupName "BMW-01-IaaS" -Verbose;`

Start the template deployment by passing required arguments
$adminCredentials = Get-Credential -Message "Administrative credentials for the virtual machine"
`New-AzureRmResourceGroupDeployment -Name "01-IaaS-VM-$(Get-Date -Format "yyMMdd-Hs")" -TemplateFile .\05-VM.json -TemplateParameterFile .\05-VM.parameters.json -ResourceGroupName "BMW-01-IaaS" -Verbose -adminUsername $adminCredentials.UserName -adminPassword $adminCredentials.Password -dnsPrefix "bmw-01-iaas" -windowsVersion "Windows-Server-Technical-Preview;`
>>>>>>> c6493ae... Added IaaS templates
