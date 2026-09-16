Write-Host ">>> seek_and_destroy"
seek_and_destroy

Write-Host "
>>> chezmoi update"
chezmoi update 2> $null
if (!($?)) {
  Write-Error "chezmoi update - error, restart this script"
  Pause
} else {
  Start-Sleep -Seconds 5
}
