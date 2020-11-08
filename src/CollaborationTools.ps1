. $PSScriptRoot/ToolManager.ps1

function Install-MSTeams()
{
    Write-Host 'Installing Microsoft Teams...'
    Install-Tool 'microsoft-teams'
}

function Install-Slack()
{
    Write-Host 'Installing Slack...'
    Install-Tool 'slack'
}

function Install-CollaborationTools([bool]$installMSTeams, [bool]$installSlack)
{
    if ($installMSTeams)
    {
        Install-MSTeams
    }

    if ($installSlack)
    {
        Install-Slack
    }
}
