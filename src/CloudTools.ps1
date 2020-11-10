. $PSScriptRoot/ToolManager.ps1

function Install-GCPCommandLineTools()
{
    Write-Output 'Installing the Google Cloud SDK...'
    Install-Tool 'gcloudsdk'
}

function Install-AWSCommandLineTools()
{
    Write-Output 'Installing the AWS CLI...'
    Install-Tool 'awscli'
}

function Install-AzureCommandLineTools()
{
    Write-Output 'Installing the Azure CLI 2.0...'
    Install-Tool 'azure-cli'
}

function Install-CloudTools
{
    param (
        [bool]$installGCPCommandLineTools,
        [bool]$installAWSCommandLineTools,
        [bool]$installAzureCommandLineTools
    )

    if ($installGCPCommandLineTools)
    {
        Install-GCPCommandLineTools
    }

    if ($installAWSCommandLineTools)
    {
        Install-AWSCommandLineTools
    }

    if ($installAzureCommandLineTools)
    {
        Install-AzureCommandLineTools
    }
}
