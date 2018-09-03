param (

)

$CurrentIdentity = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-NOT $CurrentIdentity.IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
{
    throw 'This script must be run with Administrative permissions'
}

func Install-Chocolatey {
    if (-NOT (Get-Command 'choco' -ErrorAction SilentlyContinue))
    {
        Write-Host 'Chocolatey NuGet not found. Installing now...'
        Set-ExecutionPolicy Bypass -Scope Process -Force
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        RefreshEnv
    }
}
