#Set GroupTag Variable this is the orderID in Entra, can be used to create Dynamic Groups and is tied to the device through AutoPilot resets
$StoreLocation = ""
while ([string]::IsNullOrWhiteSpace($StoreLocation)) {
    $StoreLocation = Read-Host -Prompt "Enter Store Location no spaces - examples: SpringfieldWest, Eagleville"
    if ([string]::IsNullOrWhiteSpace($StoreLocation)) {
        Write-Host "Store location is mandatory and not be empty. Please provide a value."
    }
}
$Brand = ""
while ([string]::IsNullOrWhiteSpace($Brand)) {
    $Brand = Read-Host -Prompt "Enter Brand, GDF or CODES"
    if ([string]::IsNullOrWhiteSpace($Brand)) {
        Write-Host "Brand is mandatory and not be empty. Please provide a value."
    }
}
$DeviceType = ""
while ([string]::IsNullOrWhiteSpace($DeviceType)) {
    $DeviceType = Read-Host -Prompt "Enter DeviceType or Use, example: Kiosk, POS, LT"
    if ([string]::IsNullOrWhiteSpace($DeviceType)) {
        Write-Host "DeviceType is mandatory and not be empty. Please provide a value."
    }
}

$grouptag = $Brand+$StoreLocation+$DeviceType

$devicename = Read-Host -Prompt "Enter the desired Computer Name - Optional, Default Value is BrandInitial-First5location-DeviceType"

# Check if the computername parameter is provided
if (-not [string]::IsNullOrWhiteSpace($devicename)) {
    $computername = $devicename
} else {
    $computername= "Default value"  # Set a default value if the optional parameter is not provided
}

Set-ExecutionPolicy Unrestricted 
Install-Script Get-WindowsAutoPilotInfo
Get-WindowsAutoPilotInfo -Online -Grouptag $grouptag
