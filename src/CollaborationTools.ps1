. $PSScriptRoot/ToolManager.ps1

function Install-MSTeams()
{
    Write-Output 'Installing Microsoft Teams...'
    Install-Tool 'microsoft-teams'
}

function Install-Slack()
{
    Write-Output 'Installing Slack...'
    Install-Tool 'slack'
}

function Install-Discord()
{
    Write-Output 'Installing Discord...'
    Install-Tool 'discord'
}

function Install-CollaborationTools(
    [bool]$installMSTeams,
    [bool]$installSlack,
    [bool]$installDiscord
)
{
    if ($installMSTeams)
    {
        Install-MSTeams
    }

    if ($installSlack)
    {
        Install-Slack
    }

    if ($installDiscord)
    {
        Install-Discord
    }
}
