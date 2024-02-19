param (
    [Parameter()]
    [string[]]$Modules = @(
        'ResetNetworkAdapter'
    )
)

$AllModules = Get-ChildItem $PSScriptRoot -Filter "*.psm1";