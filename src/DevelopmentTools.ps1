. $PSScriptRoot/ToolManager.ps1

function Install-VSCode([bool]$installVSCodeExtensions)
{
    Write-Host 'Installing Visual Studio Code...'
    Install-Tool 'vscode'


    if ($installVSCodeExtensions)
    {
        if (-NOT (Get-Command 'code' -ErrorAction SilentlyContinue))
        {
            $env:Path += ';C:\Program Files\Microsoft VS Code\bin;C:\Program Files (x86)\Microsoft VS Code\bin'
            RefreshEnv
        }

        $recommendedExtensions = @(
            'ms-python.python',
            'msjsdiag.debugger-for-chrome',
            'dbaeumer.vscode-eslint',
            'eamodio.gitlens',
            'eg2.tslint',
            'robertohuertasm.vscode-icons',
            'ms-vscode.csharp',
            'PeterJausovec.vscode-docker',
            'ms-vscode.Go',
            'ms-vscode.PowerShell',
            'EditorConfig.EditorConfig',
            'vscjava.vscode-java-pack',
            'streetsidesoftware.code-spell-checker',
            'christian-kohler.path-intellisense',
            'ms-vsts.team',
            'pflannery.vscode-versionlens'
        )

        foreach ($recommendedExtension in $recommendedExtensions)
        {
            Write-Host "Installing VS Code Extension: $recommendedExtension"
            # Use iex here as sometimes this errors when an ext already exists
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
        $toolName = 'visualstudio2017enterprise'
    }
    else
    {
        $versionName = 'Community'
        $toolName = 'visualstudio2017community'
    }

    Write-Host "Installing Visual Studio 2017 $versionName..."
    Install-Tool "$toolName $params"
}

function Install-IntelliJ([bool]$installEnterpriseEdition)
{
    if ($installEnterpriseEdition)
    {
        Write-Host 'Installing IntelliJ Enterprise...'
        Install-Tool 'intellijidea-enterprise'
    }
    else
    {
        Write-Host 'Installing IntelliJ Community...'
        Install-Tool 'intellijidea-community'
    }
}

function Install-Git()
{
    Write-Host 'Installing git...'
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
