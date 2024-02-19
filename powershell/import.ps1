param (
    [Parameter()]
    [string[]]$Modules = @(
        'ResetNetworkAdapter'
    ),
    [Parameter()]
    [string]$BaseContentUri = "https://raw.githubusercontent.com/nicknoonan/scripts/main/powershell",
    [Parameter()]
    [string]$InstallLocation = "$(($env:psmodulepath -split ';')[0])/NoonanScripts"
)

if (-not (Test-Path $InstallLocation)) {
    mkdir $InstallLocation
}

foreach ($moduleName in $Modules) {
    $moduleFileName = "$moduleName.psm1";
    $moduleFilePath = "$InstallLocation/$moduleFileName";
    $ContentUri = "$BaseContentUri/$moduleFileName";
    write-host "$moduleFilePath";
    Invoke-WebRequest $ContentUri -OutFile $moduleFilePath;
    Get-Module $moduleName | Remove-Module;
    Import-Module $moduleFilePath -Force;
}