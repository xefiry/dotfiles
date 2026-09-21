Write-Host '
>>> seek_and_destroy'
seek_and_destroy

Write-Host '
>>> chezmoi update'
chezmoi update 2> $null
if (!($?)) {
  Write-Error 'chezmoi update - error, run the command manually'
  Pause
}

# for work, start homedir sync with unison
if ($env:ComputerName -eq 'PS-0568') {
  Write-Host '
>>> chezmoi homedir'
  sync_homedrive
}
else {
  Write-Host '
>>> rclone mount'
  mount_OneDrive
}

Start-Sleep -Seconds 5
