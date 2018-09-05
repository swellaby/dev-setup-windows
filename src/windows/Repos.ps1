function Initialize-DevWorkspaceRoot([string]$rootDirectoryPath)
{
    if (-NOT (Test-Path $rootDirectoryPath))
    {
        New-Item $rootDirectoryPath -ItemType Directory
    }
}

function Get-SwellabyGitHubRepos([bool]$cloneSwellabyRepos, [string]$rootDirectoryPath)
{
    if ($cloneSwellabyRepos)
    {
        Initialize-DevWorkspaceRoot $rootDirectoryPath
        Set-Location $rootDirectoryPath
        git clone https://github.com/swellaby/generator-swell.git
        git clone https://github.com/swellaby/vsts-bump.git
        git clone https://github.com/swellaby/vsts-mirror-git-repository.git
        git clone https://github.com/swellaby/vsts-traffic-monitor.git
        git clone https://github.com/swellaby/captain-githook.git
        git clone https://github.com/swellaby/get-package-version.git
        git clone https://github.com/swellaby/slashhandler.git
        git clone https://github.com/swellaby/ng-blocks.git
        git clone https://github.com/swellaby/lyrical-greetings-api.git
        git clone https://github.com/swellaby/gulp-vsts-bump.git
        git clone https://github.com/swellaby/nyc-config.git
        git clone https://github.com/swellaby/eslint-config.git
        git clone https://github.com/swellaby/tslint-config.git
    }
}
