function Install-VSCode([bool]$installVSCodeExtensions)
{
    cinst -vy vscode
    RefreshEnv
    # Explicitly update path variables here as they don't always get picked up for some reason
    # $env:PATH...

    if ($installVSCodeExtensions)
    {
        # iterate through list of extensions and install each
        # Use iex here as sometimes this errors when an ext already exists
        Invoke-Expression "code --install-extension "
    }
}

function Install-VisualStudio([bool]$installEnterpriseEdition)
{
    if ($installEnterpriseEdition)
    {
        cinst -vy visualstudio2017enterprise
    }
    else
    {
        cinst -vy visualstudio2017community
    }

    RefreshEnv
}

function Install-IntelliJ([bool]$installEnterpriseEdition)
{
    if ($installEnterpriseEdition)
    {
        cinst -vy intellijidea-community
    }
    else
    {
        cinst -vy intellijidea-community
    }

    RefreshEnv
}

function Install-Git()
{
    cinst -vy git
    RefreshEnv
}

function Install-MobaXterm()
{
    cinst -vy mobaxterm
    RefreshEnv
}

function Install-7Zip()
{
    cinst -vy 7zip
    RefreshEnv
}

function Install-DevelopmentTools()
{

}
