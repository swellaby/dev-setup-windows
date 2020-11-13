[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingInvokeExpression', '', Justification='Trusted script for execution')]
param (
    [bool]$InstallDotnetCore = $True,
    [bool]$InstallDotnetFramework = $False,
    [bool]$InstallGolang = $True,
    [bool]$InstallJava = $True,
    [bool]$InstallOpenJDK = $True,
    [ValidateSet(8,10,11)][int]$JDKVersion = 10,
    [bool]$InstallMaven = $True,
    [bool]$InstallGradle = $True,
    [bool]$InstallNodejs = $True,
    [bool]$InstallPython = $True,
    [bool]$IncludePython2x = $True,
    [bool]$InstallVSCode = $True,
    [bool]$InstallVSCodeExtensions= $True,
    [bool]$InstallVisualStudio = $True,
    [bool]$InstallVSEnterpriseVersion = $False,
    [bool]$InstallIntelliJ = $False,
    [bool]$InstallIntelliJEnterpriseVersion   = $False,
    [bool]$InstallGit = $True,
    [bool]$InstallMobaXterm = $True,
    [bool]$Install7zip = $True,
    [bool]$InstallGCPCommandLineTools = $True,
    [bool]$InstallAWSCommandLineTools = $True,
    [bool]$InstallAzureCommandLineTools = $True,
    [bool]$InstallChrome = $True,
    [bool]$InstallFirefox = $True,
    [bool]$InstallMSTeams = $True,
    [bool]$InstallSlack = $True,
    [bool]$CloneSwellabyRepos = $False,
    [string]$DevWorkspaceRootDirectory = 'c:/dev'
)

$CurrentIdentity = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-NOT $CurrentIdentity.IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
{
    Write-Output 'This script must be run with Administrative permissions on Windows'
    Write-Output 'Please re-execute this script from an Administrative context. Exiting in 3 seconds....'
    Start-Sleep -Seconds 3
    Exit
}

if (-NOT (Get-Command 'choco' -ErrorAction SilentlyContinue))
{
    Write-Output 'Chocolatey NuGet not found. Installing now...'
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    RefreshEnv
}

(Get-ChildItem -Path "$((Get-Item $PSScriptRoot).FullName)/src/*" -Include "*.ps1" -Exclude "ToolManager.ps1" )| ForEach-Object {
    . $_.FullName
}

Install-Utilities $InstallMobaXterm $Install7zip
Install-ProgrammingFrameworks $InstallDotnetCore $InstallDotnetFramework $InstallGolang $InstallJava $InstallOpenJDK $JDKVersion $InstallMaven $InstallGradle $InstallNodejs $InstallPython $IncludePython2x
Install-DevelopmentTools $InstallVSCode $InstallVSCodeExtensions $InstallVisualStudio $InstallVSEnterpriseVersion $InstallIntelliJ $InstallIntelliJEnterpriseVersion $InstallGit
Install-CloudTools $InstallGCPCommandLineTools $InstallAWSCommandLineTools $InstallAzureCommandLineTools
Install-CollaborationTools $InstallMSTeams $InstallSlack
Install-WebBrowsers $InstallChrome $InstallFirefox
Get-SwellabyGitHubRepos -cloneSwellabyRepos: $CloneSwellabyRepos -rootDirectoryPath: $DevWorkspaceRootDirectory
