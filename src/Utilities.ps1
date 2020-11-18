. $PSScriptRoot/ToolManager.ps1

function Install-MobaXterm()
{
    Write-Output 'Installing MobaXterm...'
    Install-Tool 'mobaxterm'
}

function Install-7Zip()
{
    Write-Output 'Installing 7Zip...'
    Install-Tool '7zip'
}

function Install-Spotify()
{
    Write-Output 'Installing Spotify...'
    Install-Tool 'spotify'
}

function Install-Utilities
{
    param (
        [bool]$installMobaXterm,
        [bool]$install7zip,
        [bool]$installSpotify
    )

    if ($installMobaXterm)
    {
        Install-MobaXterm
    }

    if ($install7zip)
    {
        Install-7Zip
    }

    if ($installSpotify)
    {
        Install-Spotify
    }
}
