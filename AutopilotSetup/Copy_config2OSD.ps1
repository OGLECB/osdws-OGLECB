<#  
.SYNOPSIS
    This script copies the OSDCloud Json to the OSD powershell folder.    

    Author:  Oliver Grimes
#>
Write-Host -ForegroundColor DarkGray "Updating OSDCloud Module Path"
Update-Module -Name OSDCloud -Force -AllowClobber -SkipPublisherCheck
Import-Module -Name OSDCloud -Force
Write-Host -ForegroundColor DarkGray "Starting Copying Configuration json to Lastest OSDCloud Module Path"
$OSDCloudModulePath = Get-OSDCloudModulePath

$OSDCloudJsonPath = Join-Path -Path $OSDCloudModulePath -ChildPath "/workflow/default/os-amd64.json"

$json = Get-Content -Path $OSDCloudJsonPath -Raw | ConvertFrom-Json

$json.OSLanguageCode.default = "en-gb"
$json.OSLanguageCode.values = "en-gb"
$json.OSEdition.default = "Professional"

$json | ConvertTo-Json | Set-Content -Path $OSDCloudJsonPath -Force