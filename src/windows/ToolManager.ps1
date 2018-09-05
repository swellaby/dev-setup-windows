function Install-Tool([string]$toolArgs)
{
    cinst -v $toolArgs
    RefreshEnv
}

function Upgrade-Tool([string]$toolArgs)
{
    choco upgrade -y $toolArgs
    RefreshEnv
}

function Tool-Exists([string]$tool)
{
    if (-NOT (Get-Command "$tool" -ErrorAction SilentlyContinue))
    {
        return $False
    }
    else
    {
        return $True
    }
}
