<#  
.SYNOPSIS
    This script copies the OSDCloud Json to the OSD powershell folder.    

    Author:  Oliver Grimes
#>
Write-Host -ForegroundColor DarkGray "Starting Copying Configuration json to Lastest OSDCloud Module Path"
$OSDCloudModulePath = Get-OSDCloudModulePath

$OSDCloudJsonPath = Join-Path -Path $OSDCloudModulePath -ChildPath "/workflow/default/os-amd64.json"

Write-Host -ForegroundColor DarkGray "Updating Json entries"
$json = Get-Content -Path $OSDCloudJsonPath -Raw | ConvertFrom-Json

$json.OSLanguageCode.default = "en-gb"
$json.OSEdition.default = "Pro"

Write-Host -ForegroundColor DarkGray "Saving Json to $OSDCloudJsonPath"
$json | ConvertTo-Json | Set-Content -Path $OSDCloudJsonPath -Force