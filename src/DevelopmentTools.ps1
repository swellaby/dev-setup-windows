. $PSScriptRoot/ToolManager.ps1

function Install-VSCode()
{
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingInvokeExpression', '', Justification='Trusted script for execution')]
    param(
        [bool]$installVSCodeExtensions
    )

    Write-Output 'Installing Visual Studio Code...'
    Install-Tool 'vscode'


    if ($installVSCodeExtensions)
    {
        if (-NOT (Get-Command 'code' -ErrorAction SilentlyContinue))
        {
            $env:Path += ';C:\Program Files\Microsoft VS Code\bin;C:\Program Files (x86)\Microsoft VS Code\bin'
            RefreshEnv
        }

        $recommendedExtensions = @(
            'swellaby.python-pack',
            'swellaby.node-pack',
            'swellaby.rust-pack',
            'swellaby.common-pack',
            'robertohuertasm.vscode-icons',
            'ms-vscode.csharp',
            'ms-azuretools.vscode-docker',
            'ms-vscode.Go',
            'ms-vscode.PowerShell',
            'vscjava.vscode-java-pack',
            'ms-vsts.team',
            'msazurermtools.azurerm-vscode-tools',
            'ms-azuretools.vscode-bicep'
        )

        foreach ($recommendedExtension in $recommendedExtensions)
        {
            Write-Output "Installing VS Code Extension: $recommendedExtension"
            Invoke-Expression "code --install-extension $recommendedExtension"
        }
    }
}

function Install-VisualStudio([bool]$installEnterpriseEdition)
{
    $params = "--package-parameters `"--add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.Universal --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.WebCrossPlat`""
    $toolName = ''
    $versionName = ''

    if ($installEnterpriseEdition)
    {
        $versionName = 'Enterprise'
        $toolName = 'visualstudio2019enterprise'
    }
    else
    {
        $versionName = 'Community'
        $toolName = 'visualstudio2019community'
    }

    Write-Output "Installing Visual Studio 2019 $versionName..."
    Install-Tool "$toolName $params"
}

function Install-IntelliJ([bool]$installEnterpriseEdition)
{
    if ($installEnterpriseEdition)
    {
        Write-Output 'Installing IntelliJ Enterprise...'
        Install-Tool 'intellijidea-enterprise'
    }
    else
    {
        Write-Output 'Installing IntelliJ Community...'
        Install-Tool 'intellijidea-community'
    }
}

function Install-Git()
{
    Write-Output 'Installing git...'
    Install-Tool 'git'
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
        [bool]$installGit
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
}
