func Install-Tool ($tool)
{
    if ($IsWindows)
    {
        cinst -vy $tool
    }
    elseif ($IsMacOS)
    {
        brew cask $tool
    }
    else
    {

    }
}
