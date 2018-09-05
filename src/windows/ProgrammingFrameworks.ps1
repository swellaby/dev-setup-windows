. $PSScriptRoot/ToolManager.ps1

function Install-DotnetCore()
{

}

function Install-Nodejs()
{

}

function Install-Golang()
{

}

function Install-Python()
{

}

function Install-Java()
{

}

function Install-ProgrammingFrameworks
{
    param (
        [bool]$installDotnetCore,
        [bool]$installDotnetFramework,
        [bool]$installGolang,
        [bool]$installJava,
        [bool]$installOpenJDK,
        [ValidateSet(8,10,11)][int]$jdkVersion,
        [bool]$installMaven,
        [bool]$installGradle,
        [bool]$installNodejs,
        [bool]$installPython
    )
}
