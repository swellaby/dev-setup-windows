param (
    [string]$foo = "bar"
)

$CurrentIdentity = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-NOT $CurrentIdentity.IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
{
    Write-Host 'This script must be run with Administrative permissions on Windows. Attempting to re-start with required permissions...'
    # I am sure there is a better way to be able to utilize splatting here, but this will work for now.
    $params = Invoke-Expression "echo @PSBoundParameters"
    Start-Process -FilePath powershell.exe -WorkingDirectory $PSScriptRoot -Verb RunAs -ArgumentList "-NoExit -File `"$PSCommandPath`" $params"
    Exit
}

if (-NOT (Get-Command 'choco' -ErrorAction SilentlyContinue))
{
    Write-Host 'Chocolatey NuGet not found. Installing now...'
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    RefreshEnv
}

# Dot source all windows ps1 files
# Install-ProgrammingFrameworks @PSBoundParameters
# Install-DevelopmentTools @PSBoundParameters
# Install-CollaborationTools @PSBoundParameters
