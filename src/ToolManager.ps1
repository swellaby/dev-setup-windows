function Install-Tool() {
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingInvokeExpression', '', Justification = 'Trusted script for execution')]
    param (
        [string]$toolArgs
    )
    # Timeout value is in seconds
    # Increase to 3 hours due to the long install periods
    # for things like IDEs and build tools.
    Invoke-Expression "cinst -y $toolArgs --timeout 10800"
    RefreshEnv
}

function Update-Tool() {
    [CmdletBinding(SupportsShouldProcess = $True)]
    param(
        [string]$toolArgs
    )

    choco upgrade -y $toolArgs
    RefreshEnv

    # Not exposed externally and What-If/Confirm not supported internally
    # So just a no-op here to satiate PSAnalyzer
    $PSCmdlet.ShouldProcess()
}

function Test-ToolExists([string]$tool) {
    if (-NOT (Get-Command "$tool" -ErrorAction SilentlyContinue)) {
        return $False
    }
    else {
        return $True
    }
}
