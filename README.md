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


## Usage
Be sure to use an admin/elevated session to run the script:

With all default parameters:
```powershell
.\SetupWindows.ps1
```

### Parameters
