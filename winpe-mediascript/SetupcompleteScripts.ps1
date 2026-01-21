function Step-InstallSetupCompleteOSDCloudGUI {
    [CmdletBinding()]
    param (
        [System.String]
        $MountPath = $global:BuildMedia.MountPath
    )
    #=================================================
    $Error.Clear()
    Write-Verbose "[$(Get-Date -format G)] [$($MyInvocation.MyCommand)] Start"
    #=================================================
    Write-Verbose "[$(Get-Date -format G)] [$($MyInvocation.MyCommand)] MountPath: $MountPath"
    #=================================================
    $SetupCompletePath = "$MountPath\Windows\Setup\Scripts"
    if (-not (Test-Path -Path $SetupCompletePath)) {
        Write-Host -ForegroundColor DarkGray "[$(Get-Date -format G)] [$($MyInvocation.MyCommand)] Creating SetupComplete Scripts folder at $SetupCompletePath"
        New-Item -Path $SetupCompletePath -ItemType Directory -Force | Out-Null
    }
}

Step-InstallSetupCompleteOSDCloudGUI