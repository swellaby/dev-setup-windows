function Install-GCPCommandLineTools()
{
    Write-Host "Installing the Google Cloud SDK"
    Install-Tool 'gcloudsdk'
}

function Install-AWSCommandLineTools()
{
    Write-Host "Installing the AWS CLI"
    Install-Tool 'awscli'
}

function Install-AzureCommandLineTools()
{
    Write-Host "Installing the Azure CLI 2.0"
    Install-Tool 'azure-cli'
}

function Install-CloudTools()
{

}
