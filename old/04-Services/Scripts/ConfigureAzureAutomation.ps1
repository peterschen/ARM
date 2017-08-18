[DscLocalConfigurationManager()]
Configuration ConfigureAzureAutomation
{
    param
    (
        [parameter(Mandatory = $true)]
        [string] $RegistrationUrl,

        [parameter(Mandatory = $true)]
        [pscredential] $RegistrationKey,
        
        [int] $RefreshFrequencyMins = 30,
        [int] $ConfigurationModeFrequencyMins = 15,
        [string] $ConfigurationMode = "ApplyAndMonitor",
        [string] $NodeConfigurationName,
        [boolean] $RebootNodeIfNeeded= $false,
        [string] $ActionAfterReboot = "ContinueConfiguration",
        [boolean] $AllowModuleOverwrite = $false,
        [string] $Timestamp = ""
    )

    if(!$RefreshFrequencyMins -or $RefreshFrequencyMins -eq "")
    {
        $RefreshFrequencyMins = 30
    }

    if(!$ConfigurationModeFrequencyMins -or $ConfigurationModeFrequencyMins -eq "")
    {
        $ConfigurationModeFrequencyMins = 15
    }

    if(!$ConfigurationMode -or $ConfigurationMode -eq "")
    {
        $ConfigurationMode = "ApplyAndMonitor"
    }

        if(!$ActionAfterReboot -or $ActionAfterReboot -eq "")
    {
        $ActionAfterReboot = "ContinueConfiguration"
    }

    if(!$NodeConfigurationName -or $NodeConfigurationName -eq "")
    { 
        $ConfigurationNames = $null
    }
    else
    {
        $ConfigurationNames = @($NodeConfigurationName)
    }  

    Settings
    {
        RefreshFrequencyMins = $RefreshFrequencyMins
        RefreshMode = "Pull"
        ConfigurationMode = $ConfigurationMode
        AllowModuleOverwrite  = $AllowModuleOverwrite
        RebootNodeIfNeeded = $RebootNodeIfNeeded
        ActionAfterReboot = $ActionAfterReboot
        ConfigurationModeFrequencyMins = $ConfigurationModeFrequencyMins
    }

    ConfigurationRepositoryWeb AzureAutomationDSC
    {
        ServerUrl = $RegistrationUrl
        RegistrationKey = $RegistrationKey.GetNetworkCredential().Password
        ConfigurationNames = $ConfigurationNames
    }

    ResourceRepositoryWeb AzureAutomationDSC
    {
        ServerUrl = $RegistrationUrl
        RegistrationKey = $RegistrationKey.GetNetworkCredential().Password
    }

    ReportServerWeb AzureAutomationDSC
    {
        ServerUrl = $RegistrationUrl
        RegistrationKey = $RegistrationKey.GetNetworkCredential().Password
    }
}