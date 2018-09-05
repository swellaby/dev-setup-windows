function Install-Tool([string]$toolArgs)
{
    Write-Host "cinst -vy $toolArgs"
    #RefreshEnv
}

function Upgrade-Tool([string]$toolArgs)
{
    choco upgrade -y $toolArgs
    RefreshEnv
}
