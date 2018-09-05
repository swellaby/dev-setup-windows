function Install-MSTeams()
{
    cinst -vy microsoft-teams
    RefreshEnv
}

function Install-Slack()
{
    cinst -vy slack
    RefreshEnv
}

function Install-CollaborationTools([bool]$installMSTeams, [bool]$installSlack)
{
    if ($installMSTeams)
    {
        Install-MSTeams()
    }

    if ($installSlack)
    {
        Install-Slack()
    }
}
