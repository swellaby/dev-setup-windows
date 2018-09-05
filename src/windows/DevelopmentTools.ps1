. $PSScriptRoot/ToolManager.ps1

function Install-VSCode([bool]$installVSCodeExtensions)
{
    Write-Host "Installing Visual Studio Code..."
    Install-Tool 'vscode'
    # $env:Path += ';C:\Program Files\Microsoft VS Code\bin;C:\Program Files (x86)\Microsoft VS Code\bin'

    # if ($installVSCodeExtensions)
    # {
    #     foreach ($recommendedExtension in $recommendedExtensions)
    #     {
    #         Write-Host "Installing VS Code Extension: $recommendedExtension"
    #         # Use iex here as sometimes this errors when an ext already exists
    #         Invoke-Expression "code --install-extension $recommendedExtension"
    #     }
    # }
}

function Install-VisualStudio([bool]$installEnterpriseEdition)
{
    if ($installEnterpriseEdition)
    {
        Write-Host "Installing Visual Studio 2017 Enterprise..."
        Install-Tool 'visualstudio2017enterprise'
    }
    else
    {
        Write-Host "Installing Visual Studio 2017 Community..."
        Install-Tool 'visualstudio2017community'
    }
}

function Install-IntelliJ([bool]$installEnterpriseEdition)
{
    if ($installEnterpriseEdition)
    {
        Write-Host "Installing IntelliJ Enterprise..."
        Install-Tool 'intellijidea-enterprise'
    }
    else
    {
        Write-Host "Installing IntelliJ Community..."
        Install-Tool 'intellijidea-community'
    }
}

function Install-Git()
{
    Write-Host "Installing git..."
    Install-Tool 'git'
}

function Install-MobaXterm()
{
    Write-Host "Installing MobaXterm..."
    Install-Tool 'mobaxterm'
}

function Install-7Zip()
{
    Write-Host "Installing 7Zip..."
    Install-Tool '7zip'
}

function Install-DevelopmentTools
{
    param (
        [bool]$installVSCode,
        [bool]$installVSCodeExtensions,
        [bool]$installVisualStudio,
        [bool]$installVSEnterpriseVersion,
        [bool]$installIntelliJ,
        [bool]$installIntelliJEnterpriseVersion,
        [bool]$installGit,
        [bool]$installMobaXterm,
        [bool]$install7zip
    )

    if ($installVSCode)
    {
        Install-VSCode $installVSCodeExtensions
    }

    if ($installVisualStudio)
    {
        Install-VisualStudio $installVSEnterpriseVersion
    }

    if ($installIntelliJ)
    {
        Install-IntelliJ $installIntelliJEnterpriseVersion
    }

    if ($installGit)
    {
        Install-Git
    }

    if ($installMobaXterm)
    {
        Install-MobaXterm
    }

    if ($install7zip)
    {
        Install-7Zip
    }
}
