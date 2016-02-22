# 02 PaaS
This project contains a Azure Resource Manager template to deploy a PaaS application. 

## 02.01 Web App (Stand-Alone)
Create a new Resource Group in which to deploy the artifacts required for this template
```
New-AzureRmResourceGroup -Name "ArmTemplates-02-PaaS" `
    -Location "NorthEurope" `
    -Verbose;
```

Start the template deployment with a Template Parameter File
```
$output = New-AzureRmResourceGroupDeployment -Name "02-PaaS-01-WebApp-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/02-PaaS/Templates/01-WebApp.json `
    -TemplateParameterUri https://raw.githubusercontent.com/peterschen/ARM/master/02-PaaS/Templates/01-WebApp.parameters.json `
    -ResourceGroupName "ArmTemplates-02-PaaS" `
    -Verbose;
```

Open a browser and display the installed site extionsions
```
[System.Diagnostics.Process]::Start("$output.Outputs.url.Value/Dev/");
[System.Diagnostics.Process]::Start("$output.Outputs.url.Value/filecounterMVC/");
```

Start the template deployment by passing required arguments
```
$output = New-AzureRmResourceGroupDeployment -Name "02-PaaS-01-WebApp-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/02-PaaS/Templates/01-WebApp.json `
    -ResourceGroupName "ArmTemplates-02-PaaS" `
    -Verbose `
    -webSiteName "at-02-paas"
```

Open a browser and display the installed site extionsions
```
[System.Diagnostics.Process]::Start("$output.Outputs.url.Value/Dev/");
[System.Diagnostics.Process]::Start("$output.Outputs.url.Value/filecounterMVC/");
```

## 02.02 SQL Database
Create a new Resource Group in which to deploy the artifacts required for this template
```
New-AzureRmResourceGroup -Name "ArmTemplates-02-PaaS" `
    -Location "NorthEurope" `
    -Verbose;
```

Start the template deployment with a Template Parameter File
```
New-AzureRmResourceGroupDeployment -Name "02-PaaS-02-SQL-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://github.com/peterschen/ARM/blob/master/02-PaaS/Templates/02-SQL.json `
    -TemplateParameterUri https://github.com/peterschen/ARM/blob/master/02-PaaS/Templates/02-SQL.parameters.json `
    -ResourceGroupName "ArmTemplates-02-PaaS" `
    -Verbose;
```

Start the template deployment by passing required arguments
```
$adminPassword = ConvertTo-SecureString -String "Admin123" -AsPlainText -Force;
New-AzureRmResourceGroupDeployment -Name "02-PaaS-02-SQL-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://github.com/peterschen/ARM/blob/master/02-PaaS/Templates/02-SQL.json `
    -ResourceGroupName "ArmTemplates-02-PaaS" `
    -Verbose `
    -adminUsername "labadmin" `
    -adminPassword $adminPassword `
    -databaseName "at-02-paas"
```

## 02.03 Web App (Tiered)
Create a new Resource Group in which to deploy the artifacts required for this template
```
New-AzureRmResourceGroup -Name "ArmTemplates-02-PaaS" `
    -Location "NorthEurope" `
    -Verbose;
```

Start the template deployment with a Template Parameter File
```
$output = New-AzureRmResourceGroupDeployment -Name "02-PaaS-03-WebApp-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/02-PaaS/Templates/03-WebApp.json `
    -TemplateParameterUri https://raw.githubusercontent.com/peterschen/ARM/master/02-PaaS/Templates/03-WebApp.parameters.json `
    -ResourceGroupName "ArmTemplates-02-PaaS" `
    -Verbose;
```

Open a browser and display the installed site extionsions
```
[System.Diagnostics.Process]::Start("$($output.Outputs.url.Value)/Dev/");
[System.Diagnostics.Process]::Start("$($output.Outputs.url.Value)/filecounterMVC/");
```

Start the template deployment by passing required arguments
```
$output = New-AzureRmResourceGroupDeployment -Name "02-PaaS-03-WebApp-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/02-PaaS/Templates/03-WebApp.json `
    -ResourceGroupName "ArmTemplates-02-PaaS" `
    -Verbose `
    -adminUsername "labadmin" `
    -adminPassword $adminPassword `
    -databaseName "at-02-paas" `
    -webSiteName "at-02-paas"
```

Open a browser and display the installed site extionsions
```
[System.Diagnostics.Process]::Start("$($output.Outputs.url.Value)/Dev/");
[System.Diagnostics.Process]::Start("$($output.Outputs.url.Value)/filecounterMVC/");
```