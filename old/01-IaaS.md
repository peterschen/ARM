# 01 IaaS
This project contains a Azure Resource Manager template to deploy a single virtual machine. 

## 01.01 Storage Account
Create a new Resource Group in which to deploy the artifacts required for this template
```
New-AzureRmResourceGroup -Name "ArmTemplates-01-IaaS" `
    -Location "NorthEurope" `
    -Verbose;
```

Start the template deployment
```
New-AzureRmResourceGroupDeployment -Name "01-IaaS-01-Storage-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/01-Storage.json `
    -ResourceGroupName "ArmTemplates-01-IaaS" `
    -Verbose;
```

## 01.02 Virtual Network (VNet)
Create a new Resource Group in which to deploy the artifacts required for this template
```
New-AzureRmResourceGroup -Name "ArmTemplates-01-IaaS" `
    -Location "NorthEurope" `
    -Verbose;
```

Start the template deployment
```
New-AzureRmResourceGroupDeployment -Name "01-IaaS-02-VNet-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/02-VNet.json `
    -ResourceGroupName "ArmTemplates-01-IaaS" `
    -Verbose;
```

## 01.03 Public IP (PIP)
Create a new Resource Group in which to deploy the artifacts required for this template
```
New-AzureRmResourceGroup -Name "ArmTemplates-01-IaaS" `
    -Location "NorthEurope" `
    -Verbose;
```

Start the template deployment with a Template Parameter File
```
New-AzureRmResourceGroupDeployment -Name "01-IaaS-03-PIP-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/03-PIP.json `
    -TemplateParameterUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/03-PIP.parameters.json `
    -ResourceGroupName "ArmTemplates-01-IaaS" `
    -Verbose;
```

Start the template deployment by passing required arguments
```
New-AzureRmResourceGroupDeployment -Name "01-IaaS-03-PIP-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/03-PIP.json `
    -ResourceGroupName "ArmTemplates-01-IaaS" `
    -Verbose `
    -dnsPrefix "at-01-iaas";
```

## 01.04 Network Interface Card (NIC)
Create a new Resource Group in which to deploy the artifacts required for this template
```
New-AzureRmResourceGroup -Name "ArmTemplates-01-IaaS" `
    -Location "NorthEurope" `
    -Verbose;
```

Start the template deployment with a Template Parameter File
```
New-AzureRmResourceGroupDeployment -Name "01-IaaS-04-NIC-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/04-NIC.json `
    -TemplateParameterUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/04-NIC.parameters.json `
    -ResourceGroupName "ArmTemplates-01-IaaS" `
    -Verbose;
```

Start the template deployment by passing required arguments
```
New-AzureRmResourceGroupDeployment -Name "01-IaaS-04-NIC-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/04-NIC.json `
    -ResourceGroupName "ArmTemplates-01-IaaS" `
    -Verbose `
    -dnsPrefix "at-01-iaas";
```

## 01.05 Virtual Machine (VM)
Create a new Resource Group in which to deploy the artifacts required for this template
```
New-AzureRmResourceGroup -Name "ArmTemplates-01-IaaS" `
    -Location "NorthEurope" `
    -Verbose;
```

Start the template deployment with a Template Parameter File
```
New-AzureRmResourceGroupDeployment -Name "01-IaaS-VM-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/05-VM.json `
    -TemplateParameterUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/05-VM.parameters.json `
    -ResourceGroupName "ArmTemplates-01-IaaS" `
    -Verbose;
```

Start the template deployment by passing required arguments
```
$adminPassword = ConvertTo-SecureString -String "Admin123" -AsPlainText -Force;
New-AzureRmResourceGroupDeployment -Name "01-IaaS-VM-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/01-IaaS/Templates/05-VM.json `
    -ResourceGroupName "ArmTemplates-01-IaaS" `
    -Verbose `
    -adminUsername "labadmin" `
    -adminPassword $adminPassword `
    -dnsPrefix "at-01-iaas" `
    -windowsVersion "Windows-Server-Technical-Preview";
```