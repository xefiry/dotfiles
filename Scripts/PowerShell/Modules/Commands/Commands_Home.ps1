<#
.SYNOPSIS
  Run "go test -v" and color output
#>
function GO_ColoredTest {
  [alias('gct')]
  param ()

  foreach ($line in $(go test -v)) {
    $line = $line.Replace('PASS', "`e[1;32mPASS`e[0m")
    $line = $line.Replace('FAIL', "`e[1;31mFAIL`e[0m")
    Write-Host $line
  }
}

<#
.SYNOPSIS
  Mount OneDrive with rclone.
  Stop it with `Stop-Process -Name rclone`
#>
function mount_OneDrive {
  if (Test-Path -Path $env:OneDrive) {
    Write-Error "Already mounted on $env:OneDrive"
    return
  }
  
  # https://rclone.org/commands/rclone_mount/
  Start-Process -FilePath 'rclone' -ArgumentList @(
    'mount',
    "--log-file=$env:Tmp\rclone_OneDrivePS.log",
    '--vfs-cache-mode=full',
    '--vfs-cache-max-size=5GiB',
    '--vfs-refresh',
    '--volname=OneDrive',
    "OneDrivePS: $env:OneDrive"
  ) -WindowStyle Hidden
}
