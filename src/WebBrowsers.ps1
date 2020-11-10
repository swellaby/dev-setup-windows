. $PSScriptRoot/ToolManager.ps1


function Install-Chrome
{
    Write-Output 'Installing Chrome...'
    Install-Tool 'googlechrome'
}

function Install-Firefox
{
    Write-Output 'Installing Firefox...'
    Install-Tool 'firefox'
}

function Install-WebBrowsers
{
    param (
        [bool]$installChrome,
        [bool]$installFirefox
    )

    if ($installChrome)
    {
        Install-Chrome
    }

    if ($installFirefox)
    {
        Install-Firefox
    }
}
