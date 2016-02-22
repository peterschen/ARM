# 03 Advanced Template Designs
This project contains a Azure Resource Manager template which demonstrates template linkage and a simple decision tree to deploy identical resource types with different characteristics based on user input. 

## 03.01 Template Linkage & Decision Tree
Create a new Resource Group in which to deploy the artifacts required for this template
```
New-AzureRmResourceGroup -Name "ArmTemplates-03-AdvancedTemplateDesigns" `
    -Location "NorthEurope" `
    -Verbose;
```

Start the template deployment with a Template Parameter File
```
New-AzureRmResourceGroupDeployment -Name "02-AdvancedTemplateDesigns-01-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateUri https://raw.githubusercontent.com/peterschen/ARM/master/03-AdvancedTemplateDesigns/Templates/01.01-Master.json `
    -TemplateParameterUri hhttps://raw.githubusercontent.com/peterschen/ARM/master/03-AdvancedTemplateDesigns/Templates/01.01-Master.parameters.json `
    -ResourceGroupName "ArmTemplates-03-AdvancedTemplateDesigns" `
    -Verbose;
```

Start the template deployment by passing required arguments
```
New-AzureRmResourceGroupDeployment -Name "02-AdvancedTemplateDesigns-01-$(Get-Date -Format "yyMMdd-Hs")" `
    -TemplateFileUri https://raw.githubusercontent.com/peterschen/ARM/master/03-AdvancedTemplateDesigns/Templates/01.01-Master.json `
    -ResourceGroupName "ArmTemplates-03-AdvancedTemplateDesigns" `
    -Verbose `
    
```