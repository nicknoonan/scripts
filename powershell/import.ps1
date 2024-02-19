param (
    [Parameter()]
    [string[]]$Modules = @(
        'ResetNetworkAdapter'
    ),
    [Parameter()]
    [string]$BaseContentUri = "https://raw.githubusercontent.com/nicknoonan/scripts/main/powershell",
    [Parameter()]
    [string]$InstallLocation = $PSScriptRoot
)

foreach ($moduleName in $Modules) {
    $moduleFileName = "$moduleName.psm1";
    $moduleFilePath = "$InstallLocation/$moduleFileName";
    $ContentUri = "$BaseContentUri/$moduleFileName";
    Invoke-WebRequest $ContentUri -OutFile $moduleFilePath;
    Import-Module $moduleFilePath -Force;
}