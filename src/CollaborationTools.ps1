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
