function Install-Tool() {
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingInvokeExpression', '', Justification = 'Trusted script for execution')]
    param (
        [string]$toolArgs
    )
    Invoke-Expression "cinst -y $toolArgs"
    RefreshEnv
}

function Update-Tool([string]$toolArgs) {
    choco upgrade -y $toolArgs
    RefreshEnv
}

function Test-ToolExists([string]$tool) {
    if (-NOT (Get-Command "$tool" -ErrorAction SilentlyContinue)) {
        return $False
    }
    else {
        return $True
    }
}
