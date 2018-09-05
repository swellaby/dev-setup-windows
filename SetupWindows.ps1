param (
    [bool]$installDotnetCore = $True,
    [bool]$installDotnetFramework = $False,
    [bool]$installGolang = $True,
    [bool]$installJava = $True,
    [bool]$installOpenJDK = $True,
    [ValidateSet(8,10,11)][int]$jdkVersion = 10,
    [bool]$installMaven = $True,
    [bool]$installGradle = $True,
    [bool]$installNodejs = $True,
    [bool]$installPython = $True,
    [bool]$includePython2x = $True,
    [bool]$installVSCode = $True,
    [bool]$installVSCodeExtensions = $True,
    [bool]$installVisualStudio = $True,
    [bool]$installVSEnterpriseVersion = $False,
    [bool]$installIntelliJ = $False,
    [bool]$installIntelliJEnterpriseVersion = $False,
    [bool]$installGit = $True,
    [bool]$installMobaXterm = $True,
    [bool]$install7zip = $True,
    [bool]$installGCPCommandLineTools = $True,
    [bool]$installAWSCommandLineTools = $True,
    [bool]$installAzureCommandLineTools = $True,
    [bool]$installChrome = $True,
    [bool]$installFirefox = $True,
    [bool]$installMSTeams = $True,
    [bool]$installSlack = $True,
    [bool]$cloneSwellabyRepos = $False,
    [string]$devWorkspaceRootDirectory = 'c:/dev'
)

$CurrentIdentity = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-NOT $CurrentIdentity.IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
{
    Write-Host 'This script must be run with Administrative permissions on Windows. Attempting to re-start with required permissions...'

    $args = "-NoExit -File `"$PSCommandPath`" "
    if ($PSBoundParameters.Keys.Count -gt 0)
    {
        # I am sure there is a cleaner way to utilize splatting here, but this will work for now.
        $args += Invoke-Expression "echo @PSBoundParameters"
    }

    Start-Process -FilePath powershell.exe -WorkingDirectory $PSScriptRoot -Verb RunAs -ArgumentList $args
    Exit
}

if (-NOT (Get-Command 'choco' -ErrorAction SilentlyContinue))
{
    Write-Host 'Chocolatey NuGet not found. Installing now...'
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    RefreshEnv
}

(Get-ChildItem -Path "$((Get-Item $PSScriptRoot).FullName)/src/windows/*" -Include "*.ps1" -Exclude "ToolManager.ps1" )| ForEach-Object {
    . $_.FullName
}

Install-Utilities $installMobaXterm $install7zip
Install-ProgrammingFrameworks $installDotnetCore $installDotnetFramework $installGolang $installJava $installOpenJDK $jdkVersion $installMaven $installGradle $installNodejs $installPython $includePython2x
Install-DevelopmentTools $installVSCode $installVSCodeExtensions $installVisualStudio $installVSEnterpriseVersion $installIntelliJ $installIntelliJEnterpriseVersion $installGit
Install-CloudTools $installGCPCommandLineTools $installAWSCommandLineTools $installAzureCommandLineTools
Install-CollaborationTools $installMSTeams $installSlack
Install-WebBrowsers $installChrome $installFirefox
Get-SwellabyGitHubRepos -cloneSwellabyRepos: $cloneSwellabyRepos -rootDirectoryPath: $devWorkspaceRootDirectory
