# dev-setup
Scripts and utilities for setting up a dev machine running Windows.

## Setup

### Pre-requisites
The only thing you need is the contents of this repo down to your local machine. 

If you already have git installed then you can just clone the repo:
```bash
git clone https://github.com/swellaby/dev-setup-windows.git
```

If not, then you can download a zip of the repo contents from the default  `main` branch at:
https://github.com/swellaby/dev-setup-windows/archive/main.zip

(note you can also use the GitHub UI if you prefer by going to https://github.com/swellaby/dev-setup-windows/ and then clicking the `Code` button and then `Download ZIP`).

**Be sure to extract the archive if you downloaded the zip file.**

### Prepare
Using a PowerShell terminal with admin/elevated permissions, navigate to the root directory containing the repository contents.

#### PowerShell Execution Policy
Ensure that the Windows PowerShell execution policy is configured to allow for scripts to be executed (the default values on Windows client OS prevent running any scripts). Setting the policy to `RemoteSigned` should suffice.

```powershell
Set-ExecutionPolicy RemoteSigned
```

#### Unblock Entry Script File
Since the script file was downloaded, make sure it is unblocked so that Windows will allow it to be executed:
```powershell
Unblock-File -Path .\SetupWindows.ps1
```

#### Firewall/Proxy
If you are on a machine behind a firewall or corporate proxy, make sure you configure the relevant proxy environment variables from the same PowerShell session before running the script.

You may want to utilize both `setx` _and_ `set` due to the nature of how the script executes

```powershell
setx no_proxy ...
setx http_proxy ...
setx https_proxy ...
set no_proxy=...
set http_proxy=...
set https_proxy=...
```

## Usage
Be sure to use an **admin/elevated session** to run the script

With all default parameters:
```powershell
.\SetupWindows.ps1
```

### Parameters
The script supports many parameters to allow you to control what is, and what is not, installed and configured on your system. To run the script with a non-default value, just include it in your script execution.

For example if you wanted to install legacy Python 2.x install and wanted the Enterprise edition of Visual Studio instead of Community:

```powershell
.\SetupWindows.ps1 -IncludePython2x $True -InstallVSEnterpriseVersion $True
```

|Name|Description|ParameterType|Default|Comments|
|:--|:--|:--|:--|:--|
|InstallDotnetCore|[Install .NET Core SDK][dotnet-core-install-docs]|Boolean|`$True`||
|InstallDotnetFramework|Install .NET Framework|Boolean|`$False`|Disabled by default since Visual Studio IDE install defaults to true, and that install includes .NET Framework|
|InstallGolang|[Install Go language][go-install-docs]|Boolean|`$True`||
|InstallJava|[Install JDK][java-jdk-install-docs]|Boolean|`$True`|
|InstallOpenJDK|Whether to use the OpenJDK instead of commercial |Boolean|`$True`||
|JDKVersion|Which JDK version to use, supported options: `8,10,11`|Int32|10||
|InstallMaven|[Install Apache Maven][maven-install-docs]|Boolean|`$True`|Can be installed independently of `InstallJava` parameter|
|InstallGradle|[Install Gradle][gradle-install-docs]|Boolean|`$True`|Can be installed independently of `InstallJava` parameter|
|InstallNodejs|[Install Node.js][nodejs-install-docs]|Boolean|`$True`||
|InstallPython|[Install Python (3.x)][python-install-docs]|Boolean|`$True`||
|IncludePython2x|Install legacy Python 2.x|Boolean|`$False`||
|InstallVSCode|[Install Visual Studio Code][vscode-install-docs]|Boolean|`$True`||
|InstallVSCodeExtensions|Install some common extensions for VS Code|Boolean|`$True`||
|InstallVisualStudio|[Install Visual Studio 2019 IDE][vs-install-docs]|Boolean|`$True`||
|InstallVSEnterpriseVersion|Whether to install the Enterprise version of Visual Studio instead of (free) Community|Boolean|`$False`|Set this to `$True` to install the Enterprise version, otherwise Community version would be installed if `-InstallVisualStudio` is `$True`|
|InstallIntelliJ|[Install IntelliJ IDE][intellij-install-docs]|Boolean|`$False`||
|InstallIntelliJUltimateVersion|Whether to install the Ultimate edition of IntelliJ instead of (free) Community edition.|Boolean|`$False`| Set this to `$True` to install the Ultimate edition, otherwise Community edition would be installed if `-InstallIntelliJ` is `$True`|
|InstallGit|[Install git][git-install-docs]|Boolean|`$True`||
|InstallMobaXterm|[Install MobaXterm (Home Edition)][mobaxterm-install-docs]|Boolean|`$True`||
|Install7zip|[Install 7ZIP][7zip-install-docs]|Boolean|`$True`||
|InstallGCPCommandLineTools|[Install Google Cloud SDK & CLI][gcloud-install-docs]|Boolean|`$True`||
|InstallAWSCommandLineTools|[Install AWS CLI][awscli-install-docs]|Boolean|`$True`||
|InstallAzureCommandLineTools|[Install Azure CLI][az-install-docs]|Boolean|`$True`||
|InstallChrome|[Install Chrome Browser][chrome-install-docs]|Boolean|`$True`||
|InstallFirefox|[Install Firefox Browser][firefox-install-docs]|Boolean|`$True`||
|InstallMSTeams|[Install Microsoft Teams Client][msteams-install-docs]|Boolean|`$True`||
|InstallSlack|[Install Slack Client][slack-install-docs]|Boolean|`$True`||
|InstallDiscord|[Install Discord][discord-install-docs]|Boolean|`$False`||
|CloneSwellabyRepos|Whether to clone git repositories from the [Swellaby organization on GitHub][github-swellaby-org]|Boolean|`$False`||
|DevWorkspaceRootDirectory|The root directory to use for cloning any repositories|String|`c:\dev`||

[dotnet-core-install-docs]: https://dotnet.microsoft.com/download
[go-install-docs]: https://golang.org/doc/install
[java-jdk-install-docs]: https://www.oracle.com/java/technologies/javase-downloads.html
[maven-install-docs]: https://maven.apache.org/install.html
[gradle-install-docs]: https://gradle.org/install/
[nodejs-install-docs]: https://nodejs.org/en/download/
[python-install-docs]: https://www.python.org/downloads/
[vscode-install-docs]: https://code.visualstudio.com/download
[vs-install-docs]: https://docs.microsoft.com/en-us/visualstudio/install/install-visual-studio?view=vs-2019
[intellij-install-docs]: https://www.jetbrains.com/idea/download/
[git-install-docs]: https://git-scm.com/downloads
[mobaxterm-install-docs]: https://mobaxterm.mobatek.net/download.html
[7zip-install-docs]: https://www.7-zip.org/download.html
[gcloud-install-docs]: https://cloud.google.com/sdk/docs/install
[awscli-install-docs]: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
[az-install-docs]: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
[chrome-install-docs]: https://www.google.com/chrome
[firefox-install-docs]: https://www.mozilla.org/en-US/firefox/new/
[msteams-install-docs]: https://www.microsoft.com/en-us/microsoft-365/microsoft-teams/download-app
[slack-install-docs]: https://slack.com/downloads/windows
[discord-install-docs]: https://discord.com/download
[github-swellaby-org]: https://github.com/swellaby
