. $PSScriptRoot/ToolManager.ps1

function Install-MSTeams()
{
    Install-Tool 'microsoft-teams'
}

function Install-Slack()
{
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
