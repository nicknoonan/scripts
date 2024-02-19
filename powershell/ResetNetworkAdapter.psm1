function Reset-NetAdapter {
    param(
        [Paramater(Mandatory)]
        [string]$MacAddress
    )
    $adapter = Get-NetAdapter | Where-Object {$_.MacAddress -eq $MacAddress}
    if ($null -eq $adapter) {
        Write-Warning "No adapter found with mac address $MacAddress";
        return;
    }
    Write-Verbose "Disabling network adapter: $MacAddress";
    $adapter | Disable-NetAdapter -Confirm:$false;
    Write-Verbose "Disabled!";

    Write-Verbose "Enabling network adapter: $MacAddress";
    $adapter | Enable-NetAdapter -Confirm:$false;
    Write-Verbose "Enabled!";
}